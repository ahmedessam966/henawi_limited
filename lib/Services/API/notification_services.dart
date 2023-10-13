// ignore_for_file: use_build_context_synchronously, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:henawi_limited/Services/Local/notification_model.dart';
import 'package:henawi_limited/Services/Local/user_model.dart';
import 'package:henawi_limited/providers.dart';
import 'package:pocketbase/pocketbase.dart';

class NotificationServices with ChangeNotifier {
  final List<NotificationModel> _notificationList = [];
  List<NotificationModel> get notificationsList => _notificationList;

  final List _fetchedID = [];

  Future getUserNotification(UserModel? user, BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    try {
      await pb.collection('NOTIFICATIONS').getList(filter: 'Receiver = "${user?.userID}"').then((value) {
        value.items.forEach((element) async {
          final String sender = await pb
              .collection('StaffAuth')
              .getOne(element.data['Sender'])
              .then((value) => value.data['Name']);

          if (_fetchedID.contains(value.items.last.id)) {
          } else {
            _fetchedID.add(value.items.last.id);
            _notificationList.add(
              NotificationModel(
                  notificationID: value.items.last.id,
                  content: value.items.last.data['Content'],
                  sender: sender,
                  date: value.items.last.data['Date'],
                  type: value.items.last.data['Type'],
                  seen: value.items.last.data['Seen']),
            );
            notifyListeners();
          }
        });
      });
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
    }
  }

  Future markNotificationSeen(NotificationModel notification, BuildContext context, bool value) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    try {
      await pb.collection('NOTIFICATIONS').update(notification.notificationID, body: {'Seen': value});
      _notificationList.remove(notification);
      _fetchedID.remove(notification.notificationID);
      notifyListeners();
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
    }
  }
}
