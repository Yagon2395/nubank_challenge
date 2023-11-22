import 'package:equatable/equatable.dart';

import 'url_links.dart';

class UrlShortener extends Equatable {
  final String alias;
  final UrlLinks links;

  const UrlShortener({
    required this.alias,
    required this.links,
  });

  @override
  List<Object?> get props => [
        alias,
        links,
      ];
}
