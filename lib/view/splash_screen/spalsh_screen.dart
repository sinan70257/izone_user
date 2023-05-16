import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone_user/constants/constants.dart';
import 'package:izone_user/controller/get_data.dart';
import 'package:izone_user/view/bottom%20_navbar.dart';
import 'package:izone_user/view/cart_screen/cart_screen.dart';
import 'package:izone_user/view/login_screen/login_screen.dart';
import 'package:loading_indicator/loading_indicator.dart';

double? mHeight;
double? mWidth;
bool isLoggedIn = false;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mHeight = MediaQuery.of(context).size.height;
    mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      children: [
        StreamBuilder(
            stream: getImages(),
            builder: (context, snapshot) {
              img = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                Container(
                  height: mHeight,
                  width: mWidth,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/assets/izone splash.jpg"),
                          fit: BoxFit.cover)),
                );
              }
              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  // return Text('list empty');
                }
              }
              return SizedBox();
            }),
        StreamBuilder(
            stream: getProducts(),
            builder: (context, snapshot) {
              final data = snapshot.data;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: mHeight,
                  width: mWidth,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/assets/izone splash.jpg"),
                          fit: BoxFit.cover)),
                );
              }
              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  iphone = data!
                      .where((element) => "iPhone" == element["category"])
                      .toList();
                  ipad = data
                      .where((element) => "iPad" == element["category"])
                      .toList();
                  watch = data
                      .where((element) => "Apple watch" == element["category"])
                      .toList();
                  macbook = data
                      .where((element) => "Macbook" == element["category"])
                      .toList();
                  getwish();
                  allcat = allProducts = data;
                }
              }
              return Container(
                height: mHeight,
                width: mWidth,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/assets/izone splash.jpg"),
                        fit: BoxFit.cover)),
              );
            }),
      ],
    ));
  }

  void checkLogin() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CheckUserLogin(),
      ),
    );
  }
}

class CheckUserLogin extends StatelessWidget {
  const CheckUserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingIndicator(
                indicatorType: Indicator.circleStrokeSpin,
                colors: [white],
                strokeWidth: 2,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          if (snapshot.hasData) {
            // return BottomNavbar(
            //   cart: false,
            // );
            return BottomNavbar(
              cart: false,
            );
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
