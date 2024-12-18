// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NotificationStruct extends FFFirebaseStruct {
  NotificationStruct({
    String? name,
    String? description,
    int? permapeopleId,
    DocumentReference? myPlant,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        _permapeopleId = permapeopleId,
        _myPlant = myPlant,
        super(firestoreUtilData);

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "PermapeopleId" field.
  int? _permapeopleId;
  int get permapeopleId => _permapeopleId ?? 0;
  set permapeopleId(int? val) => _permapeopleId = val;

  void incrementPermapeopleId(int amount) =>
      permapeopleId = permapeopleId + amount;

  bool hasPermapeopleId() => _permapeopleId != null;

  // "myPlant" field.
  DocumentReference? _myPlant;
  DocumentReference? get myPlant => _myPlant;
  set myPlant(DocumentReference? val) => _myPlant = val;

  bool hasMyPlant() => _myPlant != null;

  static NotificationStruct fromMap(Map<String, dynamic> data) =>
      NotificationStruct(
        name: data['Name'] as String?,
        description: data['Description'] as String?,
        permapeopleId: castToType<int>(data['PermapeopleId']),
        myPlant: data['myPlant'] as DocumentReference?,
      );

  static NotificationStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Description': _description,
        'PermapeopleId': _permapeopleId,
        'myPlant': _myPlant,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'PermapeopleId': serializeParam(
          _permapeopleId,
          ParamType.int,
        ),
        'myPlant': serializeParam(
          _myPlant,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static NotificationStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotificationStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        permapeopleId: deserializeParam(
          data['PermapeopleId'],
          ParamType.int,
          false,
        ),
        myPlant: deserializeParam(
          data['myPlant'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users', 'MyPlants'],
        ),
      );

  @override
  String toString() => 'NotificationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationStruct &&
        name == other.name &&
        description == other.description &&
        permapeopleId == other.permapeopleId &&
        myPlant == other.myPlant;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, description, permapeopleId, myPlant]);
}

NotificationStruct createNotificationStruct({
  String? name,
  String? description,
  int? permapeopleId,
  DocumentReference? myPlant,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationStruct(
      name: name,
      description: description,
      permapeopleId: permapeopleId,
      myPlant: myPlant,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationStruct? updateNotificationStruct(
  NotificationStruct? notification, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notification
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationStructData(
  Map<String, dynamic> firestoreData,
  NotificationStruct? notification,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notification == null) {
    return;
  }
  if (notification.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notification.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationData =
      getNotificationFirestoreData(notification, forFieldValue);
  final nestedData =
      notificationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notification.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationFirestoreData(
  NotificationStruct? notification, [
  bool forFieldValue = false,
]) {
  if (notification == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notification.toMap());

  // Add any Firestore field values
  notification.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationListFirestoreData(
  List<NotificationStruct>? notifications,
) =>
    notifications?.map((e) => getNotificationFirestoreData(e, true)).toList() ??
    [];
