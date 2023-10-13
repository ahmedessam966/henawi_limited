import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';

class NavBarInactiveListTile extends StatelessWidget {
  final String tileTitle;
  final IconData tileIcon;
  final dynamic onTap;
  const NavBarInactiveListTile({super.key, required this.tileTitle, required this.tileIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.screenRatio * 6),
      ),
      leading: Icon(
        tileIcon,
        color: Colors.black,
        size: context.screenRatio * 12,
      ),
      title: Text(
        tileTitle,
        style: GoogleFonts.ubuntu(
            fontSize: context.screenRatio * 9, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}
