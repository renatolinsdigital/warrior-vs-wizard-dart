import '../../lib_packages/meta-1.2.3/lib/meta.dart';
import '../game-elements/weapon.class.dart';
import '../enums/game.enums.dart';

class Wand extends Weapon {
  void updateElementIdentifier() {
    elementIdentifier = '${super.elementIdentifier}_wand';
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

  Wand(String name,
      {@required int magicPower,
      int specialSkillPower = 0,
      String specialSkillName = 'none'})
      : super(name) {
    updateElementIdentifier();
    this.name = name;
    this.magicPower = magicPower;
    attackPower = 10;
    this.specialSkillPower = specialSkillPower;
    this.specialSkillName = specialSkillName;
    type = WeaponType.WAND;
  }
}
