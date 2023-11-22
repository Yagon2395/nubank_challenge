import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/url_shortener.dart';
import '../repositories/url_shortener_repository.dart';
import 'base_usecase.dart';

class ShortenUrlUsecase implements BaseUsecase<UrlShortener, String> {
  final UrlShortenerRepository repository;

  ShortenUrlUsecase(this.repository);

  @override
  Future<Either<Failure, UrlShortener>> call(String url) async {
    var result = await repository.shortenUrl(url);

    return result.fold((failure) {
      return Left(failure);
    }, (urlShortener) {
      return Right(urlShortener);
    });
  }
}
