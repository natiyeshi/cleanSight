import 'dart:convert';

import 'package:client/feature/clearSight/data/Chat.dart';
import 'package:client/core/Failure.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'chat_localstorage.dart';

class ChatLayer {
  Future<Either<Failure, List<Chat>>> clearContext(Chat c) async {
    try {
      var chatstore = ChatLocalStorage();
      await chatstore.saveChat(c);
      print("saved");
      return Right(await chatstore.getChatList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<List<Chat>> getAllChats() async {
    var chatstore = ChatLocalStorage();
    return await chatstore.getChatList();
  }

  Future<void> removeAllChats() async {
    var chatstore = ChatLocalStorage();
    await chatstore.deleteAllChatFiles();
    return;
  }

  Future<Either<Failure, List<Chat>>> sendChat(Chat user) async {
    var chatstore = ChatLocalStorage();
    try {
      await chatstore.saveChat(user);
      List<Chat> contexts = await chatstore.getChatList();
      print("loading $user <<< ");
      final url = Uri.parse('https://api.openai.com/v1/chat/completions');

      final request = http.Request('POST', url);

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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',
      });
      List<dynamic> contextData = [];
      for (int i = contexts.length - 1; i > -1; i--) {
        if (contexts[i].gpt == null || i + 4 < contexts.length) break;
        if (contexts[i].gpt == true) {
          contextData.add({'role': 'system', 'content': contexts[i].message});
        } else {
          contextData.add({'role': 'user', 'content': contexts[i].message});
        }
      }
      dynamic kk = contextData.reversed.toList();
      final requestBody = {
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'system', 'content': 'You are a helpful assistant.'},
          // Include previous conversation context
          ...kk,
        ],
      };
      print(requestBody);

      request.body = jsonEncode(requestBody);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      print("finished");
      print(result);
      if (response.statusCode != 200) {
        throw result;
      }
      var gpt = Chat(
        gpt: true,
        message: result["choices"][0]["message"]["content"],
      );
      await chatstore.saveChat(gpt);
      List<Chat> chats = await chatstore.getChatList();
      return Right(chats);
    } catch (e) {
      print("failure happend");
      return Left(Failure(message: e.toString()));
    }
  }
}
