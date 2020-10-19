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
  
  Weapon name: ${name}
  Instance id: ${instanceId}
  Identifier: ${elementIdentifier}
  Type: ${type}''');
  Weapon([String name = 'Generic Weapon']);

  // Weapon´s will need to implement(as if it we have an interface here)
  void updateElementIdentifier();
  void weaponSpecialSkill();
}
