import '../game-elements/weapon.class.dart';
import '../helpers/enums.dart';

class Wand extends Weapon {
  String elementIdentifier = 'magical_wand';
  Wand(String name, {int magicPower}) : super(name) {
    this.magicPower = magicPower;
    this.attackPower = 10;
    this.type = WeaponType.WAND;
    this.elementIdentifier =
        '${super.elementIdentifier}_${this.elementIdentifier}';
  }

  @override
  void weaponSpecialSkill() {
    print('Wapon special skill');
  }

  @override
  String toString() => ('''
  ${super.toString()}
  Condition: ${this.condition}%
  Attack power: ${this.attackPower}
  Magic power: ${this.magicPower}
  ''');
}
