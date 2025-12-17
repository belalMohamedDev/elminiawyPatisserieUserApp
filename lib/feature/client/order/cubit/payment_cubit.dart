import '../../../../../core/common/shared/shared_imports.dart'; //

part 'payment_state.dart';
part 'payment_cubit.freezed.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._orderRepositoryImplement)
    : super(const PaymentState.initial());
  int selectedIndex = 0;
  String choosePaymentMethod = 'Cash';
  final OrderRepositoryImplement _orderRepositoryImplement;
  TextEditingController notesController = TextEditingController();

  TextEditingController customerNameController = TextEditingController();
  TextEditingController paidAmountController = TextEditingController();
  TextEditingController customerPhoneController = TextEditingController();
  TextEditingController customerAddressTextController = TextEditingController();

  OrderResponseData? createOrderResponseData;
  List<GetOrdersResponseData> getCurrentOrders = [];
  List<GetOrdersResponseData> getPerviousOrders = [];

  String _selectedOption = "Store Pickup";

  String _selectedPaymentOption = "full Payment";

  String get selectedPaymentOption => _selectedPaymentOption;
  bool get isDeferredPayment => _selectedPaymentOption == "deferred Payment";

  void changePaymetType(String value) {
    _selectedPaymentOption = value;

    emit(PaymentState.orderTypeChanged(value));
  }

  //   "fullPayment": "دفع كامل",
  // "deferredPayment": "دفع آجل",

  String get selectedOption => _selectedOption;
  bool get isPhoneOrder => _selectedOption == "By Phone";

  static const Map<String, String> orderSourceMap = {
    "Store Pickup": "in_store",
    "By Phone": "phone",
  };

  String get orderSourceForApi => orderSourceMap[_selectedOption] ?? "app";

  void changeOrderType(String value) {
    _selectedOption = value;

    emit(PaymentState.orderTypeChanged(value));
  }

  void changeShippingIndex(int index) {
    selectedIndex = index;
    emit(PaymentState.changeShippingIndex(selectedIndex));
  }

  void changePaymentMethod(String choosePayment) {
    choosePaymentMethod = choosePayment;
    emit(PaymentState.choosePayment(choosePaymentMethod));
  }

  Future<void> createCashOrderSummit({
    String? shippingAddressId,
    String? nearbyStoreAddress,
    String? orderSource,
  }) async {
    emit(const PaymentState.createCashOrderLoading());

    final response = await _orderRepositoryImplement.createCashOrder(
      CreateOrderRequestBody(
        shippingAddress: shippingAddressId,
        nearbyStoreAddress: nearbyStoreAddress,
        notes: notesController.text.isNotEmpty
            ? notesController.text.trim()
            : null,
        customerName: customerNameController.text.isNotEmpty
            ? customerNameController.text.trim()
            : null,
        customerPhone: customerPhoneController.text.isNotEmpty
            ? customerPhoneController.text.trim()
            : null,
        customerAddressText: customerAddressTextController.text.isNotEmpty
            ? customerAddressTextController.text.trim()
            : null,
        orderSource: orderSource,
      ),
    );

    response.when(
      success: (response) {
        createOrderResponseData = response.data;
        emit(PaymentState.createCashOrderSuccess(response));
      },
      failure: (error) {
        emit(PaymentState.createCashOrderError(error));
      },
    );
  }

  Future<void> orderCancelSummit(String id) async {
    emit(const PaymentState.createCashOrderLoading());

    final response = await _orderRepositoryImplement.orderCancelledRepository(
      id,
    );

    response.when(
      success: (response) {
        createOrderResponseData = response.data;
        emit(PaymentState.createCashOrderSuccess(response));
      },
      failure: (error) {
        emit(PaymentState.createCashOrderError(error));
      },
    );
  }

  int cancelledOrder = 0;
  int deliveredOrder = 0;

  Future<void> getCompleteOrdersSummit() async {
    emit(const PaymentState.getCompleteOrdersLoading());

    final response = await _orderRepositoryImplement
        .getAllOrderCompleteRepository();

    response.when(
      success: (response) {
        getPerviousOrders = [];
        getPerviousOrders = response.data ?? [];

        cancelledOrder = getPerviousOrders
            .where((element) => element.status == 5)
            .length;

        deliveredOrder = getPerviousOrders
            .where((element) => element.status == 4)
            .length;

        emit(PaymentState.getCompleteOrdersSuccess(response));
      },
      failure: (error) {
        emit(PaymentState.getCompleteOrdersError(error));
      },
    );
  }

  Future<void> getOrdersPendingSummit() async {
    emit(const PaymentState.getCompleteOrdersLoading());

    final response = await _orderRepositoryImplement
        .getAllOrderPendingRepository();

    response.when(
      success: (response) {
        getCurrentOrders = [];
        getCurrentOrders = response.data ?? [];

        emit(PaymentState.getCompleteOrdersSuccess(response));
      },
      failure: (error) {
        emit(PaymentState.getCompleteOrdersError(error));
      },
    );
  }
}
