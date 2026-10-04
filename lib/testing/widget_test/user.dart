

import 'package:equatable/equatable.dart';

class User extends Equatable{

  int id;
  String name;
  String email;

  User({required this.id, required this.name, required this.email});

  @override
  List<Object?> get props => [id, name, email];
}