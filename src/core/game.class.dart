/* Core Game functionallities*/
import 'dart:math';
import 'dart:io';
import '../enums/game.enums.dart';
import '../game-elements/weapon.class.dart';
import '../game-elements/character.class.dart';
import '../helpers/extractType.dart';

class Game {
  GameStatus status = GameStatus.STOPPED;
  String winnerName;
  List<Weapon> weapons = [];
  List<Character> characters = [];
  static File batteLog;
  static List<String> currentActionMessages = [];

  // Main methods

  Future<void> run() async {
    status = GameStatus.RUNNING;
    await Game.writeToBattleLog(toString());
  }

  void pause() {
    status = GameStatus.PAUSED;
  }

  void stop() {
    winnerName = null;
    weapons = [];
    characters = [];
    status = GameStatus.STOPPED;
  }

  // Battle log

  static Future<File> writeToBattleLog(String text) {
    return batteLog.writeAsString('''
    
    ${text}
    ''', mode: FileMode.append);
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

  // Weapons management

  void addWeapon(Weapon weapon) {
    if (status != GameStatus.RUNNING) {
      print('Game is not running');
      return;
    }
    final instanceHashCode = Random().hashCode;
    weapon.instanceId = instanceHashCode.toString();
    weapons.add(weapon);
  }

  List<Weapon> getWeaponsByType(WeaponType type) {
    return weapons.where((weapon) => weapon.type == type).toList();
  }

  String weaponsToString() {
    const logTitle = ('''= GAME WEAPONS =
    ''');
    final List<String> weaponsAsList =
        weapons.map((weapon) => weapon.toString()).toList();

    final String weaponsAsString =
        weaponsAsList.reduce((prev, next) => ('''${prev} ${next}'''));
    return logTitle + weaponsAsString;
  }

  // Characters management

  addCharacter(Character character) {
    if (status != GameStatus.RUNNING) {
      print('Game is not running');
      return;
    }

    final instanceHashCode = Random().hashCode;
    character.instanceId = instanceHashCode.toString();
    characters.add(character);
  }

  List<Character> getCharactersByClass(CharacterClass charClass) {
    return characters
        .where((character) => character.characterClass == charClass)
        .toList();
  }

  String charactersToString() {
    const logTitle = ('''= GAME CHARACTERS =
    ''');
    final List<String> charactersAsList =
        characters.map((char) => char.toString()).toList();

    final String charactersAsString =
        charactersAsList.reduce((prev, next) => ('''${prev} ${next}'''));
    return logTitle + charactersAsString;
  }

  // Stringifying

  String toString() => ('''= GAME INFO =  

  Status: ${extractType(status)}   
  Winner: ${winnerName ?? 'No winners yet'}''');

  // Constructor

  Game() {
    final battleLogFileName = 'battle-log.txt';
    final oldBattleLog = File(battleLogFileName);

    if (oldBattleLog.existsSync()) oldBattleLog.deleteSync();

    batteLog = File(battleLogFileName);
  }
}
