import 'package:elminiawy/feature/payment/data/model/requestBody/create_order_request.dart';
import 'package:elminiawy/feature/payment/data/model/response/create_order.dart';
import 'package:elminiawy/feature/payment/data/repository/order_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.dart';
part 'payment_cubit.freezed.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._orderRepositoryImplement)
      : super(const PaymentState.initial());
  int selectedIndex = 0;
  String choosePaymentMethod = 'Cash on delivery';
  final OrderRepositoryImplement _orderRepositoryImplement;

  void changeShippingIndex(int index) {
    selectedIndex = index;
    emit(PaymentState.changeShippingIndex(selectedIndex));
  }

  void changePaymentMethod(String choosePayment) {
    choosePaymentMethod = choosePayment;
    emit(PaymentState.choosePayment(choosePaymentMethod));
  }

  Future<void> createCashOrderSummit(String refreshToken) async {
    emit(const PaymentState.createCashOrderLoading());

    final response = await _orderRepositoryImplement.createCashOrder(
        CreateOrderRequestBody(shippingAddress: '', notes: ''));

    response.when(
      success: (response) {
        emit(PaymentState.createCashOrderSuccess(response));
      },
      failure: (error) {
        emit(
          PaymentState.createCashOrderError(
              errorMessage: error.message!, statesCode: error.statusCode!),
        );
      },
    );
  }
}
