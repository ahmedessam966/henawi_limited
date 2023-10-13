import 'package:flutter/material.dart';
import 'package:henawi_limited/providers.dart';
import 'package:provider/provider.dart';

class ServicesInitiator with ChangeNotifier {
  Future initializeSalesManagerServices(BuildContext context) async {
    final user = Provider.of<AuthenticationServices>(context, listen: false).currentUserModel;
    await Provider.of<NotificationServices>(context, listen: false).getUserNotification(user, context);
  }
}
