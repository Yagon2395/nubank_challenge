import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UrlShortenerShimmer extends StatelessWidget {
  const UrlShortenerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 24,
                  width: 200,
                  color: Colors.black,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 24,
                  width: 160,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
