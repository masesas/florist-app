import 'package:json_annotation/json_annotation.dart';

import '../../domain/user_domain.dart' show UserEntity;
import 'logistic_vehicle_model.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends UserEntity {
  @override
  final int? id;
  @override
  final int? status;
  @override
  final String? code;
  @override
  final String? name;
  @override
  @JsonKey(name: 'business_name')
  final String? businessName;
  @override
  final String? currency;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @override
  final String? city;
  @override
  final String? states;
  @override
  @JsonKey(name: 'zip_code')
  final String? zipCode;
  @override
  final String? note;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @override
  final String? paymentType;
  @override
  final String? paymentRef;
  @override
  final String? website;
  @override
  final String? terms;
  @override
  @JsonKey(name: 'delivery_charge')
  final String? deliveryCharge;
  @override
  final int? type;
  @override
  @JsonKey(name: 'delivery_days')
  final String? deliveryDays;
  @override
  final String? latitude;
  @override
  final String? longitude;
  @override
  final String? language;
  @override
  final String? username;
  @override
  final List<String>? notification;
  @JsonKey(name: 'logistic')
  final List<LogisticModel>? logisticList;

  const UserModel({
    this.id,
    this.status,
    this.code,
    this.name,
    this.businessName,
    this.currency,
    this.email,
    this.phone,
    this.address,
    this.countryCode,
    this.city,
    this.states,
    this.zipCode,
    this.note,
    this.paymentMethod,
    this.paymentType,
    this.paymentRef,
    this.website,
    this.terms,
    this.deliveryCharge,
    this.type,
    this.deliveryDays,
    this.latitude,
    this.longitude,
    this.language,
    this.username,
    this.notification,
    this.logisticList,
  }) : super(
          id: id,
          status: status,
          code: code,
          name: name,
          businessName: businessName,
          currency: currency,
          email: email,
          phone: phone,
          address: address,
          countryCode: countryCode,
          city: city,
          states: states,
          zipCode: zipCode,
          note: note,
          paymentMethod: paymentMethod,
          paymentType: paymentType,
          paymentRef: paymentRef,
          website: website,
          terms: terms,
          deliveryCharge: deliveryCharge,
          type: type,
          deliveryDays: deliveryCharge,
          latitude: latitude,
          longitude: longitude,
          language: language,
          username: username,
          notification: notification,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  Map<String, dynamic> toJsonLogistic() {
    final Map<String, dynamic> data = {};
    if (logisticList != null) {
      data['logistic'] = logisticList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@JsonSerializable()
class UserResponseModel {
  final int error;
  final String message;
  @JsonKey(name: 'data')
  final UserModel? user;

  UserResponseModel({
    this.error = 0,
    this.message = '',
    this.user,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  UserResponseModel copyWith({
    int? error,
    String? message,
    UserModel? user,
  }) {
    return UserResponseModel(
      error: error ?? this.error,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
