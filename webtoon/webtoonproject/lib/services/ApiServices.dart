import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoonproject/models/episodes_model.dart';
import 'package:webtoonproject/models/webtoon-models.dart';
import 'package:webtoonproject/models/wetoon_detail_model.dart';

class ApiServices {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToon() async {
    //클래스에 속한 메서드는 static
    List<WebtoonModel> WebtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        WebtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return WebtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    //반환 형태는 WebtoonDetailModel이고 필요한 parameter는 String
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<EpisodesModel>> getEpisodes(String id) async {
    List<EpisodesModel> Episodes = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        Episodes.add(EpisodesModel.fromJson(episode));
      }
      return Episodes;
    }
    throw Error();
  }
}
