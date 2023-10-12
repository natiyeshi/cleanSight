import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  String? message;
  bool? gpt;

  Chat({this.message, this.gpt});

  Chat.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    gpt = json['gpt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['gpt'] = this.gpt;
    return data;
  }
  
  @override
  List<Object?> get props => [message,gpt];
}
