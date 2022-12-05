// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'truckManVerifyOtpResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

truckManVerifyOtpResponse _$truckManVerifyOtpResponseFromJson(
    Map<String, dynamic> json) {
  return truckManVerifyOtpResponse(
    code: json['code'] as int?,
    message: json['message'] as String?,
    truckmanVerifyOtp: json['truckmanVerifyOtp'] == null
        ? null
        : truckManVerifyOtp
            .fromJson(json['truckmanVerifyOtp'] as Map<String, dynamic>),
    isValid: json['isValid'] as bool?,
    isSuccessStatusCode: json['isSuccessStatusCode'] as bool?,
  );
}

Map<String, dynamic> _$truckManVerifyOtpResponseToJson(
        truckManVerifyOtpResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'truckmanVerifyOtp': instance.truckmanVerifyOtp,
      'isValid': instance.isValid,
      'isSuccessStatusCode': instance.isSuccessStatusCode,
    };
