import '../game-elements/weapon.class.dart';
import '../helpers/enums.dart';

class Sword extends Weapon {
  String elementIdentifier = 'sharp_sword';

  // Constructor overriding: Defines a constructor and call super class constructor
  Sword(String name, {int attackPower}) : super(name) {
    this.attackPower = attackPower;
    this.magicPower = 0;
    this.type = WeaponType.SWORD;
    this.elementIdentifier =
        '${super.elementIdentifier}_${this.elementIdentifier}';
  }
  // Super class constructor will be called anyway, but e use : super(name)
  // to call the super class method with our instance name.

  @override
  void weaponSpecialSkill() {
    print('Wapon special skill');
  }

  @override
  String toString() => ('''
  ${super.toString()}
  Condition: ${this.condition}%
  Attack power: ${this.attackPower}
  ''');
// Notice above that we can use super class methods
}
