// ignore_for_file: public_member_api_docs, sort_constructors_first
// core/errors/failure.dart

import 'package:yaoumi/core/errors/exceptions.dart';

class Failure {
  final String message;
  final AppException? exception;
  const Failure({
    required this.message,
    this.exception,
  });
}
