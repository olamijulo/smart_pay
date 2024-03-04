// ignore_for_file: public_member_api_docs, sort_constructors_first
class SmartPayException implements Exception {
  final String? message;
  SmartPayException({
    this.message,
  });

  @override
  String toString() => 'SmartPayException(message: $message)';
}
