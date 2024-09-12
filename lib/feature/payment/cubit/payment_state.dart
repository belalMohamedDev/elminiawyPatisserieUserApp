part of 'payment_cubit.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;

  const factory PaymentState.changeShippingIndex(int index) = ChangeShippingIndex;
  const factory PaymentState.choosePayment(String choosePayment) =
      ChoosePayment;


        const factory PaymentState.createCashOrderLoading() = CreateCashOrderLoading;
  const factory PaymentState.createCashOrderError(
      {required int statesCode, required String errorMessage}) = CreateCashOrderError;

  const factory PaymentState.createCashOrderSuccess(CreateOrderResponse createOrderResponse) =
      CreateCashOrderSuccess;

}
