import '../../lib_packages/meta-1.2.3/lib/meta.dart';
import '../game-elements/weapon.class.dart';
import '../enums/game.enums.dart';

class Sword extends Weapon {
  void updateElementIdentifier() {
    elementIdentifier = '${super.elementIdentifier}_sword';
  }

  @override
  String toString() => ('''
  ${super.toString()}
  Condition: ${condition}%
  Attack power: ${attackPower}
  Magic power: ${magicPower}
  Special skill: ${specialSkillName}
  Special skill power: ${specialSkillPower}
  ''');

  Sword(String name,
      {@required int attackPower,
      int specialSkillPower = 0,
      String specialSkillName = 'none'})
      : super(name) {
    updateElementIdentifier();
    this.name = name;
    this.attackPower = attackPower;
    magicPower = 0;
    this.specialSkillPower = specialSkillPower;
    this.specialSkillName = specialSkillName;
    type = WeaponType.SWORD;
  }
}
