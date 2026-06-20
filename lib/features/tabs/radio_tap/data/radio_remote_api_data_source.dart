import 'package:dio/dio.dart';
import 'package:islami/core/constants/app_constants.dart';
import 'package:islami/core/errors/errors.dart';
import 'package:islami/features/tabs/radio_tap/data/model/radio_response.dart';
import 'package:islami/features/tabs/radio_tap/data/radio_remote_data_source.dart';

class RadioRemoteApiDataSource implements RadioRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: AppConstants.baseurl));
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
}
