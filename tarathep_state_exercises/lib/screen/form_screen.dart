import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/registration_state.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Registration"),
        centerTitle: true,
      ),
      body: Consumer<RegistrationState>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FormStatusIndicator(status: provider.formStatus),
                CustomTextField(
                  label: "Student ID",
                  value: provider.studentId,
                  error: provider.studentIdError,
                  onChanged: provider.updateStudentId,
                ),
                SizedBox(height: 24),
                CustomTextField(
                  label: "Name",
                  value: provider.name,
                  error: provider.nameError,
                  onChanged: provider.updateName,
                ),
                SizedBox(height: 24),
                CustomTextField(
                  label: "Age",
                  value: provider.age,
                  error: provider.ageError,
                  onChanged: provider.updateAge,
                ),
                SizedBox(height: 24),
                CustomTextField(
                  label: "Email",
                  value: provider.email,
                  error: provider.emailError,
                  onChanged: provider.updateEmail,
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: provider.isFormValid ? provider.submitForm : null,
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black, width: 2),
                    backgroundColor: Colors.lightBlueAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class FormStatusIndicator extends StatelessWidget {
  final FormStatus status;

  const FormStatusIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;

    switch (status) {
      case FormStatus.incomplete:
        color = Colors.yellow;
        text = 'Please fill all fields';
        break;
      case FormStatus.error:
        color = Colors.red;
        text = 'Please fix the errors';
        break;
      case FormStatus.valid:
        color = Colors.green;
        text = 'Form is valid';
        break;
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          backgroundColor: color,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String value;
  final String? error;
  final Function(String) onChanged;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.error,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 16),
        errorText: error,
        errorStyle: const TextStyle(fontSize: 14, color: Colors.red),
        border: const OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
      controller: TextEditingController(text: value)
        ..selection = TextSelection.fromPosition(
          TextPosition(offset: value.length),
        ),
    );
  }
}
