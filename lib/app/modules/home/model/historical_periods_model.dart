class ExampleModel {
  final String name;
  final String photo;

  ExampleModel({required this.name, required this.photo});

  factory ExampleModel.fromMap(Map<String, dynamic> data) {
    return ExampleModel(name: data['name'] ?? '', photo: data['photo'] ?? '');
  }
}

class PeriodModel {
  final String description;
  final String name;
  final String photo;
  final List<ExampleModel> examples;

  PeriodModel({
    required this.description,
    required this.name,
    required this.photo,
    required this.examples,
  });

  factory PeriodModel.fromMap(Map<String, dynamic> data) {
    List<ExampleModel> examplesList = [];

    if (data['examples'] != null) {
      (data['examples'] as Map<String, dynamic>).forEach((key, value) {
        examplesList.add(ExampleModel.fromMap(value));
      });
    }

    return PeriodModel(
      description: data['description'] ?? '',
      name: data['name'] ?? '',
      photo: data['photo'] ?? '',
      examples: examplesList,
    );
  }
}

class HistoricalPeriodsModel {
  final List<PeriodModel> periods;

  HistoricalPeriodsModel({required this.periods});

  factory HistoricalPeriodsModel.fromMap(Map<String, dynamic> data) {
    List<PeriodModel> periodsList = [];

    data.forEach((key, value) {
      periodsList.add(PeriodModel.fromMap(value));
    });

    return HistoricalPeriodsModel(periods: periodsList);
  }
}
