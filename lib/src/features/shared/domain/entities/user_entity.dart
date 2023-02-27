part of '../user_domain.dart';

class UserEntity extends Equatable {
  final int? id;
  final int? status;
  final String? code;
  final String? name;
  final String? businessName;
  final String? currency;
  final String? email;
  final String? phone;
  final String? address;
  final String? countryCode;
  final String? city;
  final String? states;
  final String? zipCode;
  final String? note;
  final String? paymentMethod;
  final String? paymentType;
  final String? paymentRef;
  final String? website;
  final String? terms;
  final String? deliveryCharge;
  final int? type;
  final String? deliveryDays;
  final String? latitude;
  final String? longitude;
  final String? language;
  final String? username;
  final List<String>? notification;

  const UserEntity({
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
  });

  static AddressEntity toAddressEntity(UserEntity userEntity) {
    return AddressEntity(
      address: userEntity.address,
      latitude: userEntity.latitude,
      longitude: userEntity.longitude,
      zipCode: userEntity.zipCode,
    );
  }

  @override
  List<Object?> get props => [
        id,
        status,
        code,
        name,
        businessName,
        currency,
        email,
        phone,
        address,
        countryCode,
        city,
        states,
        zipCode,
        note,
        paymentMethod,
        paymentType,
        paymentRef,
        website,
        terms,
        deliveryCharge,
        type,
        deliveryDays,
        latitude,
        longitude,
        language,
        username,
        notification,
      ];
}
