import '../game-elements/character.class.dart';
import '../enums/game.enums.dart';
import '../models/character-class.model.dart';

class Warrior extends Character implements CharacterClassModel {
  void updateElementIdentifier() {
    elementIdentifier = '${super.elementIdentifier}_warrior';
  }

  @override
  void setLevel(int newLevel) {
    level = newLevel;

    final warriorHealthAdjustment = (level * 5) + 50;
    health = baseHealth + warriorHealthAdjustment.truncate();

    final warriorStrengthAdjustment = (level * 3) + 50;
    strength = baseStrength + warriorStrengthAdjustment.truncate();

    final warriorWisdomAdjustment = (((level * 3) + 50) / 10).truncate();
    wisdom = baseWisdom - warriorWisdomAdjustment.truncate();
  }

  void classSpecialSkill() {
    print('class special skill');
  }

  void unleashUltimate() {
    // has a cooldown
    print('Warrior ultimate attack');
  }

  Warrior(String name) : super(name) {
    updateElementIdentifier();
    characterClass = CharacterClass.WARRIOR;
  }
}
