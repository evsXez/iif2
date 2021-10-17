import 'package:equatable/equatable.dart';

class AccountOptions {
  final bool isArchiveAvailable;
  final bool isDeleteAvailable;

  AccountOptions({
    required this.isArchiveAvailable,
    required this.isDeleteAvailable,
  });
}
