import "package:flutter/material.dart";

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  final String text;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 78, 9, 92),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
