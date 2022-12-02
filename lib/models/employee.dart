import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee{
  int? id;
  String? firstName;
  String email;
  String password;
  String? mobileNumber;
  String? customerSupportNumber;
  String? profileImage;
  String? profileImageStr;
  String deviceToken;
  String deviceType;
  String uDID;
  String iMEI;
  String? lastLogin;
  String? lastLoginStr;
  bool? isActive;
  String? createdDate;
  int? createdBy;
  String? updatedDate;
  int? updatedBy;
  String? deletedDate;
  int? deletedBy;
  String? createdDateStr;
  String? updatedDateStr;
  String? deletedDateStr;

  Employee({
      this.id,
      this.firstName,
      required this.email,
      required this.password,
      this.mobileNumber,
      this.customerSupportNumber,
      this.profileImage,
      this.profileImageStr,
      required this.deviceToken,
      required this.deviceType,
      required this.uDID,
      required this.iMEI,
      this.lastLogin,
      this.lastLoginStr,
      this.isActive,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy,
      this.deletedDate,
      this.deletedBy,
      this.createdDateStr,
      this.updatedDateStr,
      this.deletedDateStr});

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}