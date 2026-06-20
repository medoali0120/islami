import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failures.dart';
import 'package:islami/features/tabs/radio_tap/domain/entity/radio_entity.dart';
import 'package:islami/features/tabs/radio_tap/domain/repo/radio_repo.dart';

class GetRadioUsecase {
  final RadioRepo radioRepo;
  const GetRadioUsecase({required this.radioRepo});
  Future<Either<Failures, List<RadioEntity>>> call() {
    return radioRepo.getRadio();
  }
}
