import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:maaredh/core/api/api_consumer.dart';
import 'package:maaredh/core/api/api_header.dart';
import 'package:maaredh/core/api/response_handler.dart';
import 'package:maaredh/core/utils/extensions/debugger_extension.dart';

class HttpConsumer implements ApiConsumer {
  final http.Client client;

  HttpConsumer({required this.client});

  @override
  Future<dynamic> delete(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters, Map<String, String>? headers}) async {
    Uri uri = queryParameters == null ? Uri.parse(path) : Uri.parse(path).replace(queryParameters: queryParameters);
    http.Response response = await client.delete(uri, headers: headers ?? await getHeaders(isAuthed: true));
    'HttpConsumer delete baseAPI ${dotenv.env['baseAPI']}$path \n headers ${headers ?? await getHeaders(isAuthed: true)}'.debug(this);
    'HttpConsumer delete response ${response.runtimeType} -- $response'.debug(this);

    return ResponseHandler().handleApiResponse(response: response);
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters, Map<String, String>? headers}) async {
    Uri uri = Uri.parse('${dotenv.env['baseAPI'] ?? ''}$path').replace(queryParameters: queryParameters);
    // Uri uri = queryParameters == null ? Uri.parse(path) : Uri.parse(path).replace(queryParameters: queryParameters);
    http.Response response = await client.get(uri, headers: headers ?? await getHeaders(isAuthed: true));
    'HttpConsumer get baseAPI ${dotenv.env['baseAPI']}$path \n queryParameters $queryParameters \n headers ${headers ?? await getHeaders(isAuthed: true)}'.debug(this);
    'HttpConsumer get response ${response.runtimeType} -- $response'.debug(this);

    return ResponseHandler().handleApiResponse(response: response);
  }

  @override
  Future post(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters, Map<String, String>? headers}) async {
    Uri uri = queryParameters == null ? Uri.parse(path) : Uri.parse(path).replace(queryParameters: queryParameters);
    http.Response response = await client.post(uri, body: body, headers: headers ?? await getHeaders(isAuthed: true));
    'HttpConsumer post baseAPI ${dotenv.env['baseAPI']}$path \n headers ${headers ?? await getHeaders(isAuthed: true)}'.debug(this);
    'HttpConsumer post response ${response.runtimeType} -- $response'.debug(this);
    return ResponseHandler().handleApiResponse(response: response);
  }

  @override
  Future put(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters, Map<String, String>? headers}) async {
    Uri uri = queryParameters == null ? Uri.parse(path) : Uri.parse(path).replace(queryParameters: queryParameters);
    http.Response response = await client.put(uri, body: body, headers: headers ?? await getHeaders(isAuthed: true));
    'HttpConsumer put baseAPI ${dotenv.env['baseAPI']}$path \n headers ${headers ?? await getHeaders(isAuthed: true)}'.debug(this);
    'HttpConsumer put response ${response.runtimeType} -- $response'.debug(this);
    return ResponseHandler().handleApiResponse(response: response);
  }
}
