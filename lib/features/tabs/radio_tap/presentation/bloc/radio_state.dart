import 'package:islami/features/tabs/radio_tap/domain/entity/radio_entity.dart';

sealed class RadiosState {}

final class RadiosInitial extends RadiosState {}

final class RadiosLoading extends RadiosState {}

final class RadiosSuccess extends RadiosState {
  final List<RadioEntity> radios;

  RadiosSuccess(this.radios);
}

final class RadiosError extends RadiosState {
  final String message;

  RadiosError(this.message);
}
