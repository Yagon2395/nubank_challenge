import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/url_shortener_cubit.dart';

class UrlShortenerForm extends StatelessWidget {
  const UrlShortenerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 52),
      child: Row(
        children: [
          Expanded(
            child: _UrlTextField(),
          ),
          SizedBox(width: 16),
          _SubmitButton(),
        ],
      ),
    );
  }
}

class _UrlTextField extends StatelessWidget {
  const _UrlTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) =>
          context.read<UrlShortenerCubit>().onUrlChanged(value),
      cursorColor: const Color(0xff3D3D3D),
      style: const TextStyle(
        fontFamily: 'Graphik',
        fontSize: 16,
        color: Color(0xff3D3D3D),
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 8,
        ),
        filled: true,
        fillColor: const Color(0xffE9E9E9),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<UrlShortenerCubit>().shortenUrl(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 8,
        ),
        decoration: const BoxDecoration(
            color: Color(0xffE9E9E9),
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: const Icon(
          Icons.send,
          color: Color(0xff3D3D3D),
          size: 32.0,
        ),
      ),
    );
  }
}
