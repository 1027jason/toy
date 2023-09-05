import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:toonflix/card.dart';
import 'package:toonflix/widgets/widget.dart';

void main() {
  runApp(const App()); //시작점 root
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 32, 32, 32),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 80),
                        const Text(
                          'Hey Selena',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 120),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '\$5 194 283',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 66,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Assuming Button is a custom widget
                    Button(
                      text: 'Transfer',
                      textcolor: Colors.black,
                      bdColor: Color.fromARGB(255, 204, 138, 24),
                    ),
                    Button(
                      text: 'Request',
                      textcolor: Colors.white,
                      bdColor: Colors.black,
                    )
                  ],
                ),
                const SizedBox(height: 70),
                Column(
                  children: [
                    Transform.translate(
                      offset: const Offset(0, 0),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: card(
                          isInverted: false,
                          icon: Icons.euro_outlined,
                          name: 'Euro',
                          smallcurrency: 'EUR',
                          amount: '5734',
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -20),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: card(
                          isInverted: true,
                          icon: Icons.monetization_on_outlined,
                          name: 'Dollor',
                          smallcurrency: 'USD',
                          amount: '55.622',
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -60),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: card(
                          isInverted: false,
                          icon: Icons.currency_yen,
                          name: 'Yen',
                          smallcurrency: 'YEN',
                          amount: '7643.23',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
