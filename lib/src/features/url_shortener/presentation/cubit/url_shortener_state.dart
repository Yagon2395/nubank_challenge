part of 'url_shortener_cubit.dart';

enum NetworkStatus { idle, loading }

class UrlShortenerState extends Equatable {
  final String url;
  final NetworkStatus status;
  final List<UrlShortener> shortenedUrls;
  final Failure? failure;

  const UrlShortenerState({
    required this.url,
    required this.status,
    required this.shortenedUrls,
    this.failure,
  });

  factory UrlShortenerState.initial() {
    return const UrlShortenerState(
      url: '',
      status: NetworkStatus.idle,
      shortenedUrls: [],
      failure: null,
    );
  }

  UrlShortenerState copyWith({
    String? url,
    NetworkStatus? status,
    List<UrlShortener>? shortenedUrls,
    Failure? failure,
  }) {
    return UrlShortenerState(
      url: url ?? this.url,
      status: status ?? this.status,
      shortenedUrls: shortenedUrls ?? this.shortenedUrls,
      failure: failure,
    );
  }

  @override
  List<Object?> get props => [
        url,
        status,
        shortenedUrls,
        failure,
      ];
}
