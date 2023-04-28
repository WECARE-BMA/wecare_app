import 'package:flutter/material.dart';

class ThirdPartyAuths extends StatelessWidget {
  const ThirdPartyAuths({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: Text(
              'or continue with',
              style: TextStyle(color: Color(0xff787878)),
            ),
          ),
          FilledButton(
              onPressed: () {},
              child: Container(
                child: Row(
                  children: [Image.asset('assets/images/google_logo.png')],
                ),
              )),
          Container(
            padding: const EdgeInsets.only(top: 6, bottom: 20),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    child: Text('Have an account?',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xff787878))),
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, '/signInPage')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
