import 'package:flutter/material.dart';
import 'package:lanworker_mobile/utils/wrapped_mobile_scanner.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanPage extends StatefulWidget {
  final Function(Barcode? result)? completed;

  const ScanPage({
    Key? key,
    this.completed,
  }) : super(key: key);

  static Future<String?> navigatorPush(context) {
    return Navigator.of(context)
        .push<String>(MaterialPageRoute(builder: (context) => ScanPage()));
  }

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner')),
      body: WrappedMobileScanner(
        // fit: BoxFit.contain,
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.normal,
          facing: CameraFacing.back,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            Navigator.pop(context, barcode.rawValue);
          }
        },
      ),
    );
  }
}
