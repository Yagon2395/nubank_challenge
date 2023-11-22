import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/url_shortener.dart';
import '../../domain/repositories/url_shortener_repository.dart';
import '../datasources/url_shortener_datasource.dart';
import '../models/url_model.dart';

class UrlShortenerRepositoryImpl implements UrlShortenerRepository {
  final UrlShortenerDatasource datasource;

  UrlShortenerRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, UrlShortener>> shortenUrl(String url) async {
    try {
      final result = await datasource.shortenUrl(UrlModel(url: url));

      return Right(
        UrlShortener(
          alias: result.alias,
          links: result.links,
        ),
      );
    } on ServerException catch (_) {
      return Left(ServerFailure());
    } catch (_) {
      return Left(UnknownFailure());
    }
  }
}
