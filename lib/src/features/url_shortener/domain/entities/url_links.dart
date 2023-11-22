import 'package:equatable/equatable.dart';

class UrlLinks extends Equatable {
  final String self;
  final String short;

  const UrlLinks({
    required this.self,
    required this.short,
  });

  @override
  List<Object?> get props => [
        self,
        short,
      ];
}
