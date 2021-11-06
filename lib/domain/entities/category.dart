import 'package:equatable/equatable.dart';

class Category with EquatableMixin {
  final String name;
  Category(this.name);

  @override
  List<Object?> get props => [name];

  @override
  String toString() => name;
}
