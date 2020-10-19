import '../helpers/calculations.dart';
import '../helpers/enums.dart';
import 'weapon.class.dart';
import 'dart:math';

abstract class Character {
  String instanceId;
  String elementIdentifier = 'character';
  List<String> actionMessages = [];
  CharacterClass characterClass;
  String name;
  bool isUltimateReady = false;
  int ultimateGauge = 0;
  Weapon weapon;
  int level = 0;
  int health;
  int strength;
  int wisdom;
  int get baseHealth => ((pow(2, 8 + this.level / 50)).floor() - this.level);
  int get baseStrength => (10 + ((this.level / 20) * 40)).truncate();
  int get baseWisdom => (10 + ((this.level / 20) * 40)).truncate();

  void setLevel(int newLevel) {
    this.level = newLevel;
    this.health = baseHealth;
    this.strength = baseStrength;
    this.wisdom = baseWisdom;
  }

  int getLevel() => this.level;

  void classSpecialAttack();

  void unleashUltimate();

  void equipWeapon(Weapon weapon) {
    this.weapon = weapon;
  }

  updateUltimateGauge(Character enemyChar) {
    this.ultimateGauge += 10;
    enemyChar.ultimateGauge += 4;

    if (this.ultimateGauge >= 50) {
      this.ultimateGauge = 50;
      this.isUltimateReady = true;
      actionMessages.add('(${this.name}´s ULTIMATE is ready!) \n');
    }
    if (enemyChar.ultimateGauge >= 50) {
      enemyChar.ultimateGauge = 50;
      enemyChar.isUltimateReady = true;
      actionMessages.add('(${enemyChar.name}´s ULTIMATE is ready!) \n');
    }
  }

  Future<List<String>> physicalAttack(Character enemyChar) async {
    actionMessages = [];

    final weaponPowerFactor =
        this.weapon != null ? (this.weapon.attackPower / 4) : 10.0;

    var attackPower = ((this.strength / 10) *
                (weaponPowerFactor / (enemyChar.level + 10)) *
                (this.level / 10) +
            weaponPowerFactor)
        .truncate();

    attackPower = applyVariationPercentage(attackPower, 5);

    attackPower = attackPower <= 0 ? 1 : attackPower;

    final enemyHealthAfterAttack = enemyChar.health - attackPower;

    enemyChar.health = enemyHealthAfterAttack > 0 ? enemyHealthAfterAttack : 0;

    actionMessages.add(
        '\n- ${this.name} attacked ${enemyChar.name} with a ${attackPower} physical hit \n');

    // colocar tipo de uma barra de progresso aqui |||||||||| (a cada 10% de reducao
    // uma barra diminui)

    if (enemyChar.health > 0) {
      updateUltimateGauge(enemyChar);
    } else {
      actionMessages.add('''
  
  ===> K.O!
      
      ''');
    }

    return Future.delayed(
      Duration(milliseconds: 300),
      () => actionMessages,
    );

    // return actionMessages; // synchronous
  }

  void magicalAttack(Character enemyChar) {
    final weaponMagicPowerFactor =
        this.weapon != null ? (this.weapon.magicPower / 4) : 10.0;

    var magicPower = ((this.wisdom / 10) *
                (weaponMagicPowerFactor / (enemyChar.level + 10)) *
                (this.level / 10) +
            weaponMagicPowerFactor)
        .truncate();
    magicPower = magicPower <= 0 ? 1 : magicPower;

    final enemyHealthAfterAttack = enemyChar.health - magicPower;

    enemyChar.health = enemyHealthAfterAttack > 0 ? enemyHealthAfterAttack : 0;

    print(
        '${this.name} attacked ${enemyChar.name} with a ${magicPower} magical hit');

    if (enemyChar.health > 0) {
      updateUltimateGauge(enemyChar);
    } else {
      // game.engGame();
    }
  }

  String toString() => ('''
  
  Character name: ${this.name}
  Instance id: ${this.instanceId}
  Identifier: ${this.elementIdentifier}
  Class: ${this.characterClass}
  Level: ${this.level}
  Health: ${this.health}
  Strength: ${this.strength}
  Wisdom: ${this.wisdom}
  Equipped weapon: ${this.weapon != null ? this.weapon.name : 'none'}
  Is Ultimate ready: ${this.isUltimateReady ? 'Yes' : 'No'}
  ''');

  Character(String this.name) {
    this.setLevel(1);
  }
}
