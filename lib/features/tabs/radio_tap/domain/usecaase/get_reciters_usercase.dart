import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failures.dart';
import 'package:islami/features/tabs/radio_tap/domain/entity/reciters_entity.dart';
import 'package:islami/features/tabs/radio_tap/domain/repo/radio_repo.dart';

class GetRecitersUsecase {
  final RadioRepo recitersRepo;

  GetRecitersUsecase({required this.recitersRepo});

  Future<Either<Failures, List<ReciterEntity>>> call() {
    return recitersRepo.getReciters();
  }
}
