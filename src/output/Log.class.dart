import 'dart:io';

class Log {
  static File batteLog;

  static createBattleLog(String battleLogFileName) {
    final oldBattleLog = File(battleLogFileName);
    if (oldBattleLog.existsSync()) oldBattleLog.deleteSync();
    batteLog = File(battleLogFileName);
  }

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
}
