import 'package:islami/features/tabs/radio_tap/data/model/radio_response.dart';

abstract class RadioRemoteDataSource {
  Future<RadiosResponse> getRadio();
}
