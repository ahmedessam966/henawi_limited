import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:henawi_limited/Services/API/notification_services.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';
import 'package:provider/provider.dart';

import '../../Services/Local/user_model.dart';

class GlobalNotificationDialog extends StatelessWidget {
  final UserModel? user;
  const GlobalNotificationDialog({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationServices>(builder: (context, notifier, _) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Dialog(
          child: SizedBox(
            height: context.screenHeight * 0.55,
            width: context.screenWidth * 0.45,
            child: Padding(
              padding: EdgeInsets.all(context.screenRatio * 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Notifications',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                              indent: context.screenWidth * 0.02,
                            ),
                        padding: EdgeInsets.all(context.screenRatio * 8),
                        itemCount: notifier.notificationsList.length,
                        itemBuilder: (context, index) {
                          final notification = notifier.notificationsList[index];
                          return ListTile(
                            title: Text(notification.sender),
                            subtitle: Text(notification.content),
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '10 Oct.',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text('13:18', style: Theme.of(context).textTheme.bodyMedium)
                              ],
                            ),
                            trailing: notification.seen
                                ? TextButton(
                                    onPressed: () {},
                                    child: Text('Mark Unread', style: Theme.of(context).textTheme.bodyMedium))
                                : TextButton(
                                    onPressed: () {},
                                    child: Text('Mark Read', style: Theme.of(context).textTheme.bodyMedium)),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
