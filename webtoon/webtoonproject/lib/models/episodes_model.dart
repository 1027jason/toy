class EpisodesModel {
  final String id, date, title, rating;

  EpisodesModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        date = json['date'],
        title = json['title'],
        rating = json['rating'];
}
