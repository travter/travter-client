
import 'package:dartz/dartz.dart';

import '../authentication/auth_failure.dart';

typedef AuthenticationExceptionCode = String;
typedef AuthResult = Either<AuthFailure, Unit>;