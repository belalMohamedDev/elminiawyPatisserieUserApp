
import '../../../../../core/common/shared/shared_imports.dart'; //


part 'account_information_state.dart';
part 'account_information_cubit.freezed.dart';

class AccountInformationCubit extends Cubit<AccountInformationState> {
  AccountInformationCubit(this._accountInformationRepositoryImplement)
      : super(const AccountInformationState.initial());
  final AccountInformationRepositoryImplement
      _accountInformationRepositoryImplement;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPhoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String userEmail = '';
  String _initialUserName = '';
  String _initialUserPhone = '';
  bool isTextFormFieldEnabl = false;

  void enablTextFormField() async {
    isTextFormFieldEnabl = !isTextFormFieldEnabl;

    emit(
        AccountInformationState.changeEnablTextFormField(isTextFormFieldEnabl));
  }

  Future<void> getUserInfo() async {
    userEmail = await SharedPrefHelper.getSecuredString(PrefKeys.userEmail);
    _initialUserName =
        await SharedPrefHelper.getSecuredString(PrefKeys.userName);
    _initialUserPhone =
        await SharedPrefHelper.getSecuredString(PrefKeys.userPhone);

    userNameController.text = _initialUserName.trim();
    userPhoneController.text = _initialUserPhone.trim();

    emit(AccountInformationState.getStorageData(
        userEmail, _initialUserName, userPhoneController.text));
  }

  Future<void> updateAccountInformation() async {
    // Check if data has changed
    if (userNameController.text.trim() == _initialUserName &&
        userPhoneController.text.trim() == _initialUserPhone) {
      enablTextFormField();
      emit(const AccountInformationState.noChangesDetected());
      return;
    }

    emit(const AccountInformationState.updateAccountInformationLoading());

    final response = await _accountInformationRepositoryImplement
        .updateAccountInformation(UpdateAccountInformationRequestBody(
            name: userNameController.text.trim(),
            phone: userPhoneController.text.trim()));

    response.when(
      success: (dataResponse) async {
        emit(AccountInformationState.updateAccountInformationSuccess(
            dataResponse));
        await saveUserInformation(
            dataResponse.data!.name!, dataResponse.data!.phone!);
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            AccountInformationState.updateAccountInformationError(
                error),
          );
        }
      },
    );
  }

  Future<void> saveUserInformation(
    String userName,
    String userPhone,
  ) async {
    await SharedPrefHelper.setSecuredString(PrefKeys.userPhone, userPhone);
    await SharedPrefHelper.setSecuredString(PrefKeys.userName, userName);
  }

  Future<void> summitdeleteAccount() async {
    emit(const AccountInformationState.deleteAccountLoading());

    final response =
        await _accountInformationRepositoryImplement.deleteAccountRepo();

    response.when(
      success: (dataResponse) async {
        emit(AccountInformationState.deleteAccountSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            AccountInformationState.deleteAccountError(
                error),
          );
        }
      },
    );
  }
}
