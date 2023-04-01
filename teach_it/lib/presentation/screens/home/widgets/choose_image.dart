// ignore: avoid_web_libraries_in_flutter
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

Future imageChooser() async {
  var imagefile = await ImagePicker().pickImage(source: ImageSource.gallery);
  File image = File(imagefile!.path);
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference reference = storage.ref().child('images/${DateTime.now().toString()}');
  UploadTask uploadTask = reference.putFile(image);
  await uploadTask.whenComplete(() => null);
   String imageUrl = await reference.getDownloadURL();
  return imageUrl;
}
