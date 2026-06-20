import 'package:islami/features/tabs/radio_tap/domain/entity/reciters_entity.dart';

sealed class RecitersState {}

final class RecitersInitial extends RecitersState {}

final class RecitersLoading extends RecitersState {}

final class RecitersSuccess extends RecitersState {
  final List<ReciterEntity> reciters;

  RecitersSuccess(this.reciters);
}

final class RecitersError extends RecitersState {
  final String message;

  RecitersError(this.message);
}
