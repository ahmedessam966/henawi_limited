// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';
import 'package:henawi_limited/providers.dart';
import 'package:provider/provider.dart';

class GlobalLoaderAnimation {
  static Future<void> showProgressiveTransition(
    BuildContext context,
  ) async {
    final user = Provider.of<AuthenticationServices>(context, listen: false).currentUserModel;
    switch (user?.position) {
      case 'Sales Manager':
        final provider = Provider.of<SalesManagerController>(context, listen: false);
        Future.wait([
          provider.getQuarterAnnualRevenue(context),
          provider.getDemandedAndSold(context),
          provider.getTotalGrossPerMonth(context),
          provider.getTopAchievers(context),
          Provider.of<NotificationServices>(context, listen: false).getUserNotification(user, context)
        ]);
        break;
    }
    return showAdaptiveDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog.adaptive(
              backgroundColor: Colors.white,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpinKitCircle(
                    size: context.screenRatio * 20,
                    color: Colors.black,
                  ),
                  Text(
                    'Loading Interface Tools',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class CustomLoaderAnimation {
  static Future<void> showProgressiveTransition(
      BuildContext context, List<Future> operations, String loaderTitle) async {
    Future.wait(operations);
    return showAdaptiveDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog.adaptive(
              backgroundColor: Colors.white,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpinKitCircle(
                    size: context.screenRatio * 20,
                    color: Colors.black,
                  ),
                  Text(
                    loaderTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
