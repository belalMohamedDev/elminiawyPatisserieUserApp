import 'dart:io';

import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'driver_state.dart';
part 'driver_cubit.freezed.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit(this._driverRepository, this._imagePicker)
    : super(const DriverState.initial());

  final DriverRepositoryImplement _driverRepository;
  final ImagePicker _imagePicker;
  List<DataAuthResponse> _allDriver = [];

  List<DataAuthResponse> get allDriver => _allDriver;

  List<DataAuthResponse> _allActiveDriver = [];

  List<DataAuthResponse> get allActiveDriver => _allActiveDriver;

  int totalDriver = 0;
  int totalActiveDriver = 0;
  int totalInactiveDriver = 0;

  Future<void> fetchGetAllDriver() async {
    emit(const DriverState.getAllDriverLoading());

    final response = await _driverRepository.getAllDriverRepo();

    response.when(
      success: (dataResponse) {
        _allDriver = [];
        _allDriver.addAll(dataResponse.data!);
        totalDriver = dataResponse.total!;
        totalActiveDriver = dataResponse.active!;
        totalInactiveDriver = dataResponse.inactive!;

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
        emit(DriverState.getAllActiveDriverError(error));
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
      emit(const DriverState.imagePicked());
    }
  }

  final TextEditingController email = TextEditingController();

  String? branchAreaValueId;
  void setBranchAreaId(String value) {
    branchAreaValueId = value;
  }

  Future<void> fetchCreateNewDriver() async {
    emit(const DriverState.createNewDriverLoading());

    final response = await _driverRepository.createNewDriverRepo(
      image: imageFile!,
      email: email.text.trim(),
      storeAddress: branchAreaValueId!,
    );

    response.when(
      success: (dataResponse) {
        _allDriver.insert(0, dataResponse.data);

        email.clear();

        imageFile = null;

        totalDriver = totalDriver + 1;
        totalActiveDriver = totalActiveDriver + 1;

        emit(DriverState.getAllDriverSuccess(dataResponse));
      },
      failure: (error) {
        emit(DriverState.getAllDriverError(error));
      },
    );
  }

  Future<void> fetchDeleteDriver({String? id}) async {
    emit(const DriverState.createNewDriverLoading());

    final response = await _driverRepository.deleteDriverRepo(id: id!);

    response.when(
      success: (dataResponse) {
        final deletedAdmin = dataResponse.data;

        // 1) Remove user from the active admins list if exists
        final index = _allDriver.indexWhere((driver) => driver.sId == id);

        if (index != -1) {
          _allDriver.removeAt(index);
        }

        // 2) Update counters
        totalDriver = totalDriver - 1;
        if (deletedAdmin.active == true) {
          totalActiveDriver = totalActiveDriver - 1;
        } else {
          totalInactiveDriver = totalInactiveDriver - 1;
        }

        emit(DriverState.getAllDriverSuccess(dataResponse));
      },
      failure: (error) {
        emit(DriverState.getAllDriverError(error));
      },
    );
  }
}
