/*Applies some variation on base values, according to informed variation percentage. 
Usage recommendation: Anywhere you've finished other calculations but you don't 
want the final value to be an exact fixed value everytime, ex: attack values.*/
import 'dart:math';

int applyVariationPercentage(int baseValue, int variationPercentage) {
  int variationAbsoluteValue =
      ((baseValue / 100) * variationPercentage).truncate();
  final valueWithVariation = Random().nextInt(100) < 50
      ? baseValue - variationAbsoluteValue
      : baseValue + variationAbsoluteValue;
  return valueWithVariation;
}
