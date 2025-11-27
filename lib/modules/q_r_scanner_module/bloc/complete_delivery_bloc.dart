import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_delivery_app/modules/q_r_scanner_module/models/confirm_delivery_response_model.dart';
import 'package:petcure_delivery_app/modules/q_r_scanner_module/services/q_r_scanner_services.dart';

part 'complete_delivery_event.dart';
part 'complete_delivery_state.dart';
part 'complete_delivery_bloc.freezed.dart';

class CompleteDeliveryBloc
    extends Bloc<CompleteDeliveryEvent, CompleteDeliveryState> {
  CompleteDeliveryBloc() : super(const CompleteDeliveryInitial()) {
    on<_CompletingDelivery>(_onCompletingDelivery);
  }

  Future<void> _onCompletingDelivery(
    _CompletingDelivery event,
    Emitter<CompleteDeliveryState> emit,
  ) async {
    emit(const CompleteDeliveryState.loading());
    try {
      final response = await QRScannerServices.confirmDelivery(
        orderId: event.orderId,
      );
      emit(CompleteDeliveryState.success(response));
    } catch (error) {
      emit(CompleteDeliveryState.error(error.toString()));
    }
  }
}
