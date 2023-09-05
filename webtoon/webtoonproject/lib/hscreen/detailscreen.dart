import 'package:flutter/material.dart';
import 'package:webtoonproject/models/wetoon_detail_model.dart';
import 'package:webtoonproject/services/ApiServices.dart';

class Detail extends StatelessWidget {
  final String id, thumb, title, about, genre, age;

  const Detail({
    Key? key,
    required this.id,
    required this.thumb,
    required this.title,
    required this.about,
    required this.age,
    required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text(
          title,
          style: const TextStyle(
              fontFamily: AutofillHints.birthday,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: id,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(0, 0),
                            color: Colors.black.withOpacity(0.5)),
                      ]),
                  height: 300,
                  child: Image.network(
                    thumb,
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: FutureBuilder<WebtoonDetailModel>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!;
                  // 데이터를 사용하여 위젯을 구성합니다.

                  return Container(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 20),
                          child: Opacity(
                            opacity: 0.5, // 완전 불투명한 상태
                            child: Text(data.about),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                '장르:${data.genre}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                ' 연령:${data.age}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Expanded(
                                  child: FutureBuilder(
                                    builder: (context, snapshot) {
                                      //snapshot은 빌더의 상태확인 snapshot.을 누르면 여러가지 확인가능
                                      if (snapshot.hasData) {
                                        //return makeList(snapshot);
                                      }

                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                    // future: webtoons, //받는 future
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              future: ApiServices.getToonById(id),
            ),
          ),
        ],
      ),
    );
  }

  // TODO: makeList 함수와 webtoons 변수/메서드를 구현하십시오.
}
