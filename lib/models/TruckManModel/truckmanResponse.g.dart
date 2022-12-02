// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'truckmanResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TruckManResponse _$TruckManResponseFromJson(Map<String, dynamic> json) {
  return TruckManResponse(
    json['code'] as int?,
    json['message'] as String?,
    json['truckMan'] == null
        ? null
        : TruckMan.fromJson(json['truckMan'] as Map<String, dynamic>),
    json['isValid'] as bool?,
    json['isSuccessStatusCode'] as bool?,
  );
}

Map<String, dynamic> _$TruckManResponseToJson(TruckManResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'truckMan': instance.truckMan,
      'isValid': instance.isValid,
      'isSuccessStatusCode': instance.isSuccessStatusCode,
    };
