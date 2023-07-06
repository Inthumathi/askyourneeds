import 'dart:io';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _showImageOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: IconButton(
                      onPressed: () {
                        _getImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.photo_camera, color: primaryColor),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Camera'),
                ],
              ),
              SizedBox(width: 40),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: IconButton(
                      onPressed: () {
                        _getImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.photo_library, color: primaryColor),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Gallery'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgMainColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Center(
          child: SmallText(
            text: MyStrings.editProfile,
            fontWeight: FontWeight.w600,

          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: MyStrings.fullName.toUpperCase(),
                      fontWeight: FontWeight.w700,
                    ),
                    heightSpace,
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor,
                        isDense: true,
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    heightSpace,
                    SmallText(
                      text: MyStrings.email.toUpperCase(),
                      fontWeight: FontWeight.w700,
                    ),
                    heightSpace,
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor,
                        isDense: true,
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    heightSpace,
                    SmallText(
                      text: MyStrings.mobileNumber.toUpperCase(),
                      fontWeight: FontWeight.w700,
                    ),
                    heightSpace,
                    TextField(
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^1+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^2+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^3+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^4+')),
                        FilteringTextInputFormatter.deny(RegExp(r'^5+')),
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor,
                        isDense: true,
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    _image != null ? SizedBox(): ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        minimumSize: const Size(140.0, 44.0),
                      ),
                      onPressed: _showImageOptions,
                      child: SmallText(text: MyStrings.uploadImage),
                    ),
                    const SizedBox(height: 20),
                    if (_image != null) ...[
                      Stack(
                        children: [
                          Image.file(_image!, width: 100),
                          Positioned(
                            top: -10,
                            right: -10,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _image = null;
                                });
                              },
                              icon: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: offerColor
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(Icons.close,color: whiteColor,),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],

                    _image == null ? SizedBox():  const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child:
                          SmallText(text: MyStrings.submit, color: whiteColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
