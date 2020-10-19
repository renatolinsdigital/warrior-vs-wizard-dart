import '../game-elements/character.class.dart';
import '../helpers/enums.dart';

class Warrior extends Character {
  String elementIdentifier = 'warrior';

  Warrior(String name) : super(name) {
    this.elementIdentifier =
        '${super.elementIdentifier}_${this.elementIdentifier}';
    this.characterClass = CharacterClass.WARRIOR;
  }

  @override
  void setLevel(int newLevel) {
    this.level = newLevel;

    final warriorHealthAdjustment = (this.level * 5) + 50;
    this.health = this.baseHealth + warriorHealthAdjustment.truncate();

    final warriorStrengthAdjustment = (this.level * 3) + 50;
    this.strength = this.baseStrength + warriorStrengthAdjustment.truncate();

    final warriorWisdomAdjustment = (((this.level * 3) + 50) / 10).truncate();
    this.wisdom = this.baseWisdom - warriorWisdomAdjustment.truncate();
  }

  void classSpecialAttack() {
    // has a cooldown
    print('class special attack');
  }

  void unleashUltimate() {
    // has a cooldown
    print('Warrior ultimate attack');
  }
}
