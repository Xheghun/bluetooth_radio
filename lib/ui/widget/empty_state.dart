import 'package:bluetooth_scanner/util/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    Key key,
    @required this.margin,
  }) : super(key: key);

  final double margin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/searching.svg",
            width: 150,
            height: 150,
          ),
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: margin, vertical: 10),
            child: Text(
              "Ops! no device available\npress the scan button to search for available devices",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: Colors.black45,
                  fontSize: Sizing.textSize(context, 4)),
            ),
          )
        ],
      ),
    );
  }
}