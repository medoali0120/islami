import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/features/tabs/radio_tap/domain/usecaase/get_radio_usecase.dart';
import 'package:islami/features/tabs/radio_tap/presentation/bloc/radio_state.dart';

class RadioCubit extends Cubit<RadiosState> {
  RadioCubit({required this.getRadioUsecase}) : super(RadiosInitial());
  final GetRadioUsecase getRadioUsecase;

  Future<void> getRadio() async {
    emit(RadiosLoading());
    final result = await getRadioUsecase();
    result.fold(
      (fail) {
        emit(RadiosError(fail.message));
      },
      (radios) {
        emit(RadiosSuccess(radios));
      },
    );
  }
}
