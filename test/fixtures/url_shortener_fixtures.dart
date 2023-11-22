import 'package:nubank_challenge/src/features/url_shortener/data/models/url_links_model.dart';
import 'package:nubank_challenge/src/features/url_shortener/data/models/url_model.dart';
import 'package:nubank_challenge/src/features/url_shortener/data/models/url_shortener_model.dart';
import 'package:nubank_challenge/src/features/url_shortener/domain/entities/url_links.dart';
import 'package:nubank_challenge/src/features/url_shortener/domain/entities/url_shortener.dart';

const tUrl = 'https://www.google.com';
const tShort = 'shorturl.at/uFIMY';

const UrlLinks tUrlLinks = UrlLinks(
  self: tUrl,
  short: tShort,
);

const UrlShortener tUrlShortener = UrlShortener(
  alias: 'Google',
  links: tUrlLinksModel,
);

const UrlLinksModel tUrlLinksModel = UrlLinksModel(
  self: tUrl,
  short: tShort,
);

const UrlShortenerModel tUrlShortenerModel = UrlShortenerModel(
  alias: 'Google',
  links: tUrlLinksModel,
);

const UrlModel tUrlModel = UrlModel(url: tUrl);
