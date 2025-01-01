import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'driver_state.dart';
part 'driver_cubit.freezed.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit(this._driverRepository) : super(const DriverState.initial());

  final DriverRepositoryImplement _driverRepository;

  List<DataAuthResponse> _allNotActiveDriver = [];

  List<DataAuthResponse> get allNotActiveDriver => _allNotActiveDriver;

  List<DataAuthResponse> _allActiveDriver = [];

  List<DataAuthResponse> get allActiveDriver => _allActiveDriver;

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

  Future<void> fetchGetAllActiveDriver() async {
    emit(const DriverState.getAllActiveDriverLoading());

    final response = await _driverRepository.getAllActiveDriverRepo();

    response.when(
      success: (dataResponse) {
        _allActiveDriver = [];
        _allActiveDriver.addAll(dataResponse.data!);

        emit(DriverState.getAllActiveDriverSuccess(dataResponse));
      },
      failure: (error) {
        DriverState.getAllActiveDriverError(error);
      },
    );
  }

  Future<void> fetchDriverActive(String id) async {
    emit(const DriverState.driverActivedLoading());

    final response = await _driverRepository.driverActivedRepo(id);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _allNotActiveDriver.indexWhere((deiver) => deiver.sId == id);

        if (updatedIndex != -1) {
          _allNotActiveDriver.removeAt(updatedIndex);
        }

        _allActiveDriver.add(dataResponse.data!);

        emit(DriverState.driverActivedSuccess(dataResponse));
      },
      failure: (error) {
        DriverState.driverActivedError(error);
      },
    );
  }
}
