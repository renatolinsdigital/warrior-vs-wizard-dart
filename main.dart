import 'core/game.class.dart';
import 'character-classes/warrior.class.dart';
import 'character-classes/wizard.class.dart';
import 'game-weapons/sword.class.dart';
import 'game-weapons/wand.class.dart';
import 'helpers/sugars.functions.dart';
import 'enums/game.enums.dart';

void main() async {
  // Game instance start
  var game = Game();
  await game.run();

  // generating game world stuff
  game.addWeapon(new Sword('Brave Sword', attackPower: 120));
  game.addWeapon(new Sword('Hero Sword', attackPower: 170)); // add skill
  game.addWeapon(new Wand('Simple Wand', magicPower: 145));
  game.addWeapon(new Wand('Fire Wand', magicPower: 160)); // add skill

  await Game.writeToBattleLog(game.weaponsToString());

  // adding characters to game
  game.addCharacter(new Warrior('Theruk'));
  game.addCharacter(new Wizard('Mancid'));

  // querying game elements for later interaction
  var firstSwordFound = game.getWeaponsByType(WeaponType.SWORD)[0];
  // var secondSwordFound = game.getWeaponsByType(WeaponType.SWORD)[1];
  var firstWandFound = game.getWeaponsByType(WeaponType.WAND)[0];
  // var secondWandFound = game.getWeaponsByType(WeaponType.WAND)[1];
  var warrior = game.getCharactersByClass(CharacterClass.WARRIOR)[0];
  var wizard = game.getCharactersByClass(CharacterClass.WIZARD)[0];

  // Game elements configuration for this game instance:
  // setting levels and equipments for characters
  warrior.setLevel(1);
  wizard.setLevel(1);
  warrior.equipWeapon(firstSwordFound);
  wizard.equipWeapon(firstWandFound);

  await Game.writeToBattleLog(game.charactersToString());

  // Action start
  await Game.writeToBattleLog('''

  ======= GAME ACTION =======
''');

  await attack(warrior, wizard);

  //game.logCharacters();
}
