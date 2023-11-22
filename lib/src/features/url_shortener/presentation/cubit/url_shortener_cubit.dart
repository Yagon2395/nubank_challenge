import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/url_shortener.dart';
import '../../domain/usecases/shorten_url_usecase.dart';

part 'url_shortener_state.dart';

class UrlShortenerCubit extends Cubit<UrlShortenerState> {
  final ShortenUrlUsecase shortenUrlUsecase;

  UrlShortenerCubit(this.shortenUrlUsecase)
      : super(UrlShortenerState.initial());

  void onUrlChanged(String url) {
    emit(state.copyWith(
      url: url,
    ));
  }

  FutureOr<void> shortenUrl() async {
    if (state.status == NetworkStatus.loading || state.url.isEmpty) {
      return;
    }

    emit(state.copyWith(
      status: NetworkStatus.loading,
      failure: null,
    ));

    final result = await shortenUrlUsecase(state.url);
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: NetworkStatus.idle,
          failure: failure,
        ));
      },
      (urlShortener) {
        emit(state.copyWith(
          status: NetworkStatus.idle,
          shortenedUrls: [urlShortener, ...state.shortenedUrls],
        ));
      },
    );
  }
}
