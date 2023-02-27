// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeAddressModel _$ChangeAddressModelFromJson(Map<String, dynamic> json) =>
    ChangeAddressModel(
      address: json['address'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      zipCode: json['zipCode'] as String?,
    );

Map<String, dynamic> _$ChangeAddressModelToJson(ChangeAddressModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'zipCode': instance.zipCode,
    };
