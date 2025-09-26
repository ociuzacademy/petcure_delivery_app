import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ShopQRScannerHelper {
  final BuildContext context;
  ShopQRScannerHelper({required this.context});

  bool onDetect(BarcodeCapture capture, MobileScannerController controller) {
    final Barcode? barcode = capture.barcodes.isNotEmpty
        ? capture.barcodes.first
        : null;
    final String? code = barcode?.rawValue;
    if (code != null) {
      controller.stop();

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Scanned QR Code'),
          content: Text(code),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return true;
    }
    return false;
  }
}
