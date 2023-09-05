import 'package:flutter/material.dart';
import 'package:webtoonproject/models/webtoon-models.dart';
import 'package:webtoonproject/services/ApiServices.dart';
import 'package:webtoonproject/widgets/widgets-of-webtoon.dart';

//const는 컴파일 전에 값을 알고있다는 의미
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiServices
      .getTodaysToon(); //api()gettoon():여기서 api는 함수나 메서드를 반환하는 함수입니다. 이 함수를 호출한 후에 바로 gettoon() 함수나 메서드를 호출합니다.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //뼈대,구조
      appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          title: const Text(
            "오늘의 웹툰",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.green),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Expanded(
            child: FutureBuilder(
              builder: (context, snapshot) {
                //snapshot은 빌더의 상태확인 snapshot.을 누르면 여러가지 확인가능
                if (snapshot.hasData) {
                  return makeList(snapshot);
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              future: webtoons, //받는 future
            ),
          ),
        ],
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return MyWidget(
            id: webtoon.id, thumb: webtoon.thumb, title: webtoon.title);
      },
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}
