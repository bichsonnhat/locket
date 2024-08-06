import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('assets/images/avatar.png'),
            fit: BoxFit.values[1],
            alignment: Alignment.topCenter,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.yellow[300]!,
              Colors.yellow[200]!,
              Colors.yellow[100]!
            ]
          )
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: ClipOval(
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image(image: AssetImage('assets/images/avatar.png')),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}