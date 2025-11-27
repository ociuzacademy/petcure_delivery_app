import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:petcure_delivery_app/core/exports/bloc_exports.dart';
import 'package:petcure_delivery_app/modules/home_module/view/home_page.dart';
import 'package:petcure_delivery_app/modules/q_r_scanner_module/utils/q_r_scanner_helper.dart';
import 'package:petcure_delivery_app/widgets/loaders/overlay_loader.dart';
import 'package:petcure_delivery_app/widgets/snackbars/custom_snack_bar.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const QRScannerPage());
}

class _QRScannerPageState extends State<QRScannerPage> {
  late final QRScannerHelper _helper;
  final MobileScannerController controller = MobileScannerController();
  bool _isScanned = false;

  @override
  void initState() {
    super.initState();
    _helper = QRScannerHelper(context: context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: BlocListener<CompleteDeliveryBloc, CompleteDeliveryState>(
        listener: (context, state) {
          switch (state) {
            case CompleteDeliveryLoading _:
              OverlayLoader.show(context, message: 'Confirming delivery...');
              break;
            case CompleteDeliverySuccess(:final response):
              OverlayLoader.hide();
              CustomSnackBar.showSuccess(context, message: response.message);
              Navigator.pushAndRemoveUntil(
                context,
                HomePage.route(),
                (_) => false,
              );
              break;
            case CompleteDeliveryError(:final error):
              OverlayLoader.hide();
              CustomSnackBar.showError(context, message: error);
              break;
            default:
              OverlayLoader.hide();
              break;
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              // Back Button & Title
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Scan Order QR Code',
                    style: TextStyle(
                      color: Color(0xFFE7F6F2),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // QR Scanner with overlay
              Expanded(
                child: Center(
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: MobileScanner(
                        controller: controller,
                        onDetect: (capture) {
                          if (_isScanned) return;
                          final bool didScan = _helper.onDetect(
                            capture,
                            controller,
                          );
                          if (didScan) {
                            setState(() {
                              _isScanned = true;
                            });
                          }
                        },
                        overlayBuilder: (context, constraints) => CustomPaint(
                          size: Size(
                            constraints.maxWidth,
                            constraints.maxHeight,
                          ),
                          painter: ScannerOverlayShape(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom overlay shape for blue corners
class ScannerOverlayShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.cyanAccent
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const cornerLength = 30.0;

    // Top-left
    canvas.drawLine(const Offset(0, 0), const Offset(cornerLength, 0), paint);
    canvas.drawLine(const Offset(0, 0), const Offset(0, cornerLength), paint);

    // Top-right
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width - cornerLength, 0),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(size.width, cornerLength),
      paint,
    );

    // Bottom-left
    canvas.drawLine(
      Offset(0, size.height),
      Offset(0, size.height - cornerLength),
      paint,
    );
    canvas.drawLine(
      Offset(0, size.height),
      Offset(cornerLength, size.height),
      paint,
    );

    // Bottom-right
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width - cornerLength, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width, size.height - cornerLength),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
