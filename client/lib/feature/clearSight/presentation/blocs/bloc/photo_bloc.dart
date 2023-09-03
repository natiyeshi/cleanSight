import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import "package:http/http.dart" as http;
import 'dart:io';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoInitial()) {
    on<Form1Event>((event, emit) {
      emit(Form1State());
    });
    on<Form2Event>((event, emit) {
      emit(Form2State());
    });
    on<Form3Event>((event, emit) async {
      emit(Form3State());
    });
    on<Form4Event>((event, emit) {
      // emit(Form4State());
    });

    on<UploadImage>((event, emit) async {
      try {
        emit(Loading());
        List result = await submitSubscription(file: event.file);
        emit(Form4State(result[1]));
      } catch (e) {
        emit(Error());
      }
    });
  }

  Future<List> submitSubscription({File? file}) async {
    print(file);
    print("---------------------");
    try {
      ///MultiPart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("http://192.168.137.1:8000/"),
      );
      Map<String, String> headers = {"Content-type": "multipart/form-data"};
      request.files.add(
        await http.MultipartFile.fromPath('image', file!.path),
      );

      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      print(result);
      return [streamedResponse.statusCode, result];
    } catch (e) {
      print("ERROR");
      print(e.toString());
      return [];
    }
  }
}
