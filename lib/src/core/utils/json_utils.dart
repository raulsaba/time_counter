import '../errors/exceptions.dart';

class JsonUtils {
  static validateNotNullObject(
      Map<String, dynamic> json, String key, Type type) {
    if (json[key] == null) {
      throw JsonException(message: "Json key $key is null");
    }
    if (json[key].runtimeType != type) {
      throw JsonException(message: "Json key $key is not a $type");
    }
  }

  static validateNullableObject(
      Map<String, dynamic> json, String key, Type type) {
    if (json[key] != null && json[key].runtimeType != type) {
      throw JsonException(message: "Json key $key is not a $type");
    }
  }
}
