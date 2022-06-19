// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FingerprintApp(),
    ));

class FingerprintApp extends StatefulWidget {
  @override
  _FingerprintAppState createState() => _FingerprintAppState();
}

class _FingerprintAppState extends State<FingerprintApp> {
  //Main function that allows us to use the finger print sensor and authenticate
  //but local_auth dependency is required as well as the fingerprint permission
  //now we'll start by adding variables
  LocalAuthentication auth = LocalAuthentication();
  //late bool _canCheckBiometric;
  //late List<BiometricType> _availableBiometric;
  String authorized =
      "Not authorized"; // String checks if we are present or not

  //Now creating the function that will allow for checking biometric sensors
  Future<void> _checkBiometric() async {
    bool canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      //_canCheckBiometric = canCheckBiometric;
    });
  }

  // now that we know if we have biometric check rights,
  //let's get the available biometic sensor for our device
  Future<void> _getAvailableBiometric() async {
    List<BiometricType> availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    setState(() {
      //_availableBiometric = availableBiometric;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF3C3E52),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 50.0),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/fingerprint3.png',
                      width: 120,
                    ),
                    Text(
                      "Fingerprint Auth",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15.0),
                      width: 150.0,
                      child: Text(
                        "Authenticate using your fingerprint",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15.0),
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        elevation: 0.0,
                        color: Color(0xFF04A5ED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 24.0),
                          child: Text(
                            "Authenticate",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
