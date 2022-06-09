import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'msg_record.g.dart';

abstract class MsgRecord implements Built<MsgRecord, MsgRecordBuilder> {
  static Serializer<MsgRecord> get serializer => _$msgRecordSerializer;

  @nullable
  String get mensagem;

  @nullable
  DateTime get hora;

  @nullable
  String get image;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MsgRecordBuilder builder) => builder
    ..mensagem = ''
    ..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('msg');

  static Stream<MsgRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MsgRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MsgRecord._();
  factory MsgRecord([void Function(MsgRecordBuilder) updates]) = _$MsgRecord;

  static MsgRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMsgRecordData({
  String mensagem,
  DateTime hora,
  String image,
}) =>
    serializers.toFirestore(
        MsgRecord.serializer,
        MsgRecord((m) => m
          ..mensagem = mensagem
          ..hora = hora
          ..image = image));
