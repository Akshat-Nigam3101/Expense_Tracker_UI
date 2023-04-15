import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    style:
    TextButton.styleFrom(
      primary: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          minimumSize: const Size(
            400,
            60,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: Colors.orange),
          ),
        ),
      ),
    );
  }
}
