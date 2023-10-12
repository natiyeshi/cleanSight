part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];

  get chats => null;
}

final class LoadingChat extends ChatState {}

final class SendingChat extends ChatState {
  List<Chat> chats;
  SendingChat(this.chats);
  @override
  List<Object> get props => [chats];
}

final class ChatLoaded extends ChatState {
  List<Chat> chats;
  ChatLoaded(this.chats);
  @override
  List<Object> get props => [chats];
}


final class Error extends ChatState {
  List<Chat> chats;
  String error;
  Error(this.chats,this.error);
  @override
  List<Object> get props => [chats,error];
}