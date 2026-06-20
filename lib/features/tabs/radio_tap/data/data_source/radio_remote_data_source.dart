import 'package:islami/features/tabs/radio_tap/data/model/radio_response.dart';
import 'package:islami/features/tabs/radio_tap/data/model/reciters_response.dart';

abstract class RadioRemoteDataSource {
  Future<RadiosResponse> getRadio();
  Future<RecitersResponse> getReciters();
}
