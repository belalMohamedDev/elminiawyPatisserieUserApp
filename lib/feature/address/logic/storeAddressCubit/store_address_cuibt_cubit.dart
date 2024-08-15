import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_address_cuibt_state.dart';
part 'store_address_cuibt_cubit.freezed.dart';

class StoreAddressCuibtCubit extends Cubit<StoreAddressCuibtState> {
  StoreAddressCuibtCubit() : super(const StoreAddressCuibtState.initial());
}
