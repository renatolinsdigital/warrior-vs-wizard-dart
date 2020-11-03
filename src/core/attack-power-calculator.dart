import '../game-elements/character.class.dart';
import '../game-elements/weapon.class.dart';
import '../helpers/calculations.functions.dart';

int attackPowerCalculator(
    {Weapon weapon,
    Character character,
    Character enemyChar,
    String attackType}) {
  if (weapon == null) return 1;

  final weaponProp = attackType == 'physical'
      ? weapon.attackPower
      : attackType == 'magical'
          ? weapon.magicPower
          : 0;

  final characterProp = attackType == 'physical'
      ? character.strength
      : attackType == 'magical'
          ? character.wisdom
          : 0;

  final powerFactor = weaponProp / 4;

  var attackPower = ((characterProp / 10) *
              (powerFactor / (enemyChar.level + 10)) *
              (character.level / 10) +
          powerFactor)
      .truncate();
  attackPower = applyVariationPercentage(attackPower, 5);
  attackPower = attackPower <= 0 ? 1 : attackPower;

  return attackPower;
}
