import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:petcure_delivery_app/modules/q_r_scanner_module/bloc/complete_delivery_bloc.dart';

class QRScannerHelper {
  final BuildContext context;
  QRScannerHelper({required this.context});

  bool onDetect(BarcodeCapture capture, MobileScannerController controller) {
    final Barcode? barcode = capture.barcodes.isNotEmpty
        ? capture.barcodes.first
        : null;
    final String? code = barcode?.rawValue;
    if (code != null) {
      controller.stop();

      // Extract order ID from QR code
      final int? orderId = _extractOrderId(code);

      if (orderId == null) {
        _showInvalidQRCodeDialog();
        return true;
      }

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Confirm Delivery'),
          content: Text(
            'Are you sure you want to complete delivery for Order #$orderId?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                final CompleteDeliveryBloc completeDeliveryBloc = context
                    .read<CompleteDeliveryBloc>();
                completeDeliveryBloc.add(
                  CompleteDeliveryEvent.completingDelivery(orderId),
                );
              },
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
      return true;
    }
    return false;
  }

  int? _extractOrderId(String qrCodeData) {
    try {
      // Try to parse the QR code data as JSON
      final Map<String, dynamic> jsonData = jsonDecode(qrCodeData);
      if (jsonData.containsKey('orderId')) {
        return int.tryParse(jsonData['orderId'].toString());
      }
      if (jsonData.containsKey('order_id')) {
        return int.tryParse(jsonData['order_id'].toString());
      }
    } catch (e) {
      // If not JSON, try to extract order ID from text
      final RegExp orderIdRegex = RegExp(
        r'Order ID:?\s*#?(\d+)',
        caseSensitive: false,
      );
      final Match? match = orderIdRegex.firstMatch(qrCodeData);
      if (match != null) {
        return int.tryParse(match.group(1)!);
      }

      // Try to parse the entire string as order ID
      return int.tryParse(qrCodeData);
    }
    return null;
  }

  void _showInvalidQRCodeDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Invalid QR Code'),
        content: const Text(
          'The scanned QR code does not contain a valid order ID. '
          'Please scan a valid order QR code.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
