import '../game-elements/character.class.dart';
import '../enums/game.enums.dart';

class Wizard extends Character {
  String elementIdentifier = 'wizard';

  Wizard(String name) : super(name) {
    this.elementIdentifier =
        '${super.elementIdentifier}_${this.elementIdentifier}';
    this.characterClass = CharacterClass.WIZARD;
  }

  @override
  void setLevel(int newLevel) {
    this.level = newLevel;

    final wizardHealthAdjustment = (this.level * 2) - 50 - (this.level * 2);
    this.health = this.baseHealth - wizardHealthAdjustment.truncate();

    final wizardStrengthAdjustment = (((this.level * 3) + 50) / 10).truncate();
    this.strength = this.baseStrength - wizardStrengthAdjustment.truncate();

    final wizardWisdomAdjustment = (this.level * 3) + 50;
    this.wisdom = this.baseWisdom + wizardWisdomAdjustment.truncate();
  }

  void classSpecialAttack() {
    // has a cooldown
    print('class special attack');
  }

  void unleashUltimate() {
    // has a cooldown
    print('Wizard ultimate attack');
  }
}
