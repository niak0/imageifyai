import 'package:flutter/material.dart';

abstract class BaseService {
  Future<void> initialize();

  Future<T> handleOperation<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } catch (e) {
      debugPrint('Service Error: $e');
      throw ServiceException(message: e.toString());
    }
  }
}

class ServiceException implements Exception {
  final String message;
  ServiceException({required this.message});

  @override
  String toString() => message;
}
