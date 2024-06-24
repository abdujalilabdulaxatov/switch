import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework_2/animate_container.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool isDone = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) => SwitchScreen()));
                },
                child: const ListTile(
                  title: Text("Switch"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) => AnimateContainer()));
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
        title: const Text("Animated Switch"),
      ),
      body: Center(
        child: AnimatedContainer(
            width: double.infinity,
            height: 200,
            color: isDone ? Colors.blue : Colors.black87,
            duration: const Duration(milliseconds: 600),
            child: Center(
              child: Container(
                width: 140,
                height: 60,
                child: AnimatedContainer(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: isDone ? Colors.white : Colors.grey),
                  duration: const Duration(milliseconds: 600),
                  child: AnimatedAlign(
                      alignment:
                          isDone ? Alignment.centerLeft : Alignment.centerRight,
                      duration: const Duration(milliseconds: 600),
                      child: InkWell(
                        onTap: () {
                          isDone = !isDone;
                          setState(() {});
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 600),
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.amber),
                          child: Center(
                              child: isDone
                                  ? SvgPicture.asset(
                                      "images/airplane_black.svg",
                                      width: 40,
                                      height: 40,
                                    )
                                  : SvgPicture.asset(
                                      "images/airplane_blue.svg",
                                      width: 40,
                                      height: 40,
                                    )),
                        ),
                      )),
                ),
              ),
            )),
      ),
    );
  }
}
