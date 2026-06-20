import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/features/tabs/radio_tap/domain/usecaase/get_reciters_usercase.dart';
import 'package:islami/features/tabs/radio_tap/presentation/bloc/reciteers_state.dart';

class RecitersCubit extends Cubit<RecitersState> {
  RecitersCubit({required this.getRecitersUsecase}) : super(RecitersInitial());

  final GetRecitersUsecase getRecitersUsecase;

  Future<void> getReciters() async {
    emit(RecitersLoading());

    final result = await getRecitersUsecase();

    result.fold((fail) => emit(RecitersError(fail.message)), (reciters) {
      print("Success => ${reciters.length}");
      emit(RecitersSuccess(reciters));
    });
  }
}
