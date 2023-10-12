import 'package:client/feature/clearSight/presentation/blocs/bloc/photo_bloc.dart';
import 'package:client/feature/clearSight/presentation/widgets/Box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:image_picker/image_picker.dart";
import 'dart:io';

class Form3 extends StatefulWidget {
  Form3({super.key, this.nextPage, this.backPage});
  final void nextPage;
  final void backPage;
  @override
  State<Form3> createState() => _Form3State();
}

enum Gender { male, female }

class _Form3State extends State<Form3> {
  Gender? selectedGender, selectIssue;
  File? _image;
  var imagePicker;
  String? alert = "";
  late List _results;

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  Future pickImager(bool camera) async {
    try {
      XFile image = await imagePicker.pickImage(
        source: camera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front,
      );
      setState(() {
        _image = File(image.path);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 570,
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              child: Column(
                children: [
                  Container(
                    // color: Theme.of(context).colorScheme.secondaryContainer,
                    height: 300,
                    child: _image != null
                        ? Image.file(
                            _image!,
                            width: 500.0,
                            height: 500.0,
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Icon(
                              Icons.wallpaper,
                              size: 150,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                  ),
                  SizedBox(height: 10),
                  Text(alert!),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: RawMaterialButton(
                      onPressed: () => pickImager(false),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Upload Photo",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: RawMaterialButton(
                      onPressed: () => pickImager(true),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "take photo",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        context.read<PhotoBloc>().add(Form2Event());
                      },
                      padding: EdgeInsets.symmetric(vertical: 14),
                      fillColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        if (_image == null) {
                          return;
                        }
                        context.read<PhotoBloc>().add(UploadImage(_image));
                      },
                      padding: EdgeInsets.symmetric(vertical: 14),
                      fillColor: _image == null
                          ? Colors.grey
                          : Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
