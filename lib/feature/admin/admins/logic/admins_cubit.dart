import 'dart:io';

import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'admins_state.dart';
part 'admins_cubit.freezed.dart';

class AdminsCubit extends Cubit<AdminsState> {
  AdminsCubit(this._imagePicker, this._adminsRepositoryImplement)
    : super(const AdminsState.initial());
  final ImagePicker _imagePicker;
  final AdminsRepositoryImplement _adminsRepositoryImplement;

  List<DataAuthResponse> _allActiveAdmins = [];

  List<DataAuthResponse> get allActiveAdmins => _allActiveAdmins;

  Future<void> fetchGetAllAdmins() async {
    emit(const AdminsState.getActiveAdminsLoading());

    final response = await _adminsRepositoryImplement.getAllAdminsRepo();

    response.when(
      success: (dataResponse) {
        _allActiveAdmins = [];
        _allActiveAdmins.addAll(dataResponse.data!);

        emit(AdminsState.getActiveAdminsSuccess(dataResponse));
      },
      failure: (error) {
        emit(AdminsState.getActiveAdminsError(error));
      },
    );
  }

  File? imageFile;

  Future<void> pickImage() async {
    final pickedImage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      emit(const AdminsState.imagePicked());
    }
  }

  final TextEditingController email = TextEditingController();

  Future<void> fetchCreateNewAdmin(String branchAreaId) async {
    emit(const AdminsState.createNewAdminLoading());

    final response = await _adminsRepositoryImplement.createNewAdminRepo(
      image: imageFile!,
      email: email.text.trim(),
      storeAddress: branchAreaId,
    );

    response.when(
      success: (dataResponse) {
        _allActiveAdmins.insert(0, dataResponse.data);

        email.clear();

        imageFile = null;

        emit(AdminsState.createNewAdminSuccess([..._allActiveAdmins]));
      },
      failure: (error) {
        emit(AdminsState.createNewAdminError(error));
      },
    );
  }
}
