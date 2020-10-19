import 'dart:math';

int applyVariationPercentage(int baseValue, int variationPercentage) {
  int variationAbsoluteValue =
      ((baseValue / 100) * variationPercentage).truncate();
  final valueWithVariation = Random().nextInt(100) < 50
      ? baseValue - variationAbsoluteValue
      : baseValue + variationAbsoluteValue;
  return valueWithVariation;
}
