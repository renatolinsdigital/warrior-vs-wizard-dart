/* Syntax simplifier for regular attacks. Usage recommendations: In any situation that the first character attacks the second one*/
import '../enums/game.enums.dart';
import '../game-elements/character.class.dart';
import '../output/Log.class.dart';

Future<bool> attack(Character firstCharacter, Character secondCharacter,
    {String type}) async {
  var isAttackFinished = false;
  final attackType = type == 'physical'
      ? AttackType.PHYSICAL
      : type == 'magical'
          ? AttackType.MAGICAL
          : type == 'weapon_special'
              ? AttackType.WEAPON_SPECIAL
              : AttackType.NONE;
  await firstCharacter
      .attackWithWeapon(secondCharacter, attackType: attackType)
      .then((actionMessages) async {
    for (int i = 0; i < actionMessages.length; i++)
      await Log.writeToBattleLog(actionMessages[i]);
    isAttackFinished = true;
  });

  return isAttackFinished;
}
