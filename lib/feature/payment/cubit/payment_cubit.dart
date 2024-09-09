import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.dart';
part 'payment_cubit.freezed.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(const PaymentState.initial());
  int selectedIndex = 0;
  String choosePaymentMethod = 'Cash on delivery';

  void changeShippingIndex(int index) {
    selectedIndex = index;
    emit(PaymentState.changeShippingIndex(selectedIndex));
  }

  void changePaymentMethod(String choosePayment) {
    choosePaymentMethod = choosePayment;
    emit(PaymentState.choosePayment(choosePaymentMethod));
  }
}
