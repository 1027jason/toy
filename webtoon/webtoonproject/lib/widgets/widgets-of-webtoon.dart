import 'package:flutter/material.dart';
import 'package:webtoonproject/hscreen/detailscreen.dart';

class MyWidget extends StatelessWidget {
  final String id, thumb, title;

  const MyWidget(
      {super.key, required this.id, required this.thumb, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(
              id: id,
              thumb: thumb,
              title: title,
              about: 'Sample About',
              age: 'Sample Age',
              genre: 'Sample Genre',
            ),
            fullscreenDialog: true,
          ),
        ); //위젯을 루트로 감싸서  감싸주어야한다.
      },
      child: Column(children: [
        Hero(
          tag: id,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.5)),
                ]),
            height: 400,
            child: Image.network(
              thumb,
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 30),
        )
      ]),
    );
  }
}
