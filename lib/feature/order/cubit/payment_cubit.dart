import 'package:elminiawy/feature/order/data/model/requestBody/create_order_request.dart';
import 'package:elminiawy/feature/order/data/model/response/create_order.dart';
import 'package:elminiawy/feature/order/data/model/response/get_order.dart';
import 'package:elminiawy/feature/order/data/repository/order_repo.dart';
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

  Future<void> getCompleteOrdersSummit() async {
    emit(const PaymentState.getCompleteOrdersLoading());

    final response =
        await _orderRepositoryImplement.getAllOrderCompleteRepository();

    response.when(
      success: (response) {
        emit(PaymentState.getCompleteOrdersSuccess(response));
      },
      failure: (error) {
        emit(
          PaymentState.getCompleteOrdersError(
              errorMessage: error.message!, statesCode: error.statusCode!),
        );
      },
    );
  }

  Future<void> getOrdersPendingSummit() async {
    emit(const PaymentState.getPendingOrdersLoading());

    final response =
        await _orderRepositoryImplement.getAllOrderPendingRepository();

    response.when(
      success: (response) {
        emit(PaymentState.getPendingOrdersSuccess(response));
      },
      failure: (error) {
        emit(
          PaymentState.getPendingOrdersError(
              errorMessage: error.message!, statesCode: error.statusCode!),
        );
      },
    );
  }
}
