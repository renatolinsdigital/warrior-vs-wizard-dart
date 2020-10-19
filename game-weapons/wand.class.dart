import '../game-elements/weapon.class.dart';
import '../enums/game.enums.dart';

class Wand extends Weapon {
  void updateElementIdentifier() {
    elementIdentifier = '${super.elementIdentifier}_magical_wand';
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
  Magic power: ${magicPower}
  ''');

  Wand(String name, {int magicPower}) : super(name) {
    updateElementIdentifier();
    this.name = name;
    this.magicPower = magicPower;
    attackPower = 10;
    type = WeaponType.WAND;
  }
}
