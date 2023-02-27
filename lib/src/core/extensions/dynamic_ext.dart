extension DynamicExt on dynamic {
  T? as<T>() => this is T ? this as T : null;

  Map<String, dynamic> toJsonMap() {
    return this is Map<String, dynamic>
        ? (this ?? {}) as Map<String, dynamic>
        : {};
  }
}
