import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class BaseUsecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}
