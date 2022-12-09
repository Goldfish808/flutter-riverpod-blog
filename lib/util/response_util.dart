import 'dart:convert';
import 'package:http/http.dart';
import '../dto/reponse_dto.dart';

ResponseDto responseToResponseDto(Response response) {
  Map<String, dynamic> responseMap = jsonDecode(response.body); // 문자열 -> Map

  ResponseDto responseDto = ResponseDto.fromJson(responseMap); // Map -> Dart Class
  return responseDto;
}
