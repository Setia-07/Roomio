import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class NotificationEndpoint extends Endpoint {
  /// Fetches notifications for the current user.
  Future<List<AppNotification>> getMyNotifications(
    Session session, {
    int limit = 30,
    int offset = 0,
  }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    return await AppNotification.db.find(
      session,
      where: (t) => t.recipientUserId.equals(authInfo.userIdentifier),
      limit: limit.clamp(1, 100),
      offset: offset.clamp(0, 10000),
      orderBy: (t) => t.createdAt.desc(),
    );
  }

  /// Marks a specific notification as read.
  Future<bool> markAsRead(Session session, int notificationId) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final notification = await AppNotification.db.findById(
      session,
      notificationId,
    );
    if (notification == null ||
        notification.recipientUserId != authInfo.userIdentifier) {
      return false;
    }

    final updated = notification.copyWith(isRead: true);
    await AppNotification.db.updateRow(session, updated);
    return true;
  }

  /// Marks all notifications for current user as read.
  Future<void> markAllAsRead(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw RoomioException(message: 'Authentication required', code: 401);
    }

    final unread = await AppNotification.db.find(
      session,
      where: (t) =>
          t.recipientUserId.equals(authInfo.userIdentifier) &
          t.isRead.equals(false),
    );

    for (final item in unread) {
      await AppNotification.db.updateRow(session, item.copyWith(isRead: true));
    }
  }

  /// Gets the count of unread notifications.
  Future<int> getUnreadCount(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) return 0;

    return await AppNotification.db.count(
      session,
      where: (t) =>
          t.recipientUserId.equals(authInfo.userIdentifier) &
          t.isRead.equals(false),
    );
  }
}
