import '../../../../../core/common/shared/shared_imports.dart'; //

part 'app_logic_state.dart';
part 'app_logic_cubit.freezed.dart';

class AppLogicCubit extends Cubit<AppLogicState> {
  AppLogicCubit() : super(const AppLogicState.initial());
  final PersistentTabController bottomNavBarController =
      PersistentTabController();

 String currentLangCode = 'en';

//Language Change
  void getSavedLanguage() {
    final result = SharedPrefHelper.containPreference(PrefKeys.prefsLanguage)
        ? SharedPrefHelper.getString(PrefKeys.prefsLanguage)
        : 'en';

    currentLangCode = result;

  

    emit(AppLogicState.languageChange(locale: Locale(currentLangCode)));
  }

  Future<void> _changeLang(String langCode) async {
    await SharedPrefHelper.setData(PrefKeys.prefsLanguage, langCode);
    currentLangCode = langCode;
    emit(AppLogicState.languageChange(locale: Locale(currentLangCode)));
  }

  void toArabic() => _changeLang('ar');

  void toEnglish() => _changeLang('en');
}
