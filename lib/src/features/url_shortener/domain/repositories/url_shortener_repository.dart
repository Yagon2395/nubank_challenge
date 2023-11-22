import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/url_shortener.dart';

abstract class UrlShortenerRepository {
  Future<Either<Failure, UrlShortener>> shortenUrl(String url);
}
