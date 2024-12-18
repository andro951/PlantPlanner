import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlantDataRecord extends FirestoreRecord {
  PlantDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "ScientificName" field.
  String? _scientificName;
  String get scientificName => _scientificName ?? '';
  bool hasScientificName() => _scientificName != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "Family" field.
  String? _family;
  String get family => _family ?? '';
  bool hasFamily() => _family != null;

  // "WateringFrequencyInDays" field.
  double? _wateringFrequencyInDays;
  double get wateringFrequencyInDays => _wateringFrequencyInDays ?? 0.0;
  bool hasWateringFrequencyInDays() => _wateringFrequencyInDays != null;

  // "MinTemperatureCelsius" field.
  double? _minTemperatureCelsius;
  double get minTemperatureCelsius => _minTemperatureCelsius ?? 0.0;
  bool hasMinTemperatureCelsius() => _minTemperatureCelsius != null;

  // "MaxTemperatureCelsius" field.
  double? _maxTemperatureCelsius;
  double get maxTemperatureCelsius => _maxTemperatureCelsius ?? 0.0;
  bool hasMaxTemperatureCelsius() => _maxTemperatureCelsius != null;

  // "LightType" field.
  String? _lightType;
  String get lightType => _lightType ?? '';
  bool hasLightType() => _lightType != null;

  // "HoursOfLightPerDay" field.
  double? _hoursOfLightPerDay;
  double get hoursOfLightPerDay => _hoursOfLightPerDay ?? 0.0;
  bool hasHoursOfLightPerDay() => _hoursOfLightPerDay != null;

  // "MinHumidity" field.
  double? _minHumidity;
  double get minHumidity => _minHumidity ?? 0.0;
  bool hasMinHumidity() => _minHumidity != null;

  // "MaxHumidity" field.
  double? _maxHumidity;
  double get maxHumidity => _maxHumidity ?? 0.0;
  bool hasMaxHumidity() => _maxHumidity != null;

  // "MinPH" field.
  double? _minPH;
  double get minPH => _minPH ?? 0.0;
  bool hasMinPH() => _minPH != null;

  // "MaxPH" field.
  double? _maxPH;
  double get maxPH => _maxPH ?? 0.0;
  bool hasMaxPH() => _maxPH != null;

  // "ExpectedHeightMeters" field.
  double? _expectedHeightMeters;
  double get expectedHeightMeters => _expectedHeightMeters ?? 0.0;
  bool hasExpectedHeightMeters() => _expectedHeightMeters != null;

  // "ExpectedWidthMeters" field.
  double? _expectedWidthMeters;
  double get expectedWidthMeters => _expectedWidthMeters ?? 0.0;
  bool hasExpectedWidthMeters() => _expectedWidthMeters != null;

  // "FertilizerFrequencyInDays" field.
  double? _fertilizerFrequencyInDays;
  double get fertilizerFrequencyInDays => _fertilizerFrequencyInDays ?? 0.0;
  bool hasFertilizerFrequencyInDays() => _fertilizerFrequencyInDays != null;

  // "FertilizerType" field.
  String? _fertilizerType;
  String get fertilizerType => _fertilizerType ?? '';
  bool hasFertilizerType() => _fertilizerType != null;

  // "SoilType" field.
  String? _soilType;
  String get soilType => _soilType ?? '';
  bool hasSoilType() => _soilType != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _name = snapshotData['Name'] as String?;
    _scientificName = snapshotData['ScientificName'] as String?;
    _type = snapshotData['Type'] as String?;
    _family = snapshotData['Family'] as String?;
    _wateringFrequencyInDays =
        castToType<double>(snapshotData['WateringFrequencyInDays']);
    _minTemperatureCelsius =
        castToType<double>(snapshotData['MinTemperatureCelsius']);
    _maxTemperatureCelsius =
        castToType<double>(snapshotData['MaxTemperatureCelsius']);
    _lightType = snapshotData['LightType'] as String?;
    _hoursOfLightPerDay =
        castToType<double>(snapshotData['HoursOfLightPerDay']);
    _minHumidity = castToType<double>(snapshotData['MinHumidity']);
    _maxHumidity = castToType<double>(snapshotData['MaxHumidity']);
    _minPH = castToType<double>(snapshotData['MinPH']);
    _maxPH = castToType<double>(snapshotData['MaxPH']);
    _expectedHeightMeters =
        castToType<double>(snapshotData['ExpectedHeightMeters']);
    _expectedWidthMeters =
        castToType<double>(snapshotData['ExpectedWidthMeters']);
    _fertilizerFrequencyInDays =
        castToType<double>(snapshotData['FertilizerFrequencyInDays']);
    _fertilizerType = snapshotData['FertilizerType'] as String?;
    _soilType = snapshotData['SoilType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plantData');

  static Stream<PlantDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlantDataRecord.fromSnapshot(s));

  static Future<PlantDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlantDataRecord.fromSnapshot(s));

  static PlantDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlantDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlantDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlantDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlantDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlantDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlantDataRecordData({
  int? id,
  String? name,
  String? scientificName,
  String? type,
  String? family,
  double? wateringFrequencyInDays,
  double? minTemperatureCelsius,
  double? maxTemperatureCelsius,
  String? lightType,
  double? hoursOfLightPerDay,
  double? minHumidity,
  double? maxHumidity,
  double? minPH,
  double? maxPH,
  double? expectedHeightMeters,
  double? expectedWidthMeters,
  double? fertilizerFrequencyInDays,
  String? fertilizerType,
  String? soilType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'Name': name,
      'ScientificName': scientificName,
      'Type': type,
      'Family': family,
      'WateringFrequencyInDays': wateringFrequencyInDays,
      'MinTemperatureCelsius': minTemperatureCelsius,
      'MaxTemperatureCelsius': maxTemperatureCelsius,
      'LightType': lightType,
      'HoursOfLightPerDay': hoursOfLightPerDay,
      'MinHumidity': minHumidity,
      'MaxHumidity': maxHumidity,
      'MinPH': minPH,
      'MaxPH': maxPH,
      'ExpectedHeightMeters': expectedHeightMeters,
      'ExpectedWidthMeters': expectedWidthMeters,
      'FertilizerFrequencyInDays': fertilizerFrequencyInDays,
      'FertilizerType': fertilizerType,
      'SoilType': soilType,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlantDataRecordDocumentEquality implements Equality<PlantDataRecord> {
  const PlantDataRecordDocumentEquality();

  @override
  bool equals(PlantDataRecord? e1, PlantDataRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.scientificName == e2?.scientificName &&
        e1?.type == e2?.type &&
        e1?.family == e2?.family &&
        e1?.wateringFrequencyInDays == e2?.wateringFrequencyInDays &&
        e1?.minTemperatureCelsius == e2?.minTemperatureCelsius &&
        e1?.maxTemperatureCelsius == e2?.maxTemperatureCelsius &&
        e1?.lightType == e2?.lightType &&
        e1?.hoursOfLightPerDay == e2?.hoursOfLightPerDay &&
        e1?.minHumidity == e2?.minHumidity &&
        e1?.maxHumidity == e2?.maxHumidity &&
        e1?.minPH == e2?.minPH &&
        e1?.maxPH == e2?.maxPH &&
        e1?.expectedHeightMeters == e2?.expectedHeightMeters &&
        e1?.expectedWidthMeters == e2?.expectedWidthMeters &&
        e1?.fertilizerFrequencyInDays == e2?.fertilizerFrequencyInDays &&
        e1?.fertilizerType == e2?.fertilizerType &&
        e1?.soilType == e2?.soilType;
  }

  @override
  int hash(PlantDataRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.scientificName,
        e?.type,
        e?.family,
        e?.wateringFrequencyInDays,
        e?.minTemperatureCelsius,
        e?.maxTemperatureCelsius,
        e?.lightType,
        e?.hoursOfLightPerDay,
        e?.minHumidity,
        e?.maxHumidity,
        e?.minPH,
        e?.maxPH,
        e?.expectedHeightMeters,
        e?.expectedWidthMeters,
        e?.fertilizerFrequencyInDays,
        e?.fertilizerType,
        e?.soilType
      ]);

  @override
  bool isValidKey(Object? o) => o is PlantDataRecord;
}
