import '../enums/game.enums.dart';

abstract class Weapon {
  String instanceId;
  String elementIdentifier = 'weapon';
  String name;
  WeaponType type;
  int attackPower = 0;
  int magicPower = 0;
  int _condition = 100;
  void set condition(int newCondition) => _condition = newCondition;
  int get condition => _condition;
  String toString() => ('''
  
  Weapon name: ${this.name}
  Instance id: ${this.instanceId}
  Identifier: ${this.elementIdentifier}
  Type: ${this.type}''');
  Weapon([String this.name = 'Generic Weapon']);

  void weaponSpecialSkill();
}
