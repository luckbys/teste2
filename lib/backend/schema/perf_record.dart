import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'perf_record.g.dart';

abstract class PerfRecord implements Built<PerfRecord, PerfRecordBuilder> {
  static Serializer<PerfRecord> get serializer => _$perfRecordSerializer;

  @nullable
  String get nome;

  @nullable
  String get bio;

  @nullable
  bool get onoff;

  @nullable
  String get imgperf;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PerfRecordBuilder builder) => builder
    ..nome = ''
    ..bio = ''
    ..onoff = false
    ..imgperf = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('perf');

  static Stream<PerfRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PerfRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PerfRecord._();
  factory PerfRecord([void Function(PerfRecordBuilder) updates]) = _$PerfRecord;

  static PerfRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPerfRecordData({
  String nome,
  String bio,
  bool onoff,
  String imgperf,
}) =>
    serializers.toFirestore(
        PerfRecord.serializer,
        PerfRecord((p) => p
          ..nome = nome
          ..bio = bio
          ..onoff = onoff
          ..imgperf = imgperf));
