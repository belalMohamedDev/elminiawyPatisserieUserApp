part of 'payment_cubit.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;

  const factory PaymentState.changeShippingIndex(int index) = ChangeShippingIndex;
  const factory PaymentState.choosePayment(String choosePayment) =
      ChoosePayment;
}
