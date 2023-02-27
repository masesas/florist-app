import 'package:json_annotation/json_annotation.dart';

import '../../domain/domain.dart';

part 'change_address_model.g.dart';

@JsonSerializable()
class ChangeAddressModel extends AddressEntity {
  const ChangeAddressModel({
    required String address,
    required String latitude,
    required String longitude,
    String? zipCode,
  }) : super(
          address: address,
          latitude: latitude,
          longitude: longitude,
          zipCode: zipCode,
        );

  factory ChangeAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeAddressModelToJson(this);

  factory ChangeAddressModel.fromEntity(AddressEntity entity) {
    return ChangeAddressModel(
      address: entity.address ?? '',
      latitude: entity.latitude ?? "",
      longitude: entity.longitude ?? "",
      zipCode: entity.zipCode,
    );
  }
}
