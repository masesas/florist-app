import '../../domain/google_maps_domain.dart'
    show PlaceSearchEntity, PlaceEntity;

/// retrive autcomplete from textfield
class PlaceSearchModel extends PlaceSearchEntity {
  @override
  final String? description;
  @override
  final String? placeId;

  const PlaceSearchModel({this.description, this.placeId})
      : super(
          placeId: placeId,
          description: description,
        );

  factory PlaceSearchModel.fromJson(Map<String, dynamic> json) {
    return PlaceSearchModel(
      description: json['description'] as String?,
      placeId: json['place_id'] as String?,
    );
  }
}

/// will be parse with [placeId] from [PlaceSearchModel]
class PlaceModel extends PlaceEntity {
  @override
  final String? placeId;
  final Geometry? geometry;
  final String? name;
  final String? vicinity;
  final List<AddressComponent>? addressComponents;

  PlaceModel({
    this.placeId,
    this.geometry,
    this.name,
    this.vicinity,
    this.addressComponents,
  }) : super(
          address: name,
          latitude: geometry?.location?.lat,
          longitude: geometry?.location?.lng,
          placeId: placeId,
        );

  factory PlaceModel.fromJson(String placeId, Map<String, dynamic> json) {
    return PlaceModel(
      placeId: placeId,
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      name: json['formatted_address'] as String?,
      vicinity: json['vicinity'] as String?,
      addressComponents: (json['address_components'] as List<dynamic>?)
          ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class AddressComponent {
  final List<Type>? types;
  final String? longName;
  final String? shortName;

  AddressComponent({this.longName, this.shortName, this.types});

  factory AddressComponent.fromJson(Map<String, dynamic> parsedJson) {
    return AddressComponent(
      types: (parsedJson['types'] as List<dynamic>?)
          ?.map((e) => Type.fromJson(e))
          .toList(),
      longName: parsedJson['long_name'] as String?,
      shortName: parsedJson['short_name'] as String?,
    );
  }
}

class Type {
  final String? postalCode;

  Type({this.postalCode});

  factory Type.fromJson(dynamic data) {
    return Type(postalCode: data?.toString() as String);
  }
}

class Geometry {
  final LocationModel? location;

  Geometry({this.location});

  Geometry.fromJson(Map<String, dynamic> parsedJson)
      : location = LocationModel.fromJson(
            parsedJson['location'] as Map<String, dynamic>);
}

class LocationModel {
  final double? lat;
  final double? lng;

  LocationModel({this.lat, this.lng});

  factory LocationModel.fromJson(Map<String, dynamic> parsedJson) {
    return LocationModel(
      lat: parsedJson['lat'] as double?,
      lng: parsedJson['lng'] as double?,
    );
  }
}
