import 'package:flutter/material.dart';
import 'package:my_app/widget/custom_button.dart';
import 'package:flutter/gestures.dart';

class first_screen extends StatefulWidget {
  const first_screen({Key? key}) : super(key: key);
  @override
  State<first_screen> createState() => _first_screenState();
}

class _first_screenState extends State<first_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 38.0),
              child: Image.asset(
                'lib/assets/images/Frame 1000004480.png',
                width: 250,
                height: 350,
              ),
            ),
            const Text(
              '''
Simple way 
to help control 
your savings
             ''',
              style: const TextStyle(
                fontSize: 40,
                fontFamily: 'Italica',
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomButton(text: 'Get Started'),
            ),
            RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(fontSize: 12.0, color: Colors.grey),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Log in',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Add your navigation code here
                      },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
