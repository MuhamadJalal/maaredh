import 'package:http/http.dart';

class RequestModel {
  RequestModel({
    required this.endPoint,
    this.isAuthed = true,
    this.headers,
    this.body,
    this.queryParam,
    this.afterRequest,
    this.response,
  });

  String endPoint;
  bool isAuthed;
  Map<String, String>? headers;
  Map<String, String>? body;
  Map<String, dynamic>? queryParam;
  Function(dynamic)? afterRequest;
  StreamedResponse? response;

  RequestModel copyWith({
    required String endPoint,
    required Map<String, String> headers,
    Map<String, String>? body,
    Map<String, dynamic>? queryParam,
    Function(dynamic)? afterRequest,
    StreamedResponse? response,
  }) =>
      RequestModel(
        endPoint: endPoint,
        headers: headers,
        body: body ?? this.body,
        queryParam: queryParam ?? this.queryParam,
        afterRequest: afterRequest ?? this.afterRequest,
        response: response ?? this.response,
      );

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(endPoint: json["endPoint"], headers: json["headers"], body: json["body"], queryParam: json["queryParam"]);

  Map<String, dynamic> toJson() => {"endPoint": endPoint, "isAuthed": isAuthed, "body": body, "queryParam": queryParam};
}
