import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/view/bottom%20_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

var isloggedin = true;

// ignore: camel_case_types
class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

// ignore: camel_case_types
class _loginScreenState extends State<loginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: K,\
      resizeToAvoidBottomInset: false,
      appBar: customAppbar(context),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage("lib/assets/iZone_bg.jpg"), fit: BoxFit.cover),
            ),
        child: Column(
          children: [
            Text(
              "Sign in",
              style: GoogleFonts.sora(
                color: Kgrey3,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: sWidth! / 10,
                ),
              ),
            ),
            space20(),
            space10(),
            Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    signinField(
                      "Email or Phone",
                      const Icon(Icons.email_outlined),
                      usernameController,
                      user: true,
                    ),
                    space10(),
                    signinField(
                        "Password",
                        secure: true,
                        const Icon(Icons.lock_outlined),
                        passwordController,
                        user: false),
                    space20(),
                    SizedBox(
                      height: sHeight! / 12.9,
                      width: sWidth! / 1.1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Kblue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              // checkLogin(context);.
                              checkLogin();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BottomNavbar(
                                  cart: false,
                                ),
                              ));
                            }
                          },
                          child: Text(
                            "Sign in",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: sWidth! / 18,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container signinField(String hint, Icon logo, TextEditingController ctrl,
      {bool secure = false, bool user = false}) {
    return Container(
      alignment: Alignment.center,
      height: sHeight! / 12.5,
      width: sWidth! / 1.1,
      decoration:
          BoxDecoration(color: Kgrey, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        obscureText: secure,
        textAlignVertical: TextAlignVertical.center,
        controller: ctrl,
        decoration: InputDecoration(
          // prefix: logo,

          isCollapsed: false,
          contentPadding: EdgeInsets.all(10),
          hintText: hint,

          filled: true,
          fillColor: Kgrey,
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: logo,
          ),
          hintStyle: GoogleFonts.sora(
              textStyle: TextStyle(color: Kgrey2),
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  void _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    setState(() {
      // isloggedIn1 = true;
    });
  }

  void checkLogin() {
    if (usernameController.text == "Sinan" &&
        passwordController.text == "70257") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Successfull !'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      _login();
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //   builder: (context) => homeScreen(),
      // ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid credentials !'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  AppBar customAppbar(BuildContext context) {
    return AppBar(
      centerTitle: true,

      title: Padding(
        padding: EdgeInsets.only(top: sHeight! / 5.5),
        child: Container(
          height: sWidth! / 2.5,
          child: Image.asset("lib/assets/iZone.png"),
        ),
      ),

      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: sHeight! / 3, // default is 56
      toolbarOpacity: 1,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150),
                bottomRight: Radius.circular(150)),
            gradient: LinearGradient(
                colors: [Kblue, Kblue],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
      ),
    );
  }
}
