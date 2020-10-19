import '../core/game.class.dart';
import '../helpers/calculations.functions.dart';
import '../enums/game.enums.dart';
import 'weapon.class.dart';
import 'dart:math';

class Character {
  String instanceId;
  String elementIdentifier = 'character';
  CharacterClass characterClass;
  String name;
  bool isUltimateReady = false;
  int ultimateGauge = 0;
  Weapon weapon;
  int level = 0;
  int health;
  int strength;
  int wisdom;
  int get baseHealth => ((pow(2, 8 + level / 50)).floor() - level);
  int get baseStrength => (10 + ((level / 20) * 40)).truncate();
  int get baseWisdom => (10 + ((level / 20) * 40)).truncate();

  void setLevel(int newLevel) {
    level = newLevel;
    health = baseHealth;
    strength = baseStrength;
    wisdom = baseWisdom;
  }

  int getLevel() => level;

  void equipWeapon(Weapon weapon) {
    this.weapon = weapon;
  }

  updateUltimateGauge(Character enemyChar) {
    ultimateGauge += 10;
    enemyChar.ultimateGauge += 4;

    if (ultimateGauge >= 50) {
      ultimateGauge = 50;
      isUltimateReady = true;
      Game.currentActionMessages.add('(${name}´s ULTIMATE is ready!) \n');
    }
    if (enemyChar.ultimateGauge >= 50) {
      enemyChar.ultimateGauge = 50;
      enemyChar.isUltimateReady = true;
      Game.currentActionMessages
          .add('(${enemyChar.name}´s ULTIMATE is ready!) \n');
    }
  }

  Future<List<String>> physicalAttack(Character enemyChar) async {
    Game.currentActionMessages = [];
    final weaponPowerFactor = weapon != null ? (weapon.attackPower / 4) : 10.0;
    var attackPower = ((strength / 10) *
                (weaponPowerFactor / (enemyChar.level + 10)) *
                (level / 10) +
            weaponPowerFactor)
        .truncate();

    attackPower = applyVariationPercentage(attackPower, 5);
    attackPower = attackPower <= 0 ? 1 : attackPower;

    final enemyHealthAfterAttack = enemyChar.health - attackPower;
    enemyChar.health = enemyHealthAfterAttack > 0 ? enemyHealthAfterAttack : 0;

    Game.currentActionMessages.add(
        '\n- ${name} attacked ${enemyChar.name} with a ${attackPower} physical hit \n');
    if (enemyChar.health > 0) {
      updateUltimateGauge(enemyChar);
    } else {
      Game.currentActionMessages.add('''
  
  ===> K.O!
      
      ''');
    }

    return Future.delayed(
      Duration(milliseconds: 300),
      () => Game.currentActionMessages,
    );
  }

  void magicalAttack(Character enemyChar) {
    final weaponMagicPowerFactor =
        weapon != null ? (weapon.magicPower / 4) : 10.0;

    var magicPower = ((wisdom / 10) *
                (weaponMagicPowerFactor / (enemyChar.level + 10)) *
                (level / 10) +
            weaponMagicPowerFactor)
        .truncate();
    magicPower = magicPower <= 0 ? 1 : magicPower;

    final enemyHealthAfterAttack = enemyChar.health - magicPower;

    enemyChar.health = enemyHealthAfterAttack > 0 ? enemyHealthAfterAttack : 0;

    print(
        '${name} attacked ${enemyChar.name} with a ${magicPower} magical hit');

    if (enemyChar.health > 0) {
      updateUltimateGauge(enemyChar);
    } else {
      // game.engGame();
    }
  }

  String toString() => ('''
  
  Character name: ${name}
  Instance id: ${instanceId}
  Identifier: ${elementIdentifier}
  Class: ${characterClass}
  Level: ${level}
  Health: ${health}
  Strength: ${strength}
  Wisdom: ${wisdom}
  Equipped weapon: ${weapon != null ? weapon.name : 'none'}
  Is Ultimate ready: ${isUltimateReady ? 'Yes' : 'No'}
  ''');

  Character(this.name) {
    setLevel(1);
  }
}
