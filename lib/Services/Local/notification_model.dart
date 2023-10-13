class NotificationModel {
  final String notificationID;
  final String content;
  final String sender;
  final String date;
  final String type;
  final bool seen;

  NotificationModel(
      {required this.notificationID,
      required this.content,
      required this.sender,
      required this.date,
      required this.type,
      required this.seen});
}
