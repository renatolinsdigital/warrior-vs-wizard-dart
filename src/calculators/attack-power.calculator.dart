import '../enums/game.enums.dart';
import '../game-elements/character.class.dart';
import '../game-elements/weapon.class.dart';
import 'apply-variation-percentage.calculator.dart';
import '../../lib_packages/meta-1.2.3/lib/meta.dart';
import '../models/power-calculation-values.model.dart';

int attackPowerCalculator(
    {@required Weapon weapon,
    @required Character character,
    @required Character enemyChar,
    @required AttackType attackType}) {
  if (attackType == AttackType.NONE) return 0;

  var calculationValues =
      PowerCalculationValues(weaponFactor: 1, characterFactor: 1);

  switch (attackType) {
    case AttackType.PHYSICAL:
      {
        calculationValues.weaponFactor = weapon.attackPower;
        calculationValues.characterFactor = character.strength;
        break;
      }
    case AttackType.MAGICAL:
      {
        calculationValues.weaponFactor = weapon.magicPower;
        calculationValues.characterFactor = character.wisdom;
        break;
      }
    default:
      {
        break;
      }
  }

  final powerFactor = calculationValues.weaponFactor / 4;

  var attackPower = ((calculationValues.characterFactor / 10) *
              (powerFactor / (enemyChar.level + 10)) *
              (character.level / 10) +
          powerFactor)
      .truncate();
  attackPower = applyVariationPercentage(attackPower, 5);
  attackPower = attackPower <= 0 ? 1 : attackPower;

  return attackPower;
}
