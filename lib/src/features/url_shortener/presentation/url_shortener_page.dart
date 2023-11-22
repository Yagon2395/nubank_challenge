import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank_challenge/src/core/di/injector.dart';
import 'package:nubank_challenge/src/features/url_shortener/presentation/widgets/url_shortener_content.dart';

import 'cubit/url_shortener_cubit.dart';

class UrlShortenerPage extends StatelessWidget {
  const UrlShortenerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<UrlShortenerCubit>(
          create: (context) => injector(),
          child: const UrlShortenerContent(),
        ),
      ),
    );
  }
}
