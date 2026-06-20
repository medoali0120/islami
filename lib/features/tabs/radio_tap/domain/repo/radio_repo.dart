import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failures.dart';
import 'package:islami/features/tabs/radio_tap/domain/entity/radio_entity.dart';

abstract class RadioRepo {
  Future<Either<Failures, List<RadioEntity>>> getRadio();
}
