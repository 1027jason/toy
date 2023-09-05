class WebtoonModel {
  final String id, thumb, title;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        thumb = json['thumb'],
        title = json['title'];
}
