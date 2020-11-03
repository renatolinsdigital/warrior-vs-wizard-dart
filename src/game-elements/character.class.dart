import '../core/game.class.dart';
import '../enums/game.enums.dart';
import '../calculators/attack-power.calculator.dart';
import '../helpers/extractType.dart';
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

  Future<List<String>> attackWithWeapon(Character enemyChar,
      {AttackType attackType}) async {
    Game.currentActionMessages = [];

    final attackPower = attackPowerCalculator(
        weapon: this.weapon,
        character: this,
        enemyChar: enemyChar,
        attackType: attackType);

    final enemyHealthAfterAttack = enemyChar.health - attackPower;
    enemyChar.health = enemyHealthAfterAttack > 0 ? enemyHealthAfterAttack : 0;

    Game.currentActionMessages.add(
        '\n- ${name} attacked ${enemyChar.name} with a ${attackPower} ${extractType(attackType)} hit \n');
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
