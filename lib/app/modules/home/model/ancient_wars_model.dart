class AncientWarModel {
  final String id;
  final String photo;

  AncientWarModel({required this.id, required this.photo});

  factory AncientWarModel.fromMap(String id, dynamic value) {
    if (value is String) {
      return AncientWarModel(id: id, photo: value);
    }

    if (value is Map<String, dynamic>) {
      return AncientWarModel(id: id, photo: (value['photo'] ?? '').toString());
    }

    return AncientWarModel(id: id, photo: '');
  }
}

class AncientWarsModel {
  final List<AncientWarModel> wars;

  AncientWarsModel({required this.wars});

  factory AncientWarsModel.fromMap(Map<String, dynamic> map) {
    final entries = map.entries.toList()
      ..sort((a, b) {
        final na = int.tryParse(a.key.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
        final nb = int.tryParse(b.key.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
        return na.compareTo(nb);
      });

    final list = entries
        .map((e) => AncientWarModel.fromMap(e.key, e.value))
        .where((w) => w.photo.trim().isNotEmpty)
        .toList();

    return AncientWarsModel(wars: list);
  }
}
