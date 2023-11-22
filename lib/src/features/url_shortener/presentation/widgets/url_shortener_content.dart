import 'package:flutter/material.dart';

import 'widgets.dart';

class UrlShortenerContent extends StatelessWidget {
  const UrlShortenerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UrlShortenerForm(),
        _ShortenedUrlsInfo(),
        Expanded(child: UrlShortenerList()),
      ],
    );
  }
}

class _ShortenedUrlsInfo extends StatelessWidget {
  const _ShortenedUrlsInfo();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 16),
      child: Text(
        'Recently shortened URLs',
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Color(0xff3D3D3D),
          fontFamily: 'Graphik',
          fontWeight: FontWeight.w500,
          fontSize: 22,
        ),
      ),
    );
  }
}
