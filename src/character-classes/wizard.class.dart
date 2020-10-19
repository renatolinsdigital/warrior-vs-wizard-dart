import '../game-elements/character.class.dart';
import '../enums/game.enums.dart';
import '../models/character-class.model.dart';

class Wizard extends Character implements CharacterClassModel {
  void updateElementIdentifier() {
    elementIdentifier = '${super.elementIdentifier}_warrior';
  }

  @override
  void setLevel(int newLevel) {
    level = newLevel;

    final wizardHealthAdjustment = (level * 2) - 50 - (level * 2);
    health = baseHealth - wizardHealthAdjustment.truncate();

    final wizardStrengthAdjustment = (((level * 3) + 50) / 10).truncate();
    strength = baseStrength - wizardStrengthAdjustment.truncate();

    final wizardWisdomAdjustment = (level * 3) + 50;
    wisdom = baseWisdom + wizardWisdomAdjustment.truncate();
  }

  void classSpecialAttack() {
    // has a cooldown
    print('class special attack');
  }

  void unleashUltimate() {
    // has a cooldown
    print('Wizard ultimate attack');
  }

  Wizard(String name) : super(name) {
    updateElementIdentifier();
    characterClass = CharacterClass.WIZARD;
  }
}
