// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      status: json['status'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      businessName: json['business_name'] as String?,
      currency: json['currency'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      countryCode: json['country_code'] as String?,
      city: json['city'] as String?,
      states: json['states'] as String?,
      zipCode: json['zip_code'] as String?,
      note: json['note'] as String?,
      paymentMethod: json['payment_method'] as String?,
      paymentType: json['paymentType'] as String?,
      paymentRef: json['paymentRef'] as String?,
      website: json['website'] as String?,
      terms: json['terms'] as String?,
      deliveryCharge: json['delivery_charge'] as String?,
      type: json['type'] as int?,
      deliveryDays: json['delivery_days'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      language: json['language'] as String?,
      username: json['username'] as String?,
      notification: (json['notification'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      logisticList: (json['logistic'] as List<dynamic>?)
          ?.map((e) => LogisticModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'code': instance.code,
      'name': instance.name,
      'business_name': instance.businessName,
      'currency': instance.currency,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'country_code': instance.countryCode,
      'city': instance.city,
      'states': instance.states,
      'zip_code': instance.zipCode,
      'note': instance.note,
      'payment_method': instance.paymentMethod,
      'paymentType': instance.paymentType,
      'paymentRef': instance.paymentRef,
      'website': instance.website,
      'terms': instance.terms,
      'delivery_charge': instance.deliveryCharge,
      'type': instance.type,
      'delivery_days': instance.deliveryDays,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'language': instance.language,
      'username': instance.username,
      'notification': instance.notification,
      'logistic': instance.logisticList?.map((e) => e.toJson()).toList(),
    };

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      error: json['error'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      user: json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.user,
    };
