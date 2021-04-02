import 'package:bluetooth_scanner/res/color.dart';
import 'package:bluetooth_scanner/util/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceDetails extends StatelessWidget {
  final ScanResult scanResult;
  final Function onClose;

  const DeviceDetails({Key key, this.onClose, this.scanResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: onClose,
        ),
        title: Text(
          "Device Info",
          style: appBarTitle,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                  (scanResult.device.name.isNotEmpty)
                      ? scanResult.device.name
                      : "Unknown Device",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: Sizing.textSize(context, 3))),
            ),
            Center(
              child: Text(
                scanResult.device.id.toString(),
                style: GoogleFonts.poppins(
                    color: Colors.black, fontSize: Sizing.textSize(context, 5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
