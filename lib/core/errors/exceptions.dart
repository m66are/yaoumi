import 'package:yaoumi/core/errors/failure.dart';

abstract class AppException implements Exception {
  final String message;
  final String? source;
  final DateTime timestamp;
  final StackTrace stackTrace;

  AppException({
    required this.message,
    this.source,
    DateTime? timestamp,
    required this.stackTrace,
  }) : timestamp = timestamp ?? DateTime.now();

  @override
  String toString() =>
      'AppException: $message (source: $source, timestamp: $timestamp, stackTrace: ${stackTrace.toString()})';

  Failure toFailure();
}

class DataNotFoundException extends AppException {
  DataNotFoundException({String? message})
      : super(
            message: message ?? "DataNotFound",
            source: 'Data Source',
            stackTrace: StackTrace.current);

  @override
  Failure toFailure() => Failure(
        message: message,
        exception: this,
      );
}
