import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ekrut_test/model/create_roles.dart';
import 'package:ekrut_test/model/roles.dart';
import 'package:ekrut_test/model/users.dart';
import 'package:ekrut_test/utils/helper/common_function.dart';
import 'package:ekrut_test/utils/helper/constant.dart';

class BaseService {
  Dio get dioInstance {
    Dio _instance;

    final _baseOptions = BaseOptions(
      validateStatus: (status) => true,
      baseUrl: Constant.API_STAGING,
    );
    _instance = Dio(_baseOptions);
    _instance.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    _instance.options.connectTimeout = 150000;
    _instance.options.sendTimeout = 150000;
    _instance.options.receiveTimeout = 150000;

    return _instance;
  }

  dynamic get _errorResponse {
    return {'status': false, 'message': 'Mohon dicoba beberapa saat lagi'};
  }

  T _error<T>(DioError e) {
    T resultResponse;

    if (e.type == DioErrorType.other && e.message.toLowerCase().contains('failed host lookup')) {
      CommonFunction.standartSnackbar('Ekrut Test', 'Seems you are not connected to internet!');
      resultResponse = fromJson<T>(_errorResponse);
    } else if (e.response.toString().toLowerCase().contains('<html>')) {
      resultResponse = fromJson<T>(_errorResponse);
    } else if ((e.response?.statusCode ?? 500) > 200) {
      resultResponse = fromJson<T>(_errorResponse);
    } else {
      var responseMap = jsonDecode(e.response.toString());
      resultResponse = fromJson<T>(responseMap);
    }

    return resultResponse;
  }

  /// POST WITH JSON BODY
  Future<T> postJsonBody<T>(
      String url, dynamic body) async {
    T resultResponse;

    try {
      var response = await dioInstance.post(url, data: body);

      resultResponse = fromJson<T>(response.statusCode == 200 ? response.data : _errorResponse);
    } on DioError catch (e) {
      resultResponse = _error(e);
    }

    return resultResponse;
  }

  /// GET
  Future<T> get<T>(String url) async {
    T resultResponse;

    try {
      var response = await dioInstance.get(url);
      resultResponse = fromJson<T>((response.statusCode ?? 400) == 200 ? response.data : _errorResponse);
    } on DioError catch (e) {
      resultResponse = _error(e);
    }

    return resultResponse;
  }

  Future<List<T>> getList<T>({required String url, Map<String, String>? headers}) async {
    List<T> resultResponse;

    try {
      var response = await dioInstance.get(url);
      resultResponse = _fromJsonList<T>((response.statusCode ?? 400) == 200 ? response.data : null);
    } on DioError catch (_) {
      resultResponse = _fromJsonList<T>(null);
    }

    return resultResponse;
  }

  /// Converter json to dart object
  static T fromJson<T>(dynamic json) {
    if (T == Users) {
      return Users.fromJson(json) as T;
    } else if (T == Roles) {
      return Roles.fromJson(json) as T;
    } else if (T == CreateRoles) {
      return CreateRoles.fromJson(json) as T;
    } else {
      throw Exception(
          'Unknown class, dont forget to add your model in BaseService.dart to parse the json');
    }
  }

  //from json list
  static List<T> _fromJsonList<T>(List? jsonList) {
    if (jsonList == null) {
      return <T>[];
    }

    List<T> output = [];

    for (Map<String, dynamic> json in jsonList) {
      output.add(fromJson<T>(json));
    }

    return output;
  }
}