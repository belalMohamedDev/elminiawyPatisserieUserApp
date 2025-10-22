import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'admins_state.dart';
part 'admins_cubit.freezed.dart';

class AdminsCubit extends Cubit<AdminsState> {
  AdminsCubit(this._adminsRepositoryImplement)
      : super(const AdminsState.initial());

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


  
}
