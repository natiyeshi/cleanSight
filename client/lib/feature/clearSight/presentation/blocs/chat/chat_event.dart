part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ClearContext extends ChatEvent {}

class GetAllChats extends ChatEvent {
  String? message;
  GetAllChats(this.message);

  @override
  List<Object> get props => [];
}

class SendChat extends ChatEvent {
  Chat chat;
  List<Chat> chats;
  SendChat(this.chats, this.chat);
  @override
  List<Object> get props => [chats, chat];
}


class DeleteAllChat extends ChatEvent {
  DeleteAllChat();
  @override
  List<Object> get props => [];
}
