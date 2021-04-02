import 'package:animations/animations.dart';
import 'package:bluetooth_scanner/res/color.dart';
import 'package:bluetooth_scanner/ui/screens/device_details.dart';
import 'package:bluetooth_scanner/ui/widget/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterBlue _flutterBlue = FlutterBlue.instance;

  List<ScanResult> devices = [];

  void scan() async {
    print("start scan");
    await _flutterBlue.startScan(timeout: Duration(seconds: 6));

    _flutterBlue.scanResults.listen((results) {
      for (ScanResult result in results) {
        devices.add(result);
        print(result.device.name);
      }

      _flutterBlue.stopScan();

      setState(() {
        print("scan completed");
      });
    }, onDone: () {}, onError: (error) {}, cancelOnError: true);
  }

  @override
  Widget build(BuildContext context) {
    scan();

    double margin = MediaQuery.of(context).size.width * 0.2;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: scan,
      ),
      appBar: AppBar(
        title: Text("Blue",style: appBarTitle),
      ),
      body: Container(
        child: Column(
          children: [
            if (devices.isEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: EmptyState(margin: margin),
              ),
            if (devices.isNotEmpty)
              Expanded(
                  child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  ScanResult result = devices[index];


                  //animate transistion
                  return OpenContainer(
                    closedElevation: 0,
                    transitionDuration: Duration(seconds: 1),
                    openBuilder: (_, close) {
                      return DeviceDetails(
                        scanResult: result,
                        onClose: close,
                      );
                    },
                    closedBuilder: (_, open) {
                      return ListTile(
                          onTap: open,
                          leading: Icon(
                            Icons.phone_android,
                            color: Colors.black,
                          ),
                          title: Text(
                              (result.device.name.isNotEmpty)
                                  ? result.device.name
                                  : "Unknown Device",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500)));
                    },
                  );
                },
              )),
          ],
        ),
      ),
    );
  }
}
