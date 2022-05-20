import 'package:flutter/material.dart';

class User {
  Name name;
  Picture picture;
  String email;
  String phone;

  User(
      {required this.name,
      required this.picture,
      required this.email,
      required this.phone});

  User.fromJson(Map<String, dynamic> json)
      : this.name = Name.fromJson(json['name']),
        this.picture = Picture.fromJson(json['picture']),
        this.email = json['email'],
        this.phone = json['phone'];
}

class Name {
  String firstName;
  String lastName;

  Name({required this.firstName, required this.lastName});

  Name.fromJson(Map<String, dynamic> json)
      : this.firstName = json['first'],
        this.lastName = json['last'];
}

class Picture {
  String picUrl;

  Picture({required this.picUrl});

  Picture.fromJson(Map<String, dynamic> json) : this.picUrl = json['large'];
}
