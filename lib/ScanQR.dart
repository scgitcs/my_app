import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/AddMachine.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:my_app/ResultScreen.dart';

class ScanQR extends StatefulWidget{
  const ScanQR({super.key});
  @override
  State<ScanQR> createState() {
    return _ScanQRState();
  }
}

class _ScanQRState extends State<ScanQR>{
  final GlobalKey qrkey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  @override
  void reassemble(){
    super.reassemble();
    if (Platform.isAndroid){
      controller!.pauseCamera();
    } else if (Platform.isIOS){
      controller!.resumeCamera();
    }
  }


  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 400.0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "QR Scanner",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text('Place the QR code in the area',
                        style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Scanning will be started automatically',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),),
                    ],
                  ),
                ),
            ),
            Expanded(
              flex: 4,
              child: QRView(
                key: qrkey,
                onQRViewCreated: onQRViewCamera,
                overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: scanArea),
                // onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),

              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text("Scan Your Machine's QR Code ",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void onQRViewCamera(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });
      if(result != null) {
        await controller.pauseCamera();
        Navigator.pop(context, result!.code);
        await controller.resumeCamera();
      }
    });
    @override
    void dispose() {
      controller?.dispose();
      super.dispose();
    }
  }
}