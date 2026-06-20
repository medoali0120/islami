import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/errors.dart';
import 'package:islami/core/errors/failures.dart';
import 'package:islami/features/tabs/radio_tap/domain/entity/radio_entity.dart';
import 'package:islami/features/tabs/radio_tap/data/radio_remote_data_source.dart';
import 'package:islami/features/tabs/radio_tap/domain/repo/radio_repo.dart';

class RadioRepoImp implements RadioRepo {
  const RadioRepoImp({required this.radioRemoteDataSource});
  final RadioRemoteDataSource radioRemoteDataSource;
  @override
  Future<Either<Failures, List<RadioEntity>>> getRadio() async {
    try {
      final result = await radioRemoteDataSource.getRadio();
      return right(result.radios.map((radio) => radio.toEntity()).toList());
    } on RemoteException catch (exp) {
      return left(Failures(message: exp.message));
    }
  }
}
