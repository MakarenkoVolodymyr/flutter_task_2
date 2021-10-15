import 'dart:ui';

import 'package:flutter/widgets.dart';

class Contact{
  Contact({required this.firstName,required this.lastName,required this.company,required this.description,required this.avatarPhoto});
  final String firstName;
  final String lastName;
  final String company;
  final String description;
  final NetworkImage avatarPhoto;
}
