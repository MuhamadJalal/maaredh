import 'dart:async';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:maaredh/core/utils/barrel_utils.dart';

class AppInterceptors extends InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      data.params['units'] = 'metric';
      data.headers["Content-Type"] = "application/json";

      if (data.headers.containsKey("authed")) {
        //remove the auxiliary header
        data.headers.remove("authed");

        var header = (StorageServices().readFromStorage(AppRepoSharedPrefKeys().accessTokenSharedPrefKey) ?? '').toString();
        data.headers.addAll({"token": header});

        // return options;
        // super.onRequest(options, requestInterceptorHandler);
      }
    } catch (e) {
      'onRequest e $e'.debug(this);
    }

    /// {code: one_device_login, message: Another device login with your account, please login again., data: null}
    'onRequest headers ${data.headers.toString()}'.debug(this);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    'interceptResponse data ${data.toString()}'.debug(this);
    return data;
  }
}
