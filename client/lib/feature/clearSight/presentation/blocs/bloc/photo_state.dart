part of 'photo_bloc.dart';

@immutable
sealed class PhotoState extends Equatable {}

final class PhotoInitial extends PhotoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Form1State extends PhotoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Form2State extends PhotoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Form3State extends PhotoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Form4State extends PhotoState {
  dynamic result;
  Form4State(this.result);
  @override
  // TODO: implement props
  List<Object?> get props => [result];
}

class UploadImage extends PhotoEvent {
  File? file;
  UploadImage(this.file);
  @override
  List<Object?> get props => [file];
}
