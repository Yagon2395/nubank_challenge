import '../models/url_links_model.dart';
import '../models/url_model.dart';
import '../models/url_shortener_model.dart';
import 'url_shortener_datasource.dart';

class UrlShortenedMockedDatasource implements UrlShortenerDatasource {
  @override
  Future<UrlShortenerModel> shortenUrl(UrlModel url) async {
    try {
      final alias = url.url
          .replaceAll('https', '')
          .replaceAll('http', '')
          .replaceAll(r'/', '')
          .replaceAll(':', '')
          .replaceAll('www.', '')
          .replaceAll('.com', '')
          .replaceAll('.br', '');

      return UrlShortenerModel(
        alias: alias,
        links: UrlLinksModel(self: url.url, short: '$alias.com'),
      );
    } catch (_) {
      rethrow;
    }
  }
}
