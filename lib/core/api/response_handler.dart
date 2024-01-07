import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:maaredh/core/utils/barrel_utils.dart';

class ResponseHandler {
  Future<dynamic> handleApiResponse({http.Response? response}) async {
    String? res = response?.body;

    'handleApiResponse response body res $res \n headers ${response?.headers}'.debug(this);
    if (response == null) {
      'handleApiResponse response == null'.debug(this);

      /// display alert
      'NULL with handle Api Response'.toast(backgroundColor: AppRepoColors().appRedColor);
      return null;
    } else {
      'handleApiResponse response body $res'.debug(this);
      'handleApiResponse response headers ${response.headers}'.debug(this);
      'handleApiResponse response statusCode ${response.statusCode} for the endPoint ${response.request?.url}'.debug(this);
      if (response.statusCode < HttpStatus.ok || response.statusCode > HttpStatus.created) {
        /// display alert depend on every state
        switch (response.statusCode) {
          case HttpStatus.networkConnectTimeoutError:
            break;
          case HttpStatus.connectionClosedWithoutResponse:
            break;
          case HttpStatus.badGateway:
            'Bad Gateway'.toast(backgroundColor: AppRepoColors().appRedColor);
            return null;
          case HttpStatus.internalServerError:
            'Internal Server Error'.toast(backgroundColor: AppRepoColors().appRedColor);
            return null;
          case HttpStatus.badRequest:
            'Request Can Not Be Handled'.toast(backgroundColor: AppRepoColors().appRedColor);
            return null;
          case HttpStatus.unauthorized:
            break;
          default:
            break;
        }

        if (res != null && !res.toString().toLowerCase().contains('doctype') && jsonDecode(res) is Map<String, dynamic>) {
          '${jsonDecode(res)['message'] ?? 'err'}'.toast(backgroundColor: AppRepoColors().appRedColor);
        }
        return null;
      } else {
        if (res != null && jsonDecode(res) is Map<String, dynamic> && (jsonDecode(res) as Map<String, dynamic>).containsKey('status') && jsonDecode(res)['status'] == 0) {
          '${jsonDecode(res)['message'] ?? 'error'}'.toast(backgroundColor: AppRepoColors().appRedColor);
          return null;
        }

        /// display general alert

        'res $res -- ${jsonDecode(res ?? '')} -- ${res.runtimeType} -- ${jsonDecode(res ?? '').runtimeType}'.debug(this);
        return jsonDecode(res ?? '');
      }
    }
  }
}
