import 'package:flutter/material.dart';

enum FormStatus { incomplete, error, valid }

class RegistrationState extends ChangeNotifier {
  String _studentId = '';
  String _name = '';
  String _age = '';
  String _email = '';

  // Error messages
  String? _studentIdError;
  String? _nameError;
  String? _ageError;
  String? _emailError;

  // Getters for field values
  String get studentId => _studentId;
  String get name => _name;
  String get age => _age;
  String get email => _email;

  // Getters for error messages
  String? get studentIdError => _studentIdError;
  String? get nameError => _nameError;
  String? get ageError => _ageError;
  String? get emailError => _emailError;

  bool get isFormValid =>
      _studentIdError == null &&
      _nameError == null &&
      _ageError == null &&
      _emailError == null &&
      _studentId.isNotEmpty &&
      _name.isNotEmpty &&
      _age.isNotEmpty &&
      _email.isNotEmpty;

  FormStatus get formStatus {
    if (_studentId.isEmpty || _name.isEmpty || _age.isEmpty || _email.isEmpty) {
      return FormStatus.incomplete;
    }
    if (_studentIdError != null ||
        _nameError != null ||
        _ageError != null ||
        _emailError != null) {
      return FormStatus.error;
    }
    return FormStatus.valid;
  }

  void updateStudentId(String value) {
    _studentId = value;
    if (value.isEmpty) {
      _studentIdError = 'Student ID is required';
    } else if (value.length != 8) {
      _studentIdError = 'Student ID must be 8 digits';
    } else if (int.tryParse(value) == null) {
      _studentIdError = 'Student ID must be numeric';
    } else {
      _studentIdError = null;
    }
    notifyListeners();
  }

  void updateName(String value) {
    _name = value;
    if (value.isEmpty) {
      _nameError = 'Name is required';
    } else if (value.length < 3) {
      _nameError = 'Name must be at least 3 characters';
    } else {
      _nameError = null;
    }
    notifyListeners();
  }

  void updateAge(String value) {
    _age = value;
    if (value.isEmpty) {
      _ageError = 'Age is required';
    } else {
      int? age = int.tryParse(value);
      if (age == null) {
        _ageError = 'Please enter a valid age';
      } else if (age < 18 || age > 60) {
        _ageError = 'Age must be between 18 and 60';
      } else {
        _ageError = null;
      }
    }
    notifyListeners();
  }

  void updateEmail(String value) {
    _email = value;
    if (value.isEmpty) {
      _emailError = 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      _emailError = 'Please enter a valid email';
    } else {
      _emailError = null;
    }
    notifyListeners();
  }

  void submitForm() {
    // Here you would typically send the data to a server
    print('Form submitted with:');
    print('Student ID: $_studentId');
    print('Name: $_name');
    print('Age: $_age');
    print('Email: $_email');
  }
}
