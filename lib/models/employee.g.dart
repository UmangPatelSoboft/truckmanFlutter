// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return Employee(
    id: json['id'] as int?,
    firstName: json['firstName'] as String?,
    email: json['email'] as String,
    password: json['password'] as String,
    mobileNumber: json['mobileNumber'] as String?,
    customerSupportNumber: json['customerSupportNumber'] as String?,
    profileImage: json['profileImage'] as String?,
    profileImageStr: json['profileImageStr'] as String?,
    deviceToken: json['deviceToken'] as String,
    deviceType: json['deviceType'] as String,
    uDID: json['uDID'] as String,
    iMEI: json['iMEI'] as String,
    lastLogin: json['lastLogin'] as String?,
    lastLoginStr: json['lastLoginStr'] as String?,
    isActive: json['isActive'] as bool?,
    createdDate: json['createdDate'] as String?,
    createdBy: json['createdBy'] as int?,
    updatedDate: json['updatedDate'] as String?,
    updatedBy: json['updatedBy'] as int?,
    deletedDate: json['deletedDate'] as String?,
    deletedBy: json['deletedBy'] as int?,
    createdDateStr: json['createdDateStr'] as String?,
    updatedDateStr: json['updatedDateStr'] as String?,
    deletedDateStr: json['deletedDateStr'] as String?,
  );
}

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'email': instance.email,
      'password': instance.password,
      'mobileNumber': instance.mobileNumber,
      'customerSupportNumber': instance.customerSupportNumber,
      'profileImage': instance.profileImage,
      'profileImageStr': instance.profileImageStr,
      'deviceToken': instance.deviceToken,
      'deviceType': instance.deviceType,
      'uDID': instance.uDID,
      'iMEI': instance.iMEI,
      'lastLogin': instance.lastLogin,
      'lastLoginStr': instance.lastLoginStr,
      'isActive': instance.isActive,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
      'updatedDate': instance.updatedDate,
      'updatedBy': instance.updatedBy,
      'deletedDate': instance.deletedDate,
      'deletedBy': instance.deletedBy,
      'createdDateStr': instance.createdDateStr,
      'updatedDateStr': instance.updatedDateStr,
      'deletedDateStr': instance.deletedDateStr,
    };
