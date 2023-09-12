
import 'package:flutter/material.dart';

class card extends StatelessWidget {
  final IconData icon;
  final String name, smallcurrency, amount;
  final bool isInverted;

  const card(
      {super.key,
      required this.icon,
      required this.name,
      required this.smallcurrency,
      required this.amount,
      required this.isInverted});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 600,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        color: isInverted ? Colors.white : const Color.fromARGB(255, 51, 50, 50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 50,
                        color: isInverted ? Colors.white : Colors.black)),
                Transform.scale(
                  scale: 12,
                  child: Transform.translate(
                    offset: const Offset(-3, 4),
                    child: Icon(icon,
                        color: isInverted
                            ? const Color.fromARGB(255, 209, 204, 204)
                            : Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  amount,
                  style: TextStyle(
                      color: isInverted ? Colors.white : Colors.black),
                ),
                Text(smallcurrency,
                    style: TextStyle(
                        color: isInverted ? Colors.white : Colors.black))
              ],
            )
          ],
        ),
      ),
    );
  }
}


//