class RadiosResponse {
  final List<RadioModel> radios;

  RadiosResponse({required this.radios});

  factory RadiosResponse.fromJson(Map<String, dynamic> json) {
    return RadiosResponse(
      radios: (json['radios'] as List)
          .map((e) => RadioModel.fromJson(e))
          .toList(),
    );
  }
}

class RadioModel {
  final int id;
  final String name;
  final String url;
  final String recentDate;

  RadioModel({
    required this.id,
    required this.name,
    required this.url,
    required this.recentDate,
  });

  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      recentDate: json['recent_date'],
    );
  }
}
