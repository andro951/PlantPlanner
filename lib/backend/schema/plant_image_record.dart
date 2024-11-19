import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlantImageRecord extends FirestoreRecord {
  PlantImageRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "post_photo" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  void _initializeFields() {
    _postPhoto = snapshotData['post_photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plant_image');

  static Stream<PlantImageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlantImageRecord.fromSnapshot(s));

  static Future<PlantImageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlantImageRecord.fromSnapshot(s));

  static PlantImageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlantImageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlantImageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlantImageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlantImageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlantImageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlantImageRecordData({
  String? postPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_photo': postPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlantImageRecordDocumentEquality implements Equality<PlantImageRecord> {
  const PlantImageRecordDocumentEquality();

  @override
  bool equals(PlantImageRecord? e1, PlantImageRecord? e2) {
    return e1?.postPhoto == e2?.postPhoto;
  }

  @override
  int hash(PlantImageRecord? e) => const ListEquality().hash([e?.postPhoto]);

  @override
  bool isValidKey(Object? o) => o is PlantImageRecord;
}
