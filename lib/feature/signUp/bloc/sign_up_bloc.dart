import '../../../../../core/common/shared/shared_imports.dart'; // Import shared utilities

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

/// The `SignUpBloc` class handles all the logic and state management for the sign-up process.
/// It manages user inputs (email, password, etc.), validates the input data, and triggers user registration.
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  // Controllers to manage form input fields
  final TextEditingController userSignUpEmailAddress = TextEditingController();
  final TextEditingController userSignUpPassword = TextEditingController();
  final TextEditingController userSignUpFirstName = TextEditingController();
  final TextEditingController userSignUpLastName = TextEditingController();
  final TextEditingController userSignUpPhone = TextEditingController();

  // Repository for handling the registration process
  final RegisterRepository _registerRepository;

  // UI-related flags
  bool showPass = true; // Toggles the visibility of the password field
  bool agreeWithTerms = true; // Tracks the user's agreement with terms
  String countryCode = "+20"; // Default country code for phone numbers
  bool isButtonInVaildator =
      false; // Validates whether the sign-up button is enabled

  final signUpFormKey = GlobalKey<FormState>(); // Form key for validation

  /// Constructor initializes the repository and adds event listeners
  SignUpBloc(this._registerRepository) : super(const _Initial()) {
    // Register button press event
    on<UserRegisterButtonEvent>(registerButton);

    // General event handler
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
        registerButtonValidator(event, emit);
        if (!AppRegex.isEmailValid(event.value)) {
          emit(const SignUpState.userSignUpEmailAddress(
              AppStrings.pleaseEnterValidEmail));
        } else {
          emit(const SignUpState.userSignUpEmailAddress(""));
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
        // Toggle password visibility
        showPass = !showPass;
        emit(SignUpState.showUserSignUpPassword(showPass));
      }

      if (event is UserSignUpAgreeWithEvent) {
        registerButtonValidator(event, emit);
        // Toggle agreement with terms and conditions
        agreeWithTerms = !agreeWithTerms;
        emit(SignUpState.signUpAgreeWith(agreeWithTerms));
      }
    });
  }

  ////////////////////////////////////////
  // Register Button Validation
  ////////////////////////////////////////

  /// Validates if the sign-up button should be enabled based on the input fields.
  Future<void> registerButtonValidator(
      SignUpEvent event, Emitter<SignUpState> emit) async {
    // Checks if all input fields have valid values
    if (!AppRegex.isNameValid(userSignUpFirstName.text) ||
        !AppRegex.isNameValid(userSignUpLastName.text) ||
        !AppRegex.isEmailValid(userSignUpEmailAddress.text) ||
        !AppRegex.isPasswordValid(userSignUpPassword.text) ||
        !AppRegex.isPhoneNumberValid(userSignUpPhone.text)) {
      // Disable the button if validation fails
      isButtonInVaildator = false;
    } else {
      // Enable the button if all fields are valid
      isButtonInVaildator = true;
    }
    // Emit the button validation state
    emit(SignUpState.buttonSignUpVaildation(isButtonInVaildator));
  }

  ////////////////////////////////////////
  // Register Button Logic
  ////////////////////////////////////////

  /// Handles the registration process when the user clicks the sign-up button.
  Future<void> registerButton(
      SignUpEvent event, Emitter<SignUpState> emit) async {
    await event.whenOrNull(
      userRegisterButton: () async {
        // Emit loading state
        emit(const SignUpState.loading());

        // Call the repository to handle user registration
        final response = await _registerRepository.register(
          RegisterRequestBody(
            name:
                '${userSignUpFirstName.text.trim()} ${userSignUpLastName.text.trim()}',
            phone: userSignUpPhone.text.trim(),
            email: userSignUpEmailAddress.text.trim(),
            password: userSignUpPassword.text.trim(),
          ),
        );

        // Handle the response from the registration API
        response.when(
          success: (registerResponse) async {
            // Emit success state
            emit(SignUpState.suceess(registerResponse));

            // Save the user token securely in shared preferences
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
            // Emit error state in case of failure
            emit(SignUpState.error(
               error));
          },
        );
      },
    );
  }

  ////////////////////////////////////////
  // Save User Token
  ////////////////////////////////////////

  /// Saves the user token and other important data in secured storage.
  Future<void> saveUserToken(
    String accessToken,
    String refreshToken,
    String userName,
    String userPhone,
    String userEmail,
    String userId,
  ) async {
    // Save user details in secured storage
    await SharedPrefHelper.setSecuredString(PrefKeys.userPhone, userPhone);
    await SharedPrefHelper.setSecuredString(PrefKeys.userName, userName);
    await SharedPrefHelper.setSecuredString(PrefKeys.userEmail, userEmail);
    await SharedPrefHelper.setSecuredString(PrefKeys.userId, userId);
    SharedPrefHelper.setData(PrefKeys.prefsSetLoginMap, true);
    // Save authentication tokens in secured storage
    await SharedPrefHelper.setSecuredString(PrefKeys.accessToken, accessToken);
    await SharedPrefHelper.setSecuredString(
        PrefKeys.refreshToken, refreshToken);
  }
}
