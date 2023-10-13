import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:henawi_limited/Global/Widgets/global_notification_dialog.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';
import 'package:henawi_limited/providers.dart';
import 'package:provider/provider.dart';

class HorizontalNavBarWidget extends StatelessWidget {
  const HorizontalNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationServices>(builder: (context, authProvider, _) {
      return SizedBox(
        height: 80,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.015),
          child: Row(
            children: [
              SizedBox(
                width: context.screenWidth * 0.06,
                height: context.screenHeight * 0.08,
                child: Image.asset('assets/images/logo-no-background.png', fit: BoxFit.contain),
              ),
              const Spacer(),
              Text(
                'Sales Dashboard',
                style: GoogleFonts.ubuntu(fontWeight: FontWeight.w700, fontSize: context.screenRatio * 14),
              ),
              const Spacer(),
              Container(
                width: context.screenWidth * 0.4,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(context.screenRatio * 8)),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Search here...',
                      hintStyle: TextStyle(fontSize: context.screenRatio * 9),
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
              const Spacer(),
              Container(
                height: context.screenHeight * 0.065,
                width: context.screenWidth * 0.035,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(context.screenRatio * 8),
                    color: Colors.grey.shade300),
                child: IconButton(
                  tooltip: 'Notifications',
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(context.screenRatio * 8),
                      ),
                    ),
                  ),
                  enableFeedback: true,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  color: Colors.black,
                  onPressed: () async {
                    await Provider.of<NotificationServices>(context, listen: false)
                        .getUserNotification(authProvider.currentUserModel, context);
                    // ignore: use_build_context_synchronously
                    await showAdaptiveDialog(
                        context: context,
                        builder: (context) {
                          return GlobalNotificationDialog(user: authProvider.currentUserModel);
                        });
                  },
                  icon: Provider.of<NotificationServices>(context, listen: true).notificationsList.isEmpty
                      ? const Icon(Icons.notifications_outlined)
                      : const Icon(
                          Icons.notifications_active_rounded,
                          color: Color(0xaa9B870D),
                        ),
                ),
              ),
              const Spacer(),
              Container(
                height: context.screenHeight * 0.065,
                width: context.screenWidth * 0.035,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(context.screenRatio * 8),
                    color: Colors.grey.shade300),
                child: IconButton(
                  tooltip: 'Preferences',
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(context.screenRatio * 8),
                      ),
                    ),
                  ),
                  enableFeedback: true,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  color: Colors.black,
                  onPressed: () async {},
                  icon: const Icon(CupertinoIcons.bars),
                ),
              ),
              const Spacer(),
              CircleAvatar(
                radius: context.screenRatio * 12,
                backgroundImage: NetworkImage(
                    '${DatabaseServices.pathToFilesBucket}/${authProvider.currentUserModel?.userID}/${authProvider.currentUserModel?.profileImage}'),
              ),
              SizedBox(
                width: context.screenWidth * 0.01,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authProvider.currentUserModel!.userName.split(' ')[0],
                    style: GoogleFonts.ubuntu(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  Text(
                    authProvider.currentUserModel!.position,
                    style: GoogleFonts.ubuntu(color: Colors.grey.shade700),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
