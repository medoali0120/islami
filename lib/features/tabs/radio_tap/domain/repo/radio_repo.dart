import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failures.dart';
import 'package:islami/features/tabs/radio_tap/domain/entity/radio_entity.dart';
import 'package:islami/features/tabs/radio_tap/domain/entity/reciters_entity.dart';

abstract class RadioRepo {
  Future<Either<Failures, List<RadioEntity>>> getRadio();
  Future<Either<Failures, List<ReciterEntity>>> getReciters();
}
