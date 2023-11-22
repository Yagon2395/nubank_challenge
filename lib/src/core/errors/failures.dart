import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String message();

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  @override
  String message() =>
      'Network error, please check your connection and service status to try again.';
}

class UnknownFailure extends Failure {
  @override
  String message() => 'Something went wrong, please try again.';
}
