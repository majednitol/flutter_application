import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final imageFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (imageFile != null) {
      image = File(imageFile.path);

      setState(() {});
    } else {
      print("No image file selected");
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });
    final stream = http.ByteStream(image!.openRead());
    stream.cast();

    var lenth = await image!.length();
    var uri = Uri.parse("https://fakestoreapi.com/products");
    var requst = http.MultipartRequest('post', uri);

    var multiport = http.MultipartFile('image', stream, lenth);
    requst.files.add(multiport);
    var response = await requst.send();

    if (response.statusCode == 200) {
      print("image successfully uploaded");
      setState(() {
        showSpinner = false;
      });
    } else {
      print(" image failed to uploaded ");
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload Image'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                child: image == null
                    ? const Center(
                        child: Text('Pick Image'),
                      )
                    : Container(
                        child: Center(
                          child:Image.file(File(image!.path).absolute,
                          fit: BoxFit.cover,
                          height: 200,
                          width: 200,
                          
                          )
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green,
                child: const Center(child: Text('Upload')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
