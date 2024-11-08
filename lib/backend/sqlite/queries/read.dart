import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN SEARCHBYNAME
Future<List<SearchByNameRow>> performSearchByName(
  Database database, {
  String? searchString,
}) {
  final query = '''
SELECT * FROM Plants
WHERE LOWER(Name) LIKE '%' || LOWER('$searchString') || '%';
''';
  return _readQuery(database, query, (d) => SearchByNameRow(d));
}

class SearchByNameRow extends SqliteRow {
  SearchByNameRow(super.data);

  int get permapeopleId => data['PermapeopleId'] as int;
  String get name => data['Name'] as String;
  String get scientificName => data['ScientificName'] as String;
  String get type => data['Type'] as String;
  String get family => data['Family'] as String;
  double get wateringFrequencyInDays =>
      data['WateringFrequencyInDays'] as double;
  double get minTemperatureCelsius => data['MinTemperatureCelsius'] as double;
  double get maxTemperatureCelsius => data['MaxTemperatureCelsius'] as double;
  String get lightType => data['LightType'] as String;
  double get hoursOfLightPerDay => data['HoursOfLightPerDay'] as double;
  double get minHumidity => data['MinHumidity'] as double;
  double get maxHumidity => data['MaxHumidity'] as double;
  double get minPH => data['MinPH'] as double;
  double get maxPH => data['MaxPH'] as double;
  double get expectedHeightMeters => data['ExpectedHeightMeters'] as double;
  double get expectedWidthMeters => data['ExpectedWidthMeters'] as double;
  double get fertilizerFrequencyInDays =>
      data['FertilizerFrequencyInDays'] as double;
  String get fertilizerType => data['FertilizerType'] as String;
  String get soilType => data['SoilType'] as String;
}

/// END SEARCHBYNAME
