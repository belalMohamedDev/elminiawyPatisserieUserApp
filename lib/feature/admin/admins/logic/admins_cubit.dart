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

  int totalAdmins = 0;
  int totalActiveAdmins = 0;
  int totalInactiveAdmins = 0;

  Future<void> fetchGetAllAdmins() async {
    emit(const AdminsState.getActiveAdminsLoading());

    final response = await _adminsRepositoryImplement.getAllAdminsRepo();

    response.when(
      success: (dataResponse) {
        _allActiveAdmins = [];
        _allActiveAdmins.addAll(dataResponse.data!);
        totalAdmins = dataResponse.total!;
        totalActiveAdmins = dataResponse.active!;
        totalInactiveAdmins = dataResponse.inactive!;

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

  String? branchAreaValueId;
  void setBranchAreaId(String value) {
    branchAreaValueId = value;
  }

  Future<void> fetchCreateNewAdmin() async {
    emit(const AdminsState.createNewAdminLoading());

    final response = await _adminsRepositoryImplement.createNewAdminRepo(
      image: imageFile!,
      email: email.text.trim(),
      storeAddress: branchAreaValueId!,
    );

    response.when(
      success: (dataResponse) {
        _allActiveAdmins.insert(0, dataResponse.data);

        email.clear();

        imageFile = null;

        totalAdmins = totalAdmins + 1;
        totalActiveAdmins = totalActiveAdmins + 1;

        emit(AdminsState.getActiveAdminsSuccess(dataResponse));
      },
      failure: (error) {
        emit(AdminsState.getActiveAdminsError(error));
      },
    );
  }

  Future<void> fetchDeleteAdmin({String? id}) async {
    emit(const AdminsState.createNewAdminLoading());

    final response = await _adminsRepositoryImplement.deleteAdminRepo(id: id!);

    response.when(
      success: (dataResponse) {
        final deletedAdmin = dataResponse.data;

        // 1) Remove user from the active admins list if exists
        final index = _allActiveAdmins.indexWhere((admin) => admin.sId == id);

        if (index != -1) {
          _allActiveAdmins.removeAt(index);
        }

        // 2) Update counters
        totalAdmins = totalAdmins - 1;
        if (deletedAdmin.active == true) {
          totalActiveAdmins = totalActiveAdmins - 1;
        } else {
          totalInactiveAdmins = totalInactiveAdmins - 1;
        }

        emit(AdminsState.getActiveAdminsSuccess(dataResponse));
      },
      failure: (error) {
        emit(AdminsState.getActiveAdminsError(error));
      },
    );
  }
}
