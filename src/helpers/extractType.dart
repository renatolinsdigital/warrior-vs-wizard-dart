String extractType(originalEnum) {
  final enumAsString = originalEnum.toString();
  final enumLength = enumAsString.length;
  final dotIndex = enumAsString.indexOf('.');
  final type = enumAsString.substring(dotIndex + 1, enumLength);
  return type.toLowerCase();
}
