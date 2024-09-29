import '../../../../../core/common/shared/shared_imports.dart'; //


part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final TextEditingController userSignUpEmailAddress = TextEditingController();
  final TextEditingController userSignUpPassword = TextEditingController();
  final TextEditingController userSignUpFirstName = TextEditingController();
  final TextEditingController userSignUpLastName = TextEditingController();
  final TextEditingController userSignUpPhone = TextEditingController();
  final RegisterRepository _registerRepository;

  bool showPass = true;
  bool agreeWithTerms = true;
  String countryCode = "+20";
  bool isButtonInVaildator = false;

  final signUpFormKey = GlobalKey<FormState>();
  SignUpBloc(this._registerRepository) : super(const _Initial()) {
    on<UserRegisterButtonEvent>(registerButton);

    on<SignUpEvent>((event, emit) {
      if (event is UserSignUFirstNameEvent) {
        registerButtonValidator(event, emit);
        if (!AppRegex.isNameValid(event.value)) {
          emit(const SignUpState.userSignUpFirstName(
              AppStrings.pleaseEnterValidFirstName));
        } else {
          emit(const SignUpState.userSignUpFirstName(""));
        }
      }

      if (event is UserSignUpLastNameEvent) {
        registerButtonValidator(event, emit);

        if (!AppRegex.isNameValid(event.value)) {
          emit(const SignUpState.userSignUpLastName(
              AppStrings.pleaseEnterValidLastName));
        } else {
          emit(const SignUpState.userSignUpLastName(""));
        }
      }

      if (event is UserSignUpPhoneEvent) {
        registerButtonValidator(event, emit);

        if (!AppRegex.isPhoneNumberValid(event.value)) {
          emit(const SignUpState.userSignUpPhone(
              AppStrings.pleaseEnterValidPhoneNumber));
        } else {
          emit(const SignUpState.userSignUpPhone(""));
        }
      }

      if (event is UserSignUpEmailAddressEvent) {
        if (!AppRegex.isEmailValid(event.value)) {
          registerButtonValidator(event, emit);

          emit(const SignUpState.userSignUpEmailAddress(
              AppStrings.pleaseEnterValidEmail));
        } else {
          emit(const SignUpState.userSignUpEmailAddress(""));
          registerButtonValidator(event, emit);
        }
      }

      if (event is UserSignUpPasswordEvent) {
        registerButtonValidator(event, emit);

        if (!AppRegex.isPasswordValid(event.value)) {
          emit(const SignUpState.userSignUpPassword(
              AppStrings.pleaseEnterValidSignUpPhoneNumber));
        } else {
          emit(const SignUpState.userSignUpPassword(""));
        }
      }

      if (event is UserShowSignUpPasswordEvent) {
        showPass = !showPass;

        emit(
          SignUpState.showUserSignUpPassword(showPass),
        );
      }

      if (event is UserSignUpAgreeWithEvent) {
        registerButtonValidator(event, emit);

        agreeWithTerms = !agreeWithTerms;

        emit(
          SignUpState.signUpAgreeWith(agreeWithTerms),
        );
      }
    });
  }

////////////////////////////////////////
/////////////
//////////////////////////////////////////
  Future<void> registerButtonValidator(
      SignUpEvent event, Emitter<SignUpState> emit) async {
    if (!AppRegex.isNameValid(userSignUpFirstName.text) ||
        !AppRegex.isNameValid(userSignUpLastName.text) ||
        !AppRegex.isEmailValid(userSignUpEmailAddress.text) ||
        !AppRegex.isPasswordValid(userSignUpPassword.text) ||
        !AppRegex.isPhoneNumberValid(userSignUpPhone.text)) {
      isButtonInVaildator = false;
      emit(SignUpState.buttonSignUpVaildation(isButtonInVaildator));
    } else {
      isButtonInVaildator = true;
      emit(SignUpState.buttonSignUpVaildation(isButtonInVaildator));
    }
  }

////////////////////////////////////////
/////////////
//////////////////////////////////////////

  Future<void> registerButton(
      SignUpEvent event, Emitter<SignUpState> emit) async {
    await event.whenOrNull(
      userRegisterButton: () async {
        emit(
          const SignUpState.loading(),
        );

        final response = await _registerRepository.register(
          RegisterRequestBody(
            name:
                '${userSignUpFirstName.text.trim()} ${userSignUpLastName.text.trim()}',
            phone: userSignUpPhone.text.trim(),
            email: userSignUpEmailAddress.text.trim(),
            password: userSignUpPassword.text.trim(),
          ),
        );

        response.when(
          success: (registerResponse) async {
            emit(SignUpState.suceess(registerResponse));

            await saveUserToken(
              registerResponse.accessToken!,
              registerResponse.data!.refreshToken!,
              registerResponse.data!.name!,
              registerResponse.data!.phone!,
              registerResponse.data!.email!,
              registerResponse.data!.sId!,
            );
          },
          failure: (error) {
            emit(
              SignUpState.error(
                  errorMessage: error.message!, statesCode: error.statusCode!),
            );
          },
        );
      },
    );
  }

  Future<void> saveUserToken(
    String accessToken,
    String refreshToken,
    String userName,
    String userPhone,
    String userEmail,
    String userId,
  ) async {
    await SharedPrefHelper.setSecuredString(PrefKeys.userPhone, userPhone);
    await SharedPrefHelper.setSecuredString(PrefKeys.userName, userName);
    await SharedPrefHelper.setSecuredString(PrefKeys.userEmail, userEmail);
    await SharedPrefHelper.setSecuredString(PrefKeys.userId, userId);

    await SharedPrefHelper.setSecuredString(PrefKeys.accessToken, accessToken);
    await SharedPrefHelper.setSecuredString(
        PrefKeys.refreshToken, refreshToken);

  }
}
