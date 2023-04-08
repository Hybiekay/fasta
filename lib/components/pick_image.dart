import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image == null) {
    return null;
  }
   File file = File(image.path);
  return file;
}
