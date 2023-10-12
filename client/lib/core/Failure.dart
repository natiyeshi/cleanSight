import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  Failure({required this.message});
  String message;
  @override
  List<Object?> get props => [message];
}
