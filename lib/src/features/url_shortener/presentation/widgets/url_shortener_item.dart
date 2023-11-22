import 'package:flutter/material.dart';

import '../../domain/entities/url_shortener.dart';

class UrlShortenerItem extends StatelessWidget {
  final UrlShortener item;
  const UrlShortenerItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.alias,
            style: const TextStyle(
              color: Color(0xff3D3D3D),
              fontFamily: 'Graphik',
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.links.short,
            style: const TextStyle(
              color: Color(0xff999999),
              fontFamily: 'Graphik',
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
