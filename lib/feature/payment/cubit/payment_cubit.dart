import 'package:elminiawy/feature/payment/data/model/requestBody/create_order_request.dart';
import 'package:elminiawy/feature/payment/data/model/response/create_order.dart';
import 'package:elminiawy/feature/payment/data/repository/order_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.dart';
part 'payment_cubit.freezed.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._orderRepositoryImplement)
      : super(const PaymentState.initial());
  int selectedIndex = 0;
  String choosePaymentMethod = 'Cash';
  final OrderRepositoryImplement _orderRepositoryImplement;
  TextEditingController notesController = TextEditingController();
  CreateOrderResponseData? createOrderResponseData;

  void changeShippingIndex(int index) {
    selectedIndex = index;
    emit(PaymentState.changeShippingIndex(selectedIndex));
  }

  void changePaymentMethod(String choosePayment) {
    choosePaymentMethod = choosePayment;
    emit(PaymentState.choosePayment(choosePaymentMethod));
  }

  Future<void> createCashOrderSummit(String shippingAddressId) async {
    emit(const PaymentState.createCashOrderLoading());

    final response = await _orderRepositoryImplement.createCashOrder(
        CreateOrderRequestBody(
            shippingAddress: shippingAddressId,
            notes: notesController.text.trim()));

    response.when(
      success: (response) {
        createOrderResponseData = response.data;
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

  Future<void> ordercancelSummit(String id) async {
    emit(const PaymentState.createCashOrderLoading());

    final response =
        await _orderRepositoryImplement.orderCancelledRepository(id);

    response.when(
      success: (response) {
        createOrderResponseData = response.data;
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
