import 'dart:math';
import 'dart:io';
import '../enums/game.enums.dart';
import '../game-elements/weapon.class.dart';
import '../game-elements/character.class.dart';

class Game {
  GameStatus status = GameStatus.STOPPED;
  String winnerName;
  List<Weapon> weapons = [];
  List<Character> characters = [];
  static File batteLog;

  Game() {
    final battleLogFileName = 'battle-log.txt';
    final oldBattleLog = File(battleLogFileName);

    if (oldBattleLog.existsSync()) oldBattleLog.deleteSync();

    batteLog = File(battleLogFileName);
  }

  // Main methods

  Future<void> run() async {
    this.status = GameStatus.RUNNING;
    await Game.writeToBattleLog(this.toString());
  }

  void pause() {
    this.status = GameStatus.PAUSED;
  }

  void stop() {
    this.winnerName = null;
    this.weapons = [];
    this.characters = [];
    this.status = GameStatus.STOPPED;
  }

  // Battle log

  static Future<File> writeToBattleLog(String text) {
    return batteLog.writeAsString(text, mode: FileMode.append);
  }

  static Future<bool> bulkWriteToBattleLog(List<String> messageList) async {
    for (int i = 0; i < messageList.length; i++) {
      await batteLog.writeAsString(messageList[0].toString(),
          mode: FileMode.append);
    }

    return Future.delayed(
      Duration(milliseconds: 300),
      () => true,
    );
  }

  // Weapons

  void addWeapon(Weapon weapon) {
    if (this.status != GameStatus.RUNNING) {
      print('Game is not running');
      return;
    }
    final instanceHashCode = Random().hashCode;
    weapon.instanceId = instanceHashCode.toString();
    this.weapons.add(weapon);
  }

  List<Weapon> getWeaponsByType(WeaponType type) {
    return weapons.where((weapon) => weapon.type == type).toList();
  }

  String weaponsToString() {
    const logTitle = ('''

= GAME WEAPONS =
  ''');
    final List<String> weaponsAsList =
        this.weapons.map((weapon) => weapon.toString()).toList();

    final String weaponsAsString =
        weaponsAsList.reduce((prev, next) => ('''${prev} ${next}'''));
    return logTitle + weaponsAsString;
  }

  // Characters

  addCharacter(Character character) {
    if (this.status != GameStatus.RUNNING) {
      print('Game is not running');
      return;
    }

    final instanceHashCode = Random().hashCode;
    character.instanceId = instanceHashCode.toString();
    this.characters.add(character);
  }

  List<Character> getCharactersByClass(CharacterClass charClass) {
    return characters
        .where((character) => character.characterClass == charClass)
        .toList();
  }

  String charactersToString() {
    const logTitle = ('''

= GAME CHARACTERS =
  ''');
    final List<String> charactersAsList =
        this.characters.map((char) => char.toString()).toList();

    final String charactersAsString =
        charactersAsList.reduce((prev, next) => ('''${prev} ${next}'''));
    return logTitle + charactersAsString;
  }

  // Others

  String toString() => ('''
= GAME INFO =
  
  Status: ${this.status}   
  Winner: ${this.winnerName ?? 'No winners yet'} 
  ''');
}
