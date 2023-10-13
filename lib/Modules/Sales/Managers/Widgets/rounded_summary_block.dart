import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:henawi_limited/Services/Local/dimensions.dart';

class RoundedSummaryBlock extends StatelessWidget {
  final String blockTitle;
  final Color blockColor;
  final Color circleColor;
  final String blockSub;
  final IconData blockIcon;
  final dynamic onPressed;
  final Future loader;
  const RoundedSummaryBlock({
    super.key,
    required this.blockTitle,
    required this.blockColor,
    required this.circleColor,
    required this.blockSub,
    required this.blockIcon,
    this.onPressed,
    required this.loader,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(context.screenRatio * 10),
      splashColor: Colors.black12,
      onTap: onPressed,
      child: Container(
        height: context.screenHeight / 4.9,
        width: context.screenWidth / 9.9,
        decoration:
            BoxDecoration(color: blockColor, borderRadius: BorderRadius.circular(context.screenRatio * 7)),
        child: FutureBuilder(
            future: loader,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SpinKitSpinningLines(
                    color: Colors.black,
                    size: context.screenRatio * 15,
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: context.screenRatio * 13,
                        backgroundColor: circleColor,
                        child: Icon(
                          blockIcon,
                          color: Colors.white,
                          size: context.screenRatio * 15,
                        ),
                      ),
                      const Spacer(),
                      FittedBox(
                        child: Text(
                          blockTitle,
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: context.screenRatio * 10),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          blockSub,
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: context.screenRatio * 8.5),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
