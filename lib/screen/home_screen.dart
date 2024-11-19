


import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("data"),),
      body: Center(
        child: Column(
            children:[
              Text("headlineLarge", style: textTheme.headlineLarge,),
              Text("headlineMedium", style: textTheme.headlineMedium,),
              Text("headlineSmall", style: textTheme.headlineSmall,),
              Text("bodyLarge", style: textTheme.bodyLarge,),
              Text("bodyMedium", style: textTheme.bodyMedium,),
              Text("bodySmall", style: textTheme.bodySmall,),
              Text("labelLarge", style: textTheme.labelLarge,),
              Text("labelMedium", style: textTheme.labelMedium,),
              Text("labelSmall", style: textTheme.labelSmall,),
            ]
        ),
      ),
    );
  }
}
