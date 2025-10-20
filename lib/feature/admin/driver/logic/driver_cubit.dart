import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'driver_state.dart';
part 'driver_cubit.freezed.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit(this._driverRepository) : super(const DriverState.initial());

  final DriverRepositoryImplement _driverRepository;

  List<DataAuthResponse> _allDriver = [];

  List<DataAuthResponse> get allDriver => _allDriver;

  List<DataAuthResponse> _allActiveDriver = [];

  List<DataAuthResponse> get allActiveDriver => _allActiveDriver;

  Future<void> fetchGetAllDriver() async {
    emit(const DriverState.getAllDriverLoading());

    final response = await _driverRepository.getAllDriverRepo();

    response.when(
      success: (dataResponse) {
        _allDriver = [];
        _allDriver.addAll(dataResponse.data!);

        emit(DriverState.getAllDriverSuccess(dataResponse));
      },
      failure: (error) {
        emit(DriverState.getAllDriverError(error));
   
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
        emit(DriverState.getAllActiveDriverError(error)) ;
      },
    );
  }

  Future<void> fetchDriverActive(String id) async {
    emit(const DriverState.driverActivedLoading());

    final response = await _driverRepository.driverActivedRepo(id);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _allDriver.indexWhere((deiver) => deiver.sId == id);

        if (updatedIndex != -1) {
          _allDriver.removeAt(updatedIndex);
        }

        _allDriver.add(dataResponse.data!);

        emit(DriverState.driverActivedSuccess(dataResponse));
      },
      failure: (error) {
        DriverState.driverActivedError(error);
      },
    );
  }

  Future<void> fetchDeleteDriver(
      {required String id, required bool isActive}) async {
    emit(const DriverState.deleteDriverLoading());

    final response = await _driverRepository.deleteDriverRepo(id);

    response.when(
      success: (dataResponse) {
        if (isActive) {
          final updatedIndex =
              _allDriver.indexWhere((deiver) => deiver.sId == id);

          if (updatedIndex != -1) {
            _allDriver.removeAt(updatedIndex);
          }
        } else {
          final updatedIndex =
              _allDriver.indexWhere((deiver) => deiver.sId == id);

          if (updatedIndex != -1) {
            _allDriver.removeAt(updatedIndex);
          }
        }

        emit(DriverState.deleteDriverSuccess(dataResponse));
      },
      failure: (error) {
        DriverState.deleteDriverError(error);
      },
    );
  }
}
