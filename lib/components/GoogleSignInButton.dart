import 'package:flutter/material.dart';

class GoogleBtn1 extends StatelessWidget {
final Function() onPressed;
  const GoogleBtn1({
required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 54,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
        ),
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2Fsearch%20(2).png?alt=media&token=24a918f7-3564-4290-b7e4-08ff54b3c94c",
                width: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Continue with Google",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ],
          ),
          onPressed: onPressed,
        ));
  }
}
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  final Function onPressed;

  GoogleSignInButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Image.asset('assets/google_logo.png', height: 24.0),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          'Sign in with Google',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black54),
        shadowColor: MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.5)),
        elevation: MaterialStateProperty.all<double>(5.0),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 12.0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}