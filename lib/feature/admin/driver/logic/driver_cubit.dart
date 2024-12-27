import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/driver/data/repository/driver_repo.dart';

part 'driver_state.dart';
part 'driver_cubit.freezed.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit(this._driverRepository) : super(const DriverState.initial());

  final DriverRepositoryImplement _driverRepository;

  List<DataAuthResponse> _allNotActiveDriver = [];

  List<DataAuthResponse> get allNotActiveDriver => _allNotActiveDriver;

  Future<void> fetchGetAllNotActiveDriver() async {
    emit(const DriverState.getAllNotActiveDriverLoading());

    final response = await _driverRepository.getAllNotActiveDriverRepo();

    response.when(
      success: (dataResponse) {
        _allNotActiveDriver = [];
        _allNotActiveDriver.addAll(dataResponse.data!);

        emit(DriverState.getAllNotActiveDriverSuccess(dataResponse));
      },
      failure: (error) {
        DriverState.getAllNotActiveDriverError(error);
      },
    );
  }
}