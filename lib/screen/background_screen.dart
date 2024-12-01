import 'dart:math';
import 'package:bammulguan/screen/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget child;
  final int numberOfContainers;

  const BackgroundScreen({
    super.key,
    required this.child,
    this.numberOfContainers = 70,
  });

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final textTheme = Theme.of(context).textTheme;


    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    List<Widget> generateRandomContainers() {
      return List.generate(numberOfContainers, (_) {

        final double left = random.nextDouble() * screenWidth;
        final double top = random.nextDouble() * screenHeight;

        return Positioned(
          left: left,
          top: top,
          child: Container(
            width: 2,
            height: 2,
            decoration: BoxDecoration(
              color: Color(0xFFDDF2FF),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        );
      });
    }

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [


            ...generateRandomContainers(),
            Center(child: child),
            SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("밤물관", style: textTheme.titleLarge),
                    IconButton(onPressed: (){
                      Navigator.of(context).push(_createRoute());
                    }, icon: SvgPicture.asset("assets/icons/star_icon.svg")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PostScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      var curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
