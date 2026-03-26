import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../model/login_model.dart';
import '../res/app_url.dart';

class LoginRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<LoginModel> fetchLoginData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.loginUrl,
        data,
      );
      return response = LoginModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
