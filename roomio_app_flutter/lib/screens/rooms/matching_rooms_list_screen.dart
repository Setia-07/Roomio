import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roomio_app_client/roomio_app_client.dart';
import '../../client.dart';
import '../../theme/roomio_theme.dart';
import '../../widgets/roomio_button.dart';
import 'live_matching_room_screen.dart';

class MatchingRoomsListScreen extends StatefulWidget {
  const MatchingRoomsListScreen({super.key});

  @override
  State<MatchingRoomsListScreen> createState() =>
      _MatchingRoomsListScreenState();
}

class _MatchingRoomsListScreenState extends State<MatchingRoomsListScreen> {
  bool _isLoading = true;
  String? _errorMessage;
  List<MatchingRoom> _rooms = [];

  @override
  void initState() {
    super.initState();
    _loadRooms();
  }

  Future<void> _loadRooms() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final results = await client.room.getMyRooms();
      if (!mounted) return;
      setState(() {
        _rooms = results;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  void _openCreateRoomDialog() {
    final nameController = TextEditingController();
    bool isSubmitting = false;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: RoomioColors.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.add_home_rounded,
                    color: RoomioColors.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text('Create Matching Room'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Give your room a memorable name so your potential flatmates recognize it.',
                  style: RoomioTypography.bodyMedium.copyWith(
                    color: RoomioColors.textSecondaryLight,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Room Name',
                    hintText: 'e.g. Camden 2-Bed Hunt',
                    prefixIcon: Icon(Icons.home_work_outlined),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: RoomioColors.primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: isSubmitting
                    ? null
                    : () async {
                        final name = nameController.text.trim();
                        if (name.isEmpty) return;

                        setDialogState(() => isSubmitting = true);
                        try {
                          final newRoom = await client.room.createRoom(name);
                          if (!ctx.mounted) return;
                          Navigator.pop(ctx);
                          _loadRooms();

                          if (!mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LiveMatchingRoomScreen(
                                roomId: newRoom.id!,
                                roomName: newRoom.name,
                              ),
                            ),
                          );
                        } catch (e) {
                          setDialogState(() => isSubmitting = false);
                          if (!ctx.mounted) return;
                          ScaffoldMessenger.of(ctx).showSnackBar(
                            SnackBar(
                              content: Text('Failed to create room: $e'),
                              backgroundColor: RoomioColors.rose,
                            ),
                          );
                        }
                      },
                child: isSubmitting
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Create Room'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _openJoinRoomDialog() {
    final codeController = TextEditingController();
    bool isSubmitting = false;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: RoomioColors.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.vpn_key_rounded,
                    color: RoomioColors.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text('Join with Room Code'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter the 6-character room code shared by your friend or flatmate.',
                  style: RoomioTypography.bodyMedium.copyWith(
                    color: RoomioColors.textSecondaryLight,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: codeController,
                  autofocus: true,
                  textCapitalization: TextCapitalization.characters,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'ABCDEF',
                    counterText: '',
                    prefixIcon: Icon(Icons.tag_rounded),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: RoomioColors.navy,
                  foregroundColor: Colors.white,
                ),
                onPressed: isSubmitting
                    ? null
                    : () async {
                        final code = codeController.text.trim();
                        if (code.length != 6) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please enter a valid 6-character code',
                              ),
                              backgroundColor: RoomioColors.rose,
                            ),
                          );
                          return;
                        }

                        setDialogState(() => isSubmitting = true);
                        try {
                          final joinedRoom = await client.room
                              .joinRoomByInviteCode(code);
                          if (!ctx.mounted) return;
                          Navigator.pop(ctx);
                          _loadRooms();

                          if (!mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LiveMatchingRoomScreen(
                                roomId: joinedRoom.id!,
                                roomName: joinedRoom.name,
                              ),
                            ),
                          );
                        } catch (e) {
                          setDialogState(() => isSubmitting = false);
                          if (!ctx.mounted) return;
                          ScaffoldMessenger.of(ctx).showSnackBar(
                            SnackBar(
                              content: Text('Could not join room: $e'),
                              backgroundColor: RoomioColors.rose,
                            ),
                          );
                        }
                      },
                child: isSubmitting
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Join Room'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _copyCode(String code) {
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Room code $code copied to clipboard!'),
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
      body: RefreshIndicator(
        color: RoomioColors.primary,
        onRefresh: _loadRooms,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Welcome Hero Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [RoomioColors.navy, RoomioColors.navyLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
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
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: RoomioColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.groups_rounded,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Team Up Rooms',
                        style: RoomioTypography.titleLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Collaborate with potential flatmates in real time. Shortlist properties together, vote on favorites, and synchronize decisions instantly across devices.',
                    style: RoomioTypography.bodyMedium.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.add_rounded, size: 18),
                          label: const Text('Create Room'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: RoomioColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: _openCreateRoomDialog,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.vpn_key_rounded, size: 18),
                          label: const Text('Join by Code'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white60),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: _openJoinRoomDialog,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Section Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Active Rooms (${_rooms.length})',
                  style: RoomioTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  tooltip: 'Refresh',
                  icon: const Icon(Icons.refresh_rounded, size: 20),
                  onPressed: _loadRooms,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Room list / State
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(40),
                child: Center(
                  child: CircularProgressIndicator(color: RoomioColors.primary),
                ),
              )
            else if (_errorMessage != null)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: RoomioColors.roseContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'Failed to load rooms: $_errorMessage',
                      style: const TextStyle(color: RoomioColors.rose),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _loadRooms,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              )
            else if (_rooms.isEmpty)
              _buildEmptyRoomsState(isDark)
            else
              ..._rooms.map((room) => _buildRoomCard(room, isDark)),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyRoomsState(bool isDark) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
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
              Icons.group_work_rounded,
              color: RoomioColors.primary,
              size: 40,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'No matching rooms yet',
            style: RoomioTypography.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Create your first collaborative room or enter an invite code to team up with flatmates in real-time!',
            textAlign: TextAlign.center,
            style: RoomioTypography.bodyMedium.copyWith(
              color: RoomioColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoomioButton(
                text: 'Create Room',
                icon: Icons.add_rounded,
                width: 150,
                onPressed: _openCreateRoomDialog,
              ),
              const SizedBox(width: 12),
              RoomioButton(
                text: 'Join Code',
                variant: RoomioButtonVariant.outline,
                icon: Icons.vpn_key_rounded,
                width: 140,
                onPressed: _openJoinRoomDialog,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoomCard(MatchingRoom room, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? RoomioColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? RoomioColors.borderDark : RoomioColors.borderLight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LiveMatchingRoomScreen(
                roomId: room.id!,
                roomName: room.name,
              ),
            ),
          ).then((_) => _loadRooms());
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: RoomioColors.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.meeting_room_rounded,
                  color: RoomioColors.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room.name,
                      style: RoomioTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => _copyCode(room.inviteCode),
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: RoomioColors.backgroundLight,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: RoomioColors.borderLight,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.copy_rounded,
                                  size: 11,
                                  color: RoomioColors.textSecondaryLight,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  room.inviteCode,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: RoomioColors.navy,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Created ${_formatDate(room.createdAt)}',
                          style: RoomioTypography.bodyMedium.copyWith(
                            fontSize: 12,
                            color: RoomioColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: RoomioColors.textMutedLight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.day}/${dt.month}/${dt.year}';
  }
}
