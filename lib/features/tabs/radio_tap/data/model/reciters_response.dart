class RecitersResponse {
  final List<ReciterModel> reciters;

  RecitersResponse({required this.reciters});

  factory RecitersResponse.fromJson(Map<String, dynamic> json) {
    return RecitersResponse(
      reciters: (json['reciters'] as List)
          .map((e) => ReciterModel.fromJson(e))
          .toList(),
    );
  }
}

class ReciterModel {
  final int id;
  final String name;
  final List<MoshafModel> moshaf;

  ReciterModel({required this.id, required this.name, required this.moshaf});

  factory ReciterModel.fromJson(Map<String, dynamic> json) {
    return ReciterModel(
      id: json['id'],
      name: json['name'],
      moshaf: (json['moshaf'] as List)
          .map((e) => MoshafModel.fromJson(e))
          .toList(),
    );
  }
}

class MoshafModel {
  final int id;
  final String name;
  final String server;

  MoshafModel({required this.id, required this.name, required this.server});

  factory MoshafModel.fromJson(Map<String, dynamic> json) {
    return MoshafModel(
      id: json['id'],
      name: json['name'],
      server: json['server'],
    );
  }
}
