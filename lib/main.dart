import 'package:flutter/material.dart';
import 'package:nubank_challenge/src/core/di/injector.dart';
import 'package:nubank_challenge/src/core/utils/constants.dart';

import 'src/app.dart';

void main() {
  /// The service was offline when this challenge was developed,
  /// so I created the mocked environment and heroku (nubank service).
  /// Both should work normally, but the online option has not been tested
  /// due to the non-availability of the nubank service provided in the instructions.
  /// The options are [Environment.heroku] and [Environment.mocked]
  initializeDependencies(Environment.heroku);
  runApp(const NubankChallengeApp());
}
