import 'dart:convert';
import 'package:blog/core/http_connector.dart';
import 'package:blog/dto/auth_req_dto.dart';
import 'package:blog/util/response_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dto/reponse_dto.dart';

final userApiRepository = Provider<UserApiRepository>((ref) {
  return UserApiRepository(ref);
});

class UserApiRepository {
  UserApiRepository(this._ref);
  Ref _ref;

  Future<ResponseDto> join(JoinReqDto joinReqDto) async {
    String requestBody = jsonEncode(joinReqDto.toJson());

    Response response = await _ref.read(httpConnector).post("/join", requestBody);

    return responseToResponseDto(response); // ResponseDto 응답
  }

  Future<ResponseDto> login(LoginReqDto loginReqDto) async {
    String requestBody = jsonEncode(loginReqDto.toJson());

    Response response = await _ref.read(httpConnector).post("/login", requestBody);

    String jwtToken = response.headers["authorization"].toString();
    // ----
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("jwtToken", jwtToken);
    // ---- 자동 로그인을 위해서 필요함
    Logger().d(jwtToken);

    return responseToResponseDto(response); // ResponseDto 응답
  }
}
