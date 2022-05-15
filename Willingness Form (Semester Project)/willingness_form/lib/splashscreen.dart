import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'main.dart';
class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(1.18),

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(78.0),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText(
                            'Willingness Form CUI',
                            textStyle: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),

                        ],

                      ),
                    ),
                    SizedBox(height: 20),
                    Lottie.asset(
                      'assets/lottie.json',
                      height: 400,
                      width: 1200,
                      animate: true,

                      controller: _controller,
                      onLoaded: (composition) {
                        _controller
                          ..duration = composition.duration
                          ..forward().whenComplete(() => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          ));
                        // Navigator.pop(context);

                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.all(78.0),
                      child: AnimatedTextKit(
                        animatedTexts: [

                          WavyAnimatedText('By Suleman & Umer',textStyle: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),),

                        ],

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )

    );

  }
}