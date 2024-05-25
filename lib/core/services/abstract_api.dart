import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yo_me_animo/core/model/response_db.dart';

class AbstractApi {
  Map<String, String> get _headers {
    String authorization = '';
    return {
      "Content-Type": "application/json",
      HttpHeaders.authorizationHeader: authorization
    };
  }

  Future<ResponseDB> create({data, required Uri urlSpecific}) async {
    try {
      final response = await http.post(
        urlSpecific,
        headers: _headers,
        body: json.encode(data),
      );
      final dataDecode = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ResponseDB(
          isSuccess: true,
          message: 'Operacion realizada con exito',
          result: dataDecode,
        );
      } else {
        return ResponseDB(
          isSuccess: false,
          message: dataDecode['message'],
          result: [],
        );
      }
    } catch (error) {
      return ResponseDB(isSuccess: false, message: "Error", result: []);
    }
  }

  Future<ResponseDB> readData({required Uri urlSpecific}) async {
    try {
      final response = await http.get(urlSpecific, headers: _headers);
      final dataDecode = response.body != "" ? json.decode(response.body) : [];
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ResponseDB(
          isSuccess: true,
          message: 'Operacion realizada con exito',
          result: dataDecode,
        );
      } else {
        return ResponseDB(
          isSuccess: false,
          message: dataDecode['message'],
          result: [],
        );
      }
    } catch (error) {
      return ResponseDB(isSuccess: false, message: "Error", result: []);
    }
  }

  Future<ResponseDB> update({data, required Uri urlSpecific}) async {
    try {
      final response = await http.put(
        urlSpecific,
        headers: _headers,
        body: json.encode(data),
      );
      final dataDecode = json.decode(response.body);
      if (response.statusCode == 200) {
        return ResponseDB(
          isSuccess: true,
          message: 'Operacion realizada con exito',
          result: dataDecode,
        );
      } else {
        return ResponseDB(
          isSuccess: false,
          message: dataDecode['message'],
          result: [],
        );
      }
    } catch (error) {
      return ResponseDB(isSuccess: false, message: "Error", result: []);
    }
  }

  Future<ResponseDB> delete({data, required Uri urlSpecific}) async {
    try {
      final response = await http.delete(
        urlSpecific,
        headers: _headers,
      );
      final dataDecode = json.decode(response.body);
      if (response.statusCode == 200) {
        return ResponseDB(
          isSuccess: true,
          message: 'Operacion realizada con exito',
          result: dataDecode,
        );
      } else {
        return ResponseDB(
          isSuccess: false,
          message: dataDecode['message'],
          result: [],
        );
      }
    } catch (error) {
      return ResponseDB(isSuccess: false, message: "Error", result: []);
    }
  }
}
