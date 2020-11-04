import '../enums/game.enums.dart';
import '../helpers/extractType.dart';

abstract class Weapon {
  String instanceId;
  String elementIdentifier = 'weapon';
  String name;
  WeaponType type;
  int attackPower = 0;
  int magicPower = 0;
  int specialSkillPower = 0;
  String specialSkillName;
  int _condition = 100;
  void set condition(int newCondition) => _condition = newCondition;
  int get condition => _condition;

  String toString() => ('''
  
  Weapon name: ${name}
  Instance id: ${instanceId}
  Identifier: ${elementIdentifier}
  Type: ${extractType(type)}''');
  Weapon([String name = 'Generic Weapon']);

  // Weapon´s of any type need to implement method below
  void updateElementIdentifier();
}
