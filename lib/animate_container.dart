import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework_2/switch_screen.dart';

class AnimateContainer extends StatefulWidget {
  const AnimateContainer({super.key});

  @override
  State<AnimateContainer> createState() => _AnimateContainerState();
}

class _AnimateContainerState extends State<AnimateContainer> {
  List<String> lst = [
    "images/car_1.jpeg",
    "images/car_2.jpg",
    "images/car_3.webp",
    "images/car_4.jpg",
  ];

  int count = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) async {
      if (count == lst.length) {
        count = 0;
      }
      await pageViewController.animateToPage(
        count,
        duration: Duration(milliseconds: 800),
        curve: Curves.linear,
      );
      count++;
    });
  }

  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const SwitchScreen()));
                },
                child: const ListTile(
                  title: Text("Switch"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const AnimateContainer()));
                },
                child: const ListTile(
                  title: Text("Animate container"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Animate Container"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(image: AssetImage(lst[count.ceil()]))),
        child: Center(
          child: Container(
              width: double.infinity,
              height: 200,
              child: PageView.builder(
                  onPageChanged: (value) {},
                  controller: pageViewController,
                  itemCount: 4,
                  itemBuilder: (ctx, index) {
                    // print(pageViewController);
                    return Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(lst[index]),
                              fit: BoxFit.cover)),
                    );
                  })),
        ),
      ),
    );
  }
}
