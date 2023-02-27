extension MapExt on Map<dynamic, dynamic> {
  bool isMapDataResponse() {
    return containsKey('data') &&
        this['data'] != null &&
        this['data'] is Map<String, dynamic>;
  }

  bool isListDataResponse() {
    return containsKey('data') &&
        this['data'] != null &&
        this['data'] is List<dynamic>;
  }

  Map<String, dynamic> toMapDataResponse() {
    return this['data'] as Map<String, dynamic>;
  }

  List<dynamic> toListDataResponse() {
    return this['data'] as List<dynamic>;
  }
}
