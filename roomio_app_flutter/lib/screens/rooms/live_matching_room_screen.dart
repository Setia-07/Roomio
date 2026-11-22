import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roomio_app_client/roomio_app_client.dart';
import '../../client.dart';
import '../../theme/roomio_theme.dart';
import '../../widgets/roomio_button.dart';

enum RoomConnectionStatus {
  connected,
  reconnecting,
  disconnected,
}

class LiveMatchingRoomScreen extends StatefulWidget {
  final int roomId;
  final String roomName;

  const LiveMatchingRoomScreen({
    super.key,
    required this.roomId,
    required this.roomName,
  });

  @override
  State<LiveMatchingRoomScreen> createState() => _LiveMatchingRoomScreenState();
}

class _LiveMatchingRoomScreenState extends State<LiveMatchingRoomScreen>
    with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  String? _errorMessage;
  RoomDetailPayload? _roomPayload;
  RoomConnectionStatus _connectionStatus = RoomConnectionStatus.disconnected;

  StreamSubscription<RoomEvent>? _streamSubscription;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;

  // Recent floating reactions list for real-time visual feedback
  final List<_ReactionBannerData> _activeReactions = [];

  @override
  void initState() {
    super.initState();
    _loadInitialRoomData();
    _connectToStream();
  }

  @override
  void dispose() {
    _reconnectTimer?.cancel();
    _streamSubscription?.cancel();
    super.dispose();
  }

  /// Initial fetch of authoritative room details from Serverpod.
  Future<void> _loadInitialRoomData({bool isRefresh = false}) async {
    if (!isRefresh) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
    }

    try {
      final payload = await client.room.getRoomDetails(widget.roomId);
      if (!mounted) return;
      setState(() {
        _roomPayload = payload;
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  /// Connects to the Serverpod real-time WebSocket stream for this room.
  void _connectToStream() {
    _streamSubscription?.cancel();
    setState(() {
      _connectionStatus = RoomConnectionStatus.reconnecting;
    });

    try {
      _streamSubscription = client.room
          .streamRoomEvents(widget.roomId)
          .listen(
            (event) {
              _onRoomEventReceived(event);
            },
            onError: (error) {
              _onStreamError(error);
            },
            onDone: () {
              _onStreamDone();
            },
          );

      setState(() {
        _connectionStatus = RoomConnectionStatus.connected;
        _reconnectAttempts = 0;
      });
    } catch (e) {
      _onStreamError(e);
    }
  }

  void _onRoomEventReceived(RoomEvent event) {
    if (!mounted) return;

    // Show floating reaction or toast
    _showReactionBanner(
      sender: event.senderName,
      message: event.message ?? event.eventType,
      eventType: event.eventType,
    );

    // Refresh state when state-changing events arrive
    switch (event.eventType) {
      case 'member_joined':
      case 'member_left':
      case 'item_shortlisted':
      case 'vote_cast':
        _loadInitialRoomData(isRefresh: true);
        break;
      case 'reaction':
        // Reaction banner is already triggered
        break;
    }
  }

  void _onStreamError(dynamic error) {
    if (!mounted) return;
    setState(() {
      _connectionStatus = RoomConnectionStatus.reconnecting;
    });

    _scheduleReconnect();
  }

  void _onStreamDone() {
    if (!mounted) return;
    setState(() {
      _connectionStatus = RoomConnectionStatus.disconnected;
    });
    _scheduleReconnect();
  }

  void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    _reconnectAttempts++;
    final delaySeconds = (_reconnectAttempts * 2).clamp(2, 10);

    _reconnectTimer = Timer(Duration(seconds: delaySeconds), () {
      if (mounted) {
        _connectToStream();
        _loadInitialRoomData(isRefresh: true);
      }
    });
  }

  void _showReactionBanner({
    required String sender,
    required String message,
    required String eventType,
  }) {
    final item = _ReactionBannerData(
      id: UniqueKey().toString(),
      sender: sender,
      message: message,
      eventType: eventType,
    );

    setState(() {
      _activeReactions.add(item);
    });

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _activeReactions.removeWhere((r) => r.id == item.id);
        });
      }
    });
  }

  Future<void> _castVote(int shortlistItemId, String voteType) async {
    // Optimistic UI update
    if (_roomPayload != null) {
      setState(() {
        for (final card in _roomPayload!.shortlist) {
          if (card.shortlistItem.id == shortlistItemId) {
            final oldVote = card.currentUserVote;
            if (oldVote == voteType) return; // Already voted

            // Decrement previous
            if (oldVote == 'like') {
              card.likes = (card.likes - 1).clamp(0, 999);
            }
            if (oldVote == 'superlike') {
              card.superlikes = (card.superlikes - 1).clamp(0, 999);
            }
            if (oldVote == 'pass') {
              card.passes = (card.passes - 1).clamp(0, 999);
            }

            // Increment new
            if (voteType == 'like') {
              card.likes++;
            }
            if (voteType == 'superlike') {
              card.superlikes++;
            }
            if (voteType == 'pass') {
              card.passes++;
            }

            card.currentUserVote = voteType;
          }
        }
      });
    }

    try {
      await client.room.castVote(shortlistItemId, voteType);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to cast vote: $e'),
          backgroundColor: RoomioColors.rose,
        ),
      );
      // Reconcile with server
      _loadInitialRoomData(isRefresh: true);
    }
  }

  Future<void> _sendQuickReaction(String emoji) async {
    try {
      await client.room.sendRoomMessage(widget.roomId, emoji);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not send reaction: $e'),
          backgroundColor: RoomioColors.rose,
        ),
      );
    }
  }

  void _openShortlistPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _ShortlistPropertyModal(
        roomId: widget.roomId,
        onPropertyAdded: () {
          Navigator.pop(ctx);
          _loadInitialRoomData(isRefresh: true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Property added to shared room!'),
              backgroundColor: RoomioColors.mint,
            ),
          );
        },
      ),
    );
  }

  void _confirmLeaveRoom() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Leave Room?'),
        content: const Text(
          'Are you sure you want to leave this matching room? You will need an invite code to rejoin.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: RoomioColors.rose,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Navigator.pop(ctx);
              try {
                await client.room.leaveRoom(widget.roomId);
                if (!mounted) return;
                Navigator.pop(context); // Go back to rooms list
              } catch (e) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error leaving room: $e'),
                    backgroundColor: RoomioColors.rose,
                  ),
                );
              }
            },
            child: const Text('Leave'),
          ),
        ],
      ),
    );
  }

  void _copyInviteCode(String code) {
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text('Room code $code copied! Share with your flatmates.'),
          ],
        ),
        backgroundColor: RoomioColors.navy,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.roomName,
              style: RoomioTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              children: [
                _buildConnectionBadge(),
                const SizedBox(width: 8),
                if (_roomPayload != null)
                  Text(
                    '${_roomPayload!.members.length} active',
                    style: RoomioTypography.bodyMedium.copyWith(
                      fontSize: 12,
                      color: RoomioColors.textSecondaryLight,
                    ),
                  ),
              ],
            ),
          ],
        ),
        actions: [
          if (_roomPayload != null)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: ActionChip(
                backgroundColor: RoomioColors.primaryContainer,
                side: BorderSide.none,
                avatar: const Icon(
                  Icons.copy_rounded,
                  size: 14,
                  color: RoomioColors.primary,
                ),
                label: Text(
                  _roomPayload!.room.inviteCode,
                  style: RoomioTypography.labelBold.copyWith(
                    color: RoomioColors.primary,
                    letterSpacing: 1.2,
                  ),
                ),
                onPressed: () => _copyInviteCode(_roomPayload!.room.inviteCode),
              ),
            ),
          IconButton(
            tooltip: 'Leave Room',
            icon: const Icon(Icons.logout_rounded, color: RoomioColors.rose),
            onPressed: _confirmLeaveRoom,
          ),
        ],
      ),
      body: Stack(
        children: [
          _buildBody(isDark),

          // Floating reaction overlay notifications
          if (_activeReactions.isNotEmpty)
            Positioned(
              top: 16,
              left: 20,
              right: 20,
              child: Column(
                children: _activeReactions.map((r) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: RoomioColors.navy.withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          r.eventType == 'reaction' ? r.message : '⚡',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            r.eventType == 'reaction'
                                ? '${r.sender} reacted ${r.message}'
                                : r.message,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

          // Bottom quick reaction bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomReactionBar(isDark),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectionBadge() {
    Color color;
    String label;

    switch (_connectionStatus) {
      case RoomConnectionStatus.connected:
        color = RoomioColors.mint;
        label = 'Live';
        break;
      case RoomConnectionStatus.reconnecting:
        color = RoomioColors.amber;
        label = 'Connecting...';
        break;
      case RoomConnectionStatus.disconnected:
        color = RoomioColors.rose;
        label = 'Offline';
        break;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildBody(bool isDark) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: RoomioColors.primary),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: RoomioColors.rose,
              ),
              const SizedBox(height: 12),
              Text(
                'Could not load matching room',
                style: RoomioTypography.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                _errorMessage!,
                textAlign: TextAlign.center,
                style: RoomioTypography.bodyMedium.copyWith(
                  color: RoomioColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 16),
              RoomioButton(
                text: 'Retry',
                onPressed: () => _loadInitialRoomData(),
              ),
            ],
          ),
        ),
      );
    }

    final payload = _roomPayload!;

    return RefreshIndicator(
      color: RoomioColors.primary,
      onRefresh: () => _loadInitialRoomData(isRefresh: true),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 90),
        children: [
          // Room Header Card
          _buildRoomHeaderCard(payload, isDark),
          const SizedBox(height: 16),

          // Participants Section
          _buildParticipantsSection(payload.members, isDark),
          const SizedBox(height: 20),

          // Shortlist Section Header with "+ Shortlist" Action
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shortlisted Properties (${payload.shortlist.length})',
                style: RoomioTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton.icon(
                icon: const Icon(Icons.add_home_rounded, size: 18),
                label: const Text('Add Property'),
                style: TextButton.styleFrom(
                  foregroundColor: RoomioColors.primary,
                ),
                onPressed: _openShortlistPicker,
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Shortlist Items or Empty State
          if (payload.shortlist.isEmpty)
            _buildEmptyShortlistState(isDark)
          else
            ...payload.shortlist.map(
              (card) => _buildShortlistCard(card, isDark),
            ),
        ],
      ),
    );
  }

  Widget _buildRoomHeaderCard(RoomDetailPayload payload, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [RoomioColors.navy, RoomioColors.navyLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: RoomioColors.navy.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.groups_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Collaborative Room',
                    style: RoomioTypography.bodyMedium.copyWith(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () => _copyInviteCode(payload.room.inviteCode),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: RoomioColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.share_rounded,
                        color: Colors.white,
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Code: ${payload.room.inviteCode}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            payload.room.name,
            style: RoomioTypography.titleLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Vote in real time with your potential roommates to find the perfect home.',
            style: RoomioTypography.bodyMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParticipantsSection(List<RoomMember> members, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Roommates in Room (${members.length})',
          style: RoomioTypography.labelBold.copyWith(
            color: RoomioColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 64,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: members.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final member = members[index];
              final initials = member.userName.isNotEmpty
                  ? member.userName.substring(0, 1).toUpperCase()
                  : '?';

              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isDark ? RoomioColors.surfaceDark : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark
                        ? RoomioColors.borderDark
                        : RoomioColors.borderLight,
                  ),
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: RoomioColors.primaryContainer,
                          child: Text(
                            initials,
                            style: const TextStyle(
                              color: RoomioColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 9,
                            height: 9,
                            decoration: BoxDecoration(
                              color: RoomioColors.mint,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          member.userName,
                          style: RoomioTypography.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          'Online',
                          style: TextStyle(
                            fontSize: 11,
                            color: RoomioColors.mint,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyShortlistState(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark ? RoomioColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? RoomioColors.borderDark : RoomioColors.borderLight,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: RoomioColors.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.apartment_rounded,
              color: RoomioColors.primary,
              size: 36,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'No properties shortlisted yet',
            style: RoomioTypography.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Browse available flats and shortlist them here to vote collaboratively with your roommates in real time!',
            textAlign: TextAlign.center,
            style: RoomioTypography.bodyMedium.copyWith(
              color: RoomioColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 16),
          RoomioButton(
            text: 'Browse & Add Properties',
            icon: Icons.add_home_work_rounded,
            onPressed: _openShortlistPicker,
          ),
        ],
      ),
    );
  }

  Widget _buildShortlistCard(RoomShortlistCard card, bool isDark) {
    final listing = card.listing;
    final userVote = card.currentUserVote;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDark ? RoomioColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? RoomioColors.borderDark : RoomioColors.borderLight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Image or Placeholder
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Container(
              height: 140,
              width: double.infinity,
              color: RoomioColors.primaryContainer.withValues(alpha: 0.5),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (listing.imageUrls.isNotEmpty)
                    Image.network(
                      listing.imageUrls.first,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.home_work_rounded,
                        size: 48,
                        color: RoomioColors.primary,
                      ),
                    )
                  else
                    const Center(
                      child: Icon(
                        Icons.home_work_rounded,
                        size: 48,
                        color: RoomioColors.primary,
                      ),
                    ),
                  // Price pill
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: RoomioColors.navy.withValues(alpha: 0.88),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '£${listing.monthlyRent}/mo',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  // Added by badge
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.65),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Added by ${card.shortlistItem.addedByName}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listing.title,
                  style: RoomioTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: RoomioColors.textSecondaryLight,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${listing.neighborhood}, ${listing.city}',
                      style: RoomioTypography.bodyMedium.copyWith(
                        color: RoomioColors.textSecondaryLight,
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${listing.totalBedrooms} Bed · ${listing.totalBathrooms} Bath',
                      style: RoomioTypography.bodyMedium.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: RoomioColors.navy,
                      ),
                    ),
                  ],
                ),

                const Divider(height: 24),

                // Collaborative Voting Bar
                Row(
                  children: [
                    // Like button & count
                    _buildVoteButton(
                      icon: Icons.thumb_up_rounded,
                      label: 'Like',
                      count: card.likes,
                      isActive: userVote == 'like',
                      activeColor: RoomioColors.mint,
                      onTap: () => _castVote(card.shortlistItem.id!, 'like'),
                    ),
                    const SizedBox(width: 8),

                    // Superlike button & count
                    _buildVoteButton(
                      icon: Icons.favorite_rounded,
                      label: 'Super',
                      count: card.superlikes,
                      isActive: userVote == 'superlike',
                      activeColor: RoomioColors.primary,
                      onTap: () =>
                          _castVote(card.shortlistItem.id!, 'superlike'),
                    ),
                    const SizedBox(width: 8),

                    // Pass button & count
                    _buildVoteButton(
                      icon: Icons.thumb_down_rounded,
                      label: 'Pass',
                      count: card.passes,
                      isActive: userVote == 'pass',
                      activeColor: RoomioColors.rose,
                      onTap: () => _castVote(card.shortlistItem.id!, 'pass'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVoteButton({
    required IconData icon,
    required String label,
    required int count,
    required bool isActive,
    required Color activeColor,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isActive
                ? activeColor.withValues(alpha: 0.14)
                : RoomioColors.backgroundLight,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isActive ? activeColor : RoomioColors.borderLight,
              width: isActive ? 1.5 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: isActive ? activeColor : RoomioColors.textSecondaryLight,
              ),
              const SizedBox(width: 6),
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: isActive ? activeColor : RoomioColors.textPrimaryLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomReactionBar(bool isDark) {
    const emojis = ['🎉', '❤️', '🔥', '🏠', '👏', '😍'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? RoomioColors.surfaceDark : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'React:',
              style: RoomioTypography.labelBold.copyWith(
                color: RoomioColors.textSecondaryLight,
                fontSize: 12,
              ),
            ),
            ...emojis.map((emoji) {
              return InkWell(
                onTap: () => _sendQuickReaction(emoji),
                borderRadius: BorderRadius.circular(24),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    emoji,
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _ReactionBannerData {
  final String id;
  final String sender;
  final String message;
  final String eventType;

  _ReactionBannerData({
    required this.id,
    required this.sender,
    required this.message,
    required this.eventType,
  });
}

/// Modal sheet for picking available property listings to shortlist into the room.
class _ShortlistPropertyModal extends StatefulWidget {
  final int roomId;
  final VoidCallback onPropertyAdded;

  const _ShortlistPropertyModal({
    required this.roomId,
    required this.onPropertyAdded,
  });

  @override
  State<_ShortlistPropertyModal> createState() =>
      _ShortlistPropertyModalState();
}

class _ShortlistPropertyModalState extends State<_ShortlistPropertyModal> {
  bool _isLoading = true;
  List<PropertyListing> _listings = [];
  String? _error;
  int? _shortlistingId;

  @override
  void initState() {
    super.initState();
    _fetchListings();
  }

  Future<void> _fetchListings() async {
    try {
      final results = await client.listing.searchListings(limit: 20, offset: 0);
      if (!mounted) return;
      setState(() {
        _listings = results;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _addToList(int listingId) async {
    setState(() => _shortlistingId = listingId);
    try {
      await client.room.shortlistListing(widget.roomId, listingId);
      if (!mounted) return;
      widget.onPropertyAdded();
    } catch (e) {
      if (!mounted) return;
      setState(() => _shortlistingId = null);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to shortlist: $e'),
          backgroundColor: RoomioColors.rose,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'Shortlist a Property to Room',
                  style: RoomioTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: RoomioColors.primary,
                    ),
                  )
                : _error != null
                ? Center(child: Text('Error: $_error'))
                : _listings.isEmpty
                ? const Center(
                    child: Text('No listings available to shortlist'),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: _listings.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = _listings[index];
                      final isAdding = _shortlistingId == item.id;

                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: RoomioColors.borderLight),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: RoomioColors.primaryContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.home_rounded,
                                color: RoomioColors.primary,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: RoomioTypography.titleMedium
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    '£${item.monthlyRent}/mo · ${item.neighborhood}, ${item.city}',
                                    style: RoomioTypography.bodyMedium.copyWith(
                                      fontSize: 12,
                                      color: RoomioColors.textSecondaryLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: RoomioColors.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                              ),
                              onPressed: isAdding
                                  ? null
                                  : () => _addToList(item.id!),
                              child: isAdding
                                  ? const SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text('Add'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
