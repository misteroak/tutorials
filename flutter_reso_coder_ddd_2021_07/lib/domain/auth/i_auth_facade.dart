import 'package:dartz/dartz.dart';

import 'auth_failures.dart';
import 'value_objects.dart';

/// Facade are at the same level as repositories. Facade is a design pattern that takes
/// multiple interfaces and aggregating them into a single interface
///
/// Notice in the diagram that Facades (same as Repositories) accepts exceptions and return failures

abstract class IAuthFacade {
  /// This method (and the rest of the methods) return a void. But per Reso it is highly recommended
  /// to not use 'void' on the right side of either, since it is not a class in dart,
  /// just a simple keyword, at that will cause a ton of problems down the road.
  /// We instead use Unit. It will be equivalent of void for us.
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
