import 'dart:convert';
import 'package:client/feature/clearSight/data/Chat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatLocalStorage {
  String _key = 'chatList';

  Future<void> saveChat(Chat chat) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> storedMovies = prefs.getStringList(_key) ?? [];
      storedMovies.add(jsonEncode(chat.toJson()));
      await prefs.setStringList(_key, storedMovies.toList());
    } catch (e) {
      print("error saving data : ==> $e");
    }
  }

  Future<List<Chat>> getChatList() async {
    try {
      // await saveChat(Chat(message: "hiiii", gpt: false));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? chatJsonList = prefs.getStringList(_key);
      if (chatJsonList != null) {
        List<Chat> chats = chatJsonList.map((chatJson) {
          Map<String, dynamic> chatMap = jsonDecode(chatJson);
          return Chat.fromJson(chatMap);
        }).toList();
        return chats;
      }
      return [];
    } catch (e) {
      print("This error happened in local storage: $e");
      return [];
    }
  }

  Future<void> deleteAllChatFiles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
