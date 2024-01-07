// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LoggingInterceptors extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler requestInterceptorHandler) {
//     debugPrint("--> ${options.method.toUpperCase()} ${"" + (options.baseUrl) + (options.path)}\n\n\n", wrapWidth: 800);
//     debugPrint("Headers:");
//     // options.headers.forEach((k, v) => debugPrint('$k: $v\n\n\n', wrapWidth: 800));
//
//     /// to handle WorldWide - Egypt courses for the BE
//     var headers = {
//       'Cookie': 'Cookie_1=value;'
//           ' wordpress_=1'
//     };
//     options.headers.addAll(headers);
//     debugPrint('\n\n\n LoggingInterceptors onRequest options.headers ${options.headers}  \n\n\n', wrapWidth: 800);
//
//     debugPrint("queryParameters:");
//     // options.queryParameters.forEach((k, v) => debugPrint('$k: $v\n\n\n', wrapWidth: 800));
//     if (options.data != null) {
//       debugPrint("Body: ${options.data}\n\n\n", wrapWidth: 800);
//     }
//     debugPrint("--> END ${options.method.toUpperCase()}\n\n\n", wrapWidth: 800);
//
//     renderCurlRepresentation(options);
//     super.onRequest(options, requestInterceptorHandler);
//   }
//
//   @override
//   Future<dynamic> onError(DioError dioError, ErrorInterceptorHandler errorInterceptorHandler) async {
//     debugPrint("<-- onError ${dioError.message} ${(dioError.response?.requestOptions != null ? (dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path) : 'URL')}\n\n\n",
//         wrapWidth: 800);
//     debugPrint("${dioError.response != null ? dioError.response!.data : 'Unknown Error'}\n\n\n", wrapWidth: 800);
//     debugPrint("<-- End error");
//     if (dioError.message != null && dioError.message.toString().contains('404')) {
//       (await SharedPreferences.getInstance()).setString("apiToken", "");
//       await CacheManager().cleanCache();
//     }
//     renderCurlRepresentation(dioError.requestOptions);
//     super.onError(dioError, errorInterceptorHandler);
//   }
//
//   @override
//   Future<dynamic> onResponse(Response response, ResponseInterceptorHandler responseInterceptorHandler) async {
//     debugPrint("<-- ${response.statusCode} ${(response.requestOptions.baseUrl + response.requestOptions.path)}\n\n\n", wrapWidth: 800);
//     debugPrint("Headers:");
//     // response.headers.forEach((k, v) => debugPrint('$k: $v\n\n\n', wrapWidth: 800));
//
//     debugPrint("\n\n\nResponse: ${response.data}\n\n\n\n", wrapWidth: 800);
//
//     // Clipboard.setData(ClipboardData(text: '${response.data}'));
//
//     debugPrint("<-- END HTTP");
//     renderCurlRepresentation(response.requestOptions);
//     super.onResponse(response, responseInterceptorHandler);
//   }
//
//   void renderCurlRepresentation(RequestOptions requestOptions) {
//     // debugPrint('\n\n\n renderCurlRepresentation 11   \n\n\n', wrapWidth: 800);
//     // add a breakpoint here so all errors can break
//     try {
//       debugPrint('\n\n\n\n _cURLRepresentation(requestOptions): \n ${_cURLRepresentation(requestOptions)}\n\n\n\n', wrapWidth: 800);
//     } catch (err) {
//       debugPrint('unable to create a CURL representation of the requestOptions');
//     }
//   }
//
//   String _cURLRepresentation(RequestOptions options) {
//     List<String> components = ['curl -i'];
//     if (options.method.toUpperCase() != 'GET') {
//       components.add('-X ${options.method}');
//     }
//
//     // options.headers.forEach((k, v) {
//     //   if (k != 'Cookie') {
//     //     components.add('-H "$k: $v"');
//     //   }
//     // });
//
//     if (options.data != null) {
//       // FormData can't be JSON-serialized, so keep only their fields attributes
//       if (options.data is FormData) {
//         options.data = Map.fromEntries(options.data.fields);
//       }
//
//       final data = json.encode(options.data).replaceAll('"', '\\"');
//       components.add('-d "$data"');
//     }
//
//     components.add('"${options.uri.toString()}"');
//
//     return components.join(' \\\n\t');
//   }
// }
