import '../game-elements/weapon.class.dart';
import '../enums/game.enums.dart';

class Sword extends Weapon {
  void updateElementIdentifier() {
    elementIdentifier = '${super.elementIdentifier}_sharp_sword';
  }

  @override
  void weaponSpecialSkill() {
    print('Wapon special skill');
  }

  @override
  String toString() => ('''
  ${super.toString()}
  Condition: ${condition}%
  Attack power: ${attackPower}
  ''');

  // Constructor overriding: Defines a constructor and call super class constructor
  Sword(String name, {int attackPower}) : super(name) {
    updateElementIdentifier();
    this.name = name;
    this.attackPower = attackPower;
    magicPower = 0;
    type = WeaponType.SWORD;
  }
}
