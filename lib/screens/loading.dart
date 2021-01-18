import 'package:e_commerce_app/screens/user/home_screen.dart';
import 'package:e_commerce_app/services/user_operations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatefulWidget {
  static String routeName = "Loading";
  final String email;

  const Loading({this.email});
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserOperations _userOperations = UserOperations();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/loading.json',
            controller: _controller,
            onLoaded: (composition) {
              _userOperations.getCurrentUserInfo(widget.email, context);

              _controller
                ..duration = composition.duration * 2
                ..forward();
              _controller.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
