part of 'photo_bloc.dart';

@immutable
sealed class PhotoEvent extends Equatable {}

class Form1Event extends PhotoEvent {
  @override
  List<Object?> get props => [];
}

class Form2Event extends PhotoEvent {
  @override
  List<Object?> get props => [];
}

class Form3Event extends PhotoEvent {
  @override
  List<Object?> get props => [];
}

class Form4Event extends PhotoEvent {
  @override
  List<Object?> get props => [];
}

