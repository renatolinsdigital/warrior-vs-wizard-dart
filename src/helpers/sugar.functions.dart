import '../game-elements/character.class.dart';
import '../core/game.class.dart';

Future<bool> attack(Character firstCharacter, Character secondCharacter,
    {String attackType}) async {
  var isAttackFinished = false;
  await firstCharacter
      .attackWithWeapon(secondCharacter, attackType: attackType)
      .then((actionMessages) async {
    for (int i = 0; i < actionMessages.length; i++)
      await Game.writeToBattleLog(actionMessages[i]);
    isAttackFinished = true;
  });

  return isAttackFinished;
}
