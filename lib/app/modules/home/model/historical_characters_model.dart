class WarModel {
  final String name;
  final String photo;

  WarModel({required this.name, required this.photo});

  factory WarModel.fromMap(Map<String, dynamic> data) {
    return WarModel(name: data['name'] ?? '', photo: data['photo'] ?? '');
  }
}

class CharactersModel {
  final String description;
  final String name;
  final String photo;
  final String insidePhoto;
  final List<WarModel> wars;

  CharactersModel({
    required this.description,
    required this.name,
    required this.photo,
    required this.insidePhoto,
    required this.wars,
  });

  factory CharactersModel.fromMap(Map<String, dynamic> data) {
    List<WarModel> warsList = [];

    if (data['wars'] != null) {
      (data['wars'] as Map<String, dynamic>).forEach((key, value) {
        warsList.add(WarModel.fromMap(value));
      });
    }

    return CharactersModel(
      description: data['description'] ?? '',
      name: data['name'] ?? '',
      photo: data['photo'] ?? '',
      insidePhoto: data['inside_photo'] ?? '',
      wars: warsList,
    );
  }
}

class HistoricalCharactersModel {
  final List<CharactersModel> characters;

  HistoricalCharactersModel({required this.characters});

  factory HistoricalCharactersModel.fromMap(Map<String, dynamic> data) {
    List<CharactersModel> charactersList = [];

    data.forEach((key, value) {
      charactersList.add(CharactersModel.fromMap(value));
    });

    return HistoricalCharactersModel(characters: charactersList);
  }
}
