import 'package:mobile_scanner/mobile_scanner.dart';

/// Created due to this issue:
/// https://github.com/juliansteenbakker/mobile_scanner/issues/510
class WrappedMobileScanner extends MobileScanner {
  WrappedMobileScanner({super.key, required onDetect, controller})
      : super(onDetect: wrappedOnDetect(onDetect), controller: controller);

  static wrappedOnDetect(onDetect) {
    bool invoked = false;
    return (BarcodeCapture capture) {
      if (!invoked) onDetect(capture);
      invoked = true;
    };
  }
}
