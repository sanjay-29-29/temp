import 'package:logger/logger.dart';

class CustomLogPrinter extends LogPrinter {
  final Map<Level, String> levelColors = {
    Level.debug: '\x1B[36m', // Cyan
    Level.info: '\x1B[32m', // Green
    Level.warning: '\x1B[33m', // Yellow
    Level.error: '\x1B[31m', // Red
  };

  @override
  List<String> log(LogEvent event) {
    final color = levelColors[event.level] ?? '\x1B[37m';
    final timestamp = DateTime.now().toIso8601String();
    final level = event.level.toString().toUpperCase();
    final message = event.message;
    final error = event.error != null ? '\nError: ${event.error}' : '';
    final stackTrace =
        event.stackTrace != null ? '\nStack Trace: ${event.stackTrace}' : '';

    return [
      '$color$timestamp [$level]: $message$error$stackTrace\x1B[0m',
    ];
  }
}

final logger = Logger(
  level: Level.info,
  printer: CustomLogPrinter(),
);
