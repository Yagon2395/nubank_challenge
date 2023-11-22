import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nubank_challenge/src/core/utils/constants.dart';

import '../../features/url_shortener/data/datasources/url_shortener_datasource.dart';
import '../../features/url_shortener/data/datasources/url_shortener_mocked_datasource.dart';
import '../../features/url_shortener/data/datasources/url_shortener_remote_datasource.dart';
import '../../features/url_shortener/data/repositories/url_shortener_repository_impl.dart';
import '../../features/url_shortener/domain/repositories/url_shortener_repository.dart';
import '../../features/url_shortener/domain/usecases/shorten_url_usecase.dart';
import '../../features/url_shortener/presentation/cubit/url_shortener_cubit.dart';

final injector = GetIt.instance;

void initializeDependencies(Environment environment) async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Datasources
  injector.registerSingleton<UrlShortenerDatasource>(
    environment == Environment.heroku
        ? UrlShortenerRemoteDatasource(injector())
        : UrlShortenedMockedDatasource(),
  );

  // Repositories
  injector.registerSingleton<UrlShortenerRepository>(
    UrlShortenerRepositoryImpl(injector()),
  );

  // UseCases
  injector.registerSingleton<ShortenUrlUsecase>(
    ShortenUrlUsecase(injector()),
  );

  // Cubits
  injector.registerSingleton<UrlShortenerCubit>(
    UrlShortenerCubit(injector()),
  );
}
