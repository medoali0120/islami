import 'package:islami/features/tabs/radio_tap/data/model/reciters_response.dart';

class ReciterEntity {
  final int id;
  final String name;
  final List<MoshafEntity> moshaf;

  ReciterEntity({required this.id, required this.name, required this.moshaf});
}

class MoshafEntity {
  final int id;
  final String name;
  final String server;

  MoshafEntity({required this.id, required this.name, required this.server});
}

extension ReciterMapper on ReciterModel {
  ReciterEntity toEntity() {
    return ReciterEntity(
      id: id,
      name: name,
      moshaf: moshaf.map((e) => e.toEntity()).toList(),
    );
  }
}

extension MoshafMapper on MoshafModel {
  MoshafEntity toEntity() {
    return MoshafEntity(id: id, name: name, server: server);
  }
}
