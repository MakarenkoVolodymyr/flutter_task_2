import 'package:flutter/material.dart';

class Contact {
  Contact(
      {required this.firstName,
        required this.lastName,
        required this.phone,
        required this.company,
        required this.description,
        required this.avatarPhoto});

  String firstName;
  String lastName;
  String phone;
  String company;
  String description;
  NetworkImage avatarPhoto;
}
