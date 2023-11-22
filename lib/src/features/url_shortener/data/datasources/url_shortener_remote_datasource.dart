import 'package:dio/dio.dart';
import 'package:nubank_challenge/src/core/errors/exceptions.dart';
import 'package:nubank_challenge/src/features/url_shortener/data/models/url_model.dart';
import 'package:nubank_challenge/src/features/url_shortener/data/models/url_shortener_model.dart';

import '../../../../core/utils/constants.dart';
import 'url_shortener_datasource.dart';

class UrlShortenerRemoteDatasource implements UrlShortenerDatasource {
  final Dio dio;

  UrlShortenerRemoteDatasource(this.dio);

  @override
  Future<UrlShortenerModel> shortenUrl(UrlModel url) async {
    try {
      final response = await dio.post(
        '$baseUrl/api/alias',
        data: url,
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        return UrlShortenerModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } on DioException catch (_) {
      throw ServerException();
    }
  }
}
