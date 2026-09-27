

import 'package:equatable/equatable.dart';

class User extends Equatable{

  int? _id;
  String? _name;
  String? _username;
  String? _email;

  User({int? id, String? name, String? username, String? email}){
    _id = id;
    _name = name;
    _username = username;
    _email = email;
  }


  User.fromJson(Map<String, dynamic> json){
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['username'] = _username;
    data['email'] = _email;
    return data;
  }


  int? get id => _id;
  String? get name => _name;
  String? get username => _username;
  String? get email => _email;

  @override
  // TODO: implement props
  List<Object?> get props => [_id, _name, _username, _email];


}