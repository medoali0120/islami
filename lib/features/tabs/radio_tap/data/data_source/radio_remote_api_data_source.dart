import 'package:dio/dio.dart';
import 'package:islami/core/constants/app_constants.dart';
import 'package:islami/core/errors/errors.dart';
import 'package:islami/features/tabs/radio_tap/data/model/radio_response.dart';
import 'package:islami/features/tabs/radio_tap/data/data_source/radio_remote_data_source.dart';
import 'package:islami/features/tabs/radio_tap/data/model/reciters_response.dart';

class RadioRemoteApiDataSource implements RadioRemoteDataSource {
  Dio dio = Dio();
  @override
  Future<RadiosResponse> getRadio() async {
    try {
      var response = await dio.get(AppConstants.radioEndpoint);
      RadiosResponse radiosResponse = RadiosResponse.fromJson(response.data);
      return radiosResponse;
    } catch (exp) {
      String? message;
      if (exp is DioException) {
        message = exp.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed to fetch Radio");
    }
  }

  @override
  Future<RecitersResponse> getReciters() async {
    try {
      var response = await dio.get(AppConstants.recitersEndpoint);
      print(response.statusCode);

      print(response.data);
      RecitersResponse recitersResponse = RecitersResponse.fromJson(
        response.data,
      );
      print(recitersResponse.reciters.length);
      return recitersResponse;
    } on DioException catch (exp) {
      print("ERROR => $exp");
      print("RESPONSE => ${exp.response?.data}");
      String? message;
      if (exp is DioException) {
        message = exp.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed to fetch Reciters");
    }
  }
}
