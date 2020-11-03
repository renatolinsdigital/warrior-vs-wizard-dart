import '../enums/game.enums.dart';
import '../game-elements/character.class.dart';
import '../core/game.class.dart';

Future<bool> attack(Character firstCharacter, Character secondCharacter,
    {String type}) async {
  var isAttackFinished = false;
  final attackType = type == 'physical'
      ? AttackType.PHYSICAL
      : type == 'magical'
          ? AttackType.MAGICAL
          : AttackType.NONE;
  await firstCharacter
      .attackWithWeapon(secondCharacter, attackType: attackType)
      .then((actionMessages) async {
    for (int i = 0; i < actionMessages.length; i++)
      await Game.writeToBattleLog(actionMessages[i]);
    isAttackFinished = true;
  });

  return isAttackFinished;
}
