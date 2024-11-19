import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyPlantsRecord extends FirestoreRecord {
  MyPlantsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  bool hasNickname() => _nickname != null;

  // "WateringFrequency" field.
  double? _wateringFrequency;
  double get wateringFrequency => _wateringFrequency ?? 0.0;
  bool hasWateringFrequency() => _wateringFrequency != null;

  // "LastWatered" field.
  DateTime? _lastWatered;
  DateTime? get lastWatered => _lastWatered;
  bool hasLastWatered() => _lastWatered != null;

  // "Indoor" field.
  bool? _indoor;
  bool get indoor => _indoor ?? false;
  bool hasIndoor() => _indoor != null;

  // "FertilizerReminders" field.
  bool? _fertilizerReminders;
  bool get fertilizerReminders => _fertilizerReminders ?? false;
  bool hasFertilizerReminders() => _fertilizerReminders != null;

  // "FertilizerFrequencyInDays" field.
  double? _fertilizerFrequencyInDays;
  double get fertilizerFrequencyInDays => _fertilizerFrequencyInDays ?? 0.0;
  bool hasFertilizerFrequencyInDays() => _fertilizerFrequencyInDays != null;

  // "LastFertilized" field.
  DateTime? _lastFertilized;
  DateTime? get lastFertilized => _lastFertilized;
  bool hasLastFertilized() => _lastFertilized != null;

  // "PermapeopleId" field.
  int? _permapeopleId;
  int get permapeopleId => _permapeopleId ?? 0;
  bool hasPermapeopleId() => _permapeopleId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _nickname = snapshotData['Nickname'] as String?;
    _wateringFrequency = castToType<double>(snapshotData['WateringFrequency']);
    _lastWatered = snapshotData['LastWatered'] as DateTime?;
    _indoor = snapshotData['Indoor'] as bool?;
    _fertilizerReminders = snapshotData['FertilizerReminders'] as bool?;
    _fertilizerFrequencyInDays =
        castToType<double>(snapshotData['FertilizerFrequencyInDays']);
    _lastFertilized = snapshotData['LastFertilized'] as DateTime?;
    _permapeopleId = castToType<int>(snapshotData['PermapeopleId']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('MyPlants')
          : FirebaseFirestore.instance.collectionGroup('MyPlants');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('MyPlants').doc(id);

  static Stream<MyPlantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyPlantsRecord.fromSnapshot(s));

  static Future<MyPlantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyPlantsRecord.fromSnapshot(s));

  static MyPlantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyPlantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyPlantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyPlantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyPlantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyPlantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyPlantsRecordData({
  String? name,
  String? nickname,
  double? wateringFrequency,
  DateTime? lastWatered,
  bool? indoor,
  bool? fertilizerReminders,
  double? fertilizerFrequencyInDays,
  DateTime? lastFertilized,
  int? permapeopleId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Nickname': nickname,
      'WateringFrequency': wateringFrequency,
      'LastWatered': lastWatered,
      'Indoor': indoor,
      'FertilizerReminders': fertilizerReminders,
      'FertilizerFrequencyInDays': fertilizerFrequencyInDays,
      'LastFertilized': lastFertilized,
      'PermapeopleId': permapeopleId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyPlantsRecordDocumentEquality implements Equality<MyPlantsRecord> {
  const MyPlantsRecordDocumentEquality();

  @override
  bool equals(MyPlantsRecord? e1, MyPlantsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.nickname == e2?.nickname &&
        e1?.wateringFrequency == e2?.wateringFrequency &&
        e1?.lastWatered == e2?.lastWatered &&
        e1?.indoor == e2?.indoor &&
        e1?.fertilizerReminders == e2?.fertilizerReminders &&
        e1?.fertilizerFrequencyInDays == e2?.fertilizerFrequencyInDays &&
        e1?.lastFertilized == e2?.lastFertilized &&
        e1?.permapeopleId == e2?.permapeopleId;
  }

  @override
  int hash(MyPlantsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.nickname,
        e?.wateringFrequency,
        e?.lastWatered,
        e?.indoor,
        e?.fertilizerReminders,
        e?.fertilizerFrequencyInDays,
        e?.lastFertilized,
        e?.permapeopleId
      ]);

  @override
  bool isValidKey(Object? o) => o is MyPlantsRecord;
}
