import 'package:date_format/date_format.dart';

class Git {
  String message;

  String name;
  String description;
  String language;
  String createdAt;

  Git({this.name, this.description, this.language, this.createdAt});

  static List<Git> fromJson(List<dynamic> arr) {
    List<Git> list = List();

    arr.forEach((json) {
      String created = "";
      if (json['created_at'] != null) {
        DateTime date = DateTime.parse(json['created_at']);
        created = formatDate(date, ['dd/mm/yyyy', ' ', 'hh:nn:ss', ' ', 'am']);
      }

      list.add(Git(
          name: json['name'] != null ? json['name'] : "",
          description: json['description'] != null
              ? json['description']
              : "[no descriptions]",
          language: json['language'] != null ? json['language'] : "",
          createdAt: created));
    });

    return list;
  }
}
