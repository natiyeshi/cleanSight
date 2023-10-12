import 'package:bloc/bloc.dart';
import 'package:client/feature/clearSight/data/Chat.dart';
import 'package:client/feature/clearSight/data/chat_layer.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(LoadingChat()) {
    var chatLayer = ChatLayer();
    on<GetAllChats>((event, emit) async {
      List<Chat> chats = await chatLayer.getAllChats();
      emit(ChatLoaded(chats));
      if (event.message != null && event.message!.isNotEmpty == true) {
        var newChat = Chat(message: event.message, gpt: false);
        chats.add(newChat);
        emit(SendingChat(chats));
        var result = await chatLayer.sendChat(newChat);
        result.fold((failure) {
          print("sending failure => $failure");
          Error(chats, failure.message);
        }, (chats) {
          emit(ChatLoaded(chats));
        });
      }
    });

    on<SendChat>((event, emit) async {
      List<Chat> chats = event.chats;
      chats.add(event.chat);
      emit(SendingChat(chats));
      var result = await chatLayer.sendChat(event.chat);
      result.fold((failure) {
        print("sending failure => $failure");
        Error(event.chats, failure.message);
      }, (chats) {
        emit(ChatLoaded(chats));
      });
    });

    on<ClearContext>((event, emit) async {
      var c = Chat(message: DateTime.now().toString());

      var result = await chatLayer.clearContext(c);
      result.fold((failure) {
        print("sending failure => $failure");
        Error([], failure.message);
      }, (chats) {
        emit(ChatLoaded(chats));
      });
    });

    on<DeleteAllChat>((event, emit) async {
      emit(LoadingChat());
      await chatLayer.removeAllChats();
      List<Chat> chats = await chatLayer.getAllChats();
      emit(ChatLoaded(chats));
    });
  }
}
