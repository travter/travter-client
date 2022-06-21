import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'request_failure.dart';

// chyba do wywalenia

@immutable
class Requester {
   Future<Either<RequestFailure, Response<String>>> sendRequest(
    Future<Either<RequestFailure, Response<String>>> Function() forwardedCall,
  ) async {
    try {
      final response = forwardedCall();

      return response;
    } on DioError catch (error) {
      if (error.response != null) {
        final requestFailure =
            RequestFailure.invalidResponseStatusCode(response: error);

        return left(requestFailure);
      } else {
        final requestFailure = RequestFailure.noResponse(error: error);

        return left(requestFailure);
      }
    }
  }
}
