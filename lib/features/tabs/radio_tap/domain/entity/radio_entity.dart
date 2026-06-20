import 'package:islami/features/tabs/radio_tap/data/model/radio_response.dart';

class RadioEntity {
  final int id;
  final String name;
  final String url;
  final String recentDate;

  const RadioEntity({
    required this.id,
    required this.name,
    required this.url,
    required this.recentDate,
  });
}

extension RadioMapper on RadioModel {
  RadioEntity toEntity() {
    return RadioEntity(id: id, name: name, url: url, recentDate: recentDate);
  }
}
