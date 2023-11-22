import '../models/url_model.dart';
import '../models/url_shortener_model.dart';

abstract class UrlShortenerDatasource {
  Future<UrlShortenerModel> shortenUrl(UrlModel url);
}
