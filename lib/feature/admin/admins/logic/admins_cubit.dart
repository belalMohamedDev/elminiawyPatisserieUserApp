import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/admins/data/repository/admins_repo.dart';

part 'admins_state.dart';
part 'admins_cubit.freezed.dart';

class AdminsCubit extends Cubit<AdminsState> {
  AdminsCubit(this._adminsRepositoryImplement)
      : super(const AdminsState.initial());

  final AdminsRepositoryImplement _adminsRepositoryImplement;

  List<DataAuthResponse> _allActiveAdmins = [];

  List<DataAuthResponse> get allActiveAdmins => _allActiveAdmins;

  Future<void> fetchGetAllActiveAdmins() async {
    emit(const AdminsState.getActiveAdminsLoading());

    final response = await _adminsRepositoryImplement.getAllActiveAdminsRepo();

    response.when(
      success: (dataResponse) {
        _allActiveAdmins = [];
        _allActiveAdmins.addAll(dataResponse.data!);

        emit(AdminsState.getActiveAdminsSuccess(dataResponse));
      },
      failure: (error) {
        AdminsState.getActiveAdminsError(error);
      },
    );
  }
}
