import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Confirmation"),
            content: const Text("Submitting information"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, "Cancel"),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, "OK"),
                child: const Text("OK"),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontFamily: "Prompt",
            fontSize: 24,
          ),
        ),
        child: const Text(
          "Submit",
          style: TextStyle(
            color: Color.fromARGB(255, 3, 174, 68),
          ),
        ),
      ),
    );
  }
}
