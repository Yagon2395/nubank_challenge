import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/url_shortener_cubit.dart';
import 'widgets.dart';

class UrlShortenerList extends StatelessWidget {
  const UrlShortenerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UrlShortenerCubit, UrlShortenerState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state.failure != null) {
          final snackBar = _buildErrorSnackbar(
              closeAction: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              message: state.failure!.message());

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        if (state.status == NetworkStatus.loading) {
          return const UrlShortenerShimmer();
        }

        return ListView.separated(
          itemCount: state.shortenedUrls.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            final item = state.shortenedUrls[index];
            return UrlShortenerItem(item: item);
          },
        );
      },
    );
  }

  SnackBar _buildErrorSnackbar({
    required VoidCallback? closeAction,
    required String message,
  }) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 1.0,
      content: Row(
        children: [
          Expanded(
            child: Text(message),
          ),
          IconButton(
            onPressed: closeAction,
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
