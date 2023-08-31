/*import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class User{
  @Id()
  int id = 0;
  String? firstName;
  String? lastName;
  String? designation;
  String? department;
  String? email;
  String? userName;
  String? password;
  int? phoneNumber;
  String photoPath;

  User(this.id, this.firstName, this.lastName, this.designation,
      this.department, this.email, this.userName, this.password,
      this.phoneNumber, this.photoPath);

  ImageProvider getImageProvider() {
    return FileImage(File(photoPath));
  }
}*/