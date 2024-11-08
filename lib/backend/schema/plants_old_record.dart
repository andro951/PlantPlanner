import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlantsOldRecord extends FirestoreRecord {
  PlantsOldRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "Family" field.
  String? _family;
  String get family => _family ?? '';
  bool hasFamily() => _family != null;

  // "WateringFrequency" field.
  double? _wateringFrequency;
  double get wateringFrequency => _wateringFrequency ?? 0.0;
  bool hasWateringFrequency() => _wateringFrequency != null;

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

  // "ImageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _type = snapshotData['Type'] as String?;
    _family = snapshotData['Family'] as String?;
    _wateringFrequency = castToType<double>(snapshotData['WateringFrequency']);
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
    _imageUrl = snapshotData['ImageUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plantsOld');

  static Stream<PlantsOldRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlantsOldRecord.fromSnapshot(s));

  static Future<PlantsOldRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlantsOldRecord.fromSnapshot(s));

  static PlantsOldRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlantsOldRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlantsOldRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlantsOldRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlantsOldRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlantsOldRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlantsOldRecordData({
  String? name,
  String? type,
  String? family,
  double? wateringFrequency,
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
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Type': type,
      'Family': family,
      'WateringFrequency': wateringFrequency,
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
      'ImageUrl': imageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlantsOldRecordDocumentEquality implements Equality<PlantsOldRecord> {
  const PlantsOldRecordDocumentEquality();

  @override
  bool equals(PlantsOldRecord? e1, PlantsOldRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        e1?.family == e2?.family &&
        e1?.wateringFrequency == e2?.wateringFrequency &&
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
        e1?.soilType == e2?.soilType &&
        e1?.imageUrl == e2?.imageUrl;
  }

  @override
  int hash(PlantsOldRecord? e) => const ListEquality().hash([
        e?.name,
        e?.type,
        e?.family,
        e?.wateringFrequency,
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
        e?.soilType,
        e?.imageUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is PlantsOldRecord;
}
