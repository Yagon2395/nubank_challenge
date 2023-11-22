import 'package:flutter/material.dart';

import 'features/url_shortener/presentation/url_shortener_page.dart';

class NubankChallengeApp extends StatelessWidget {
  const NubankChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UrlShortenerPage(),
    );
  }
}
