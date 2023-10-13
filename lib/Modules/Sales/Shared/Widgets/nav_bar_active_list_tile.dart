import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';

class NavBarActiveListTile extends StatelessWidget {
  final String tileTitle;
  final IconData tileIcon;
  final dynamic onTap;
  const NavBarActiveListTile({super.key, required this.tileTitle, required this.tileIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth / 5,
      height: context.screenHeight / 13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xaa321E75).withOpacity(1), const Color(0xaa6633CC).withOpacity(1)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(4, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth / 100),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              tileIcon,
              color: Colors.white,
              size: context.screenRatio * 12,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              tileTitle,
              style: GoogleFonts.ubuntu(
                  fontSize: context.screenRatio * 9, fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
