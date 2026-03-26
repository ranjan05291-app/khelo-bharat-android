import 'package:flutter/cupertino.dart';
import '../data/response/api_response.dart';
import 'package:ipl_app_flutter26/model/login_model.dart';
import 'package:ipl_app_flutter26/repository/login_repository.dart';

class LoginViewViewModel with ChangeNotifier {
  final _myRepo = LoginRepository();
  ApiResponse<LoginModel> data = ApiResponse.loading();
  setData(ApiResponse<LoginModel> response) {
    data = response;
    notifyListeners();
  }

  Future<LoginModel?> fetchLoginApi(dynamic data) async {
    setData(ApiResponse.loading());
    try {
      final response = await _myRepo.fetchLoginData(data);
      setData(ApiResponse.completed(response));
      return response; // ✅ RETURN response directly
    } catch (e) {
      setData(ApiResponse.error(e.toString()));
      return null; // 🚨 Important to return null on error
    }
  }
}
