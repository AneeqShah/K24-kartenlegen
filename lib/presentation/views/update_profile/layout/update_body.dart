import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k24/app/custom_loader.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:k24/presentation/elements/custom_textfield.dart';

import '../../../../app/Custom_image_container.dart';
import '../../../../config/front_end_config.dart';
import '../../../../model/image_upload.dart';

enum Gender { male, female }

class UpdateProfileBody extends StatefulWidget {
  final String fullName;
  final String image;
  final String email;
  final String dob;
  final String zodiac;
  final bool gender;
  final String country;

  const UpdateProfileBody(
      {super.key,
      required this.fullName,
      required this.image,
      required this.email,
      required this.dob,
      required this.zodiac,
      required this.gender,
      required this.country});

  @override
  State<UpdateProfileBody> createState() => _UpdateProfileBodyState();
}

Gender _gender = Gender.male;

class _UpdateProfileBodyState extends State<UpdateProfileBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController zodiacController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  String image = "";
  bool gender = false;
  bool isLoading = false;
  String userID = FirebaseAuth.instance.currentUser!.uid;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    nameController.text = widget.fullName;
    emailController.text = widget.email;
    dobController.text = widget.dob;
    zodiacController.text = widget.zodiac;
    countryController.text = widget.country;
    image = widget.image;
    gender = widget.gender;
  }

  @override
  Widget build(BuildContext context) {
    return CustomLoader(
      isLoading: isLoading,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  _showPicker(context);
                },
                child: Center(
                  child: file != null
                      ? Container(
                          height: 110,
                          width: 110,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(500),
                              child: Image.file(
                                file!,
                                fit: BoxFit.fill,
                              )),
                        )
                      : image == ""
                          ? const CircleAvatar(
                              backgroundColor: FrontEndConfigs.kPrimaryColor,
                              radius: 60,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.camera_alt_outlined),
                                  ),
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                CustomImageContainer(
                                  height: 110,
                                  wight: 110,
                                  radius: 500,
                                  image: image,
                                ),
                              ],
                            ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomText(
                text: 'Full Name',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              AuthTextField(hint: 'John Wick', controller: nameController),
              const SizedBox(
                height: 15,
              ),
              CustomText(
                text: 'Email',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              AuthTextField(
                  isEnable: false, hint: 'Email', controller: emailController),
              const SizedBox(
                height: 15,
              ),
              CustomText(
                text: 'Date of Birth',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: dobController.text == ""
                              ? "Select Date of Birth"
                              : dobController.text),
                      IconButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2101));
                            if (picked != null && picked != selectedDate) {
                              setState(() {
                                selectedDate = picked;
                                dobController.text =
                                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                              });
                            }
                          },
                          icon: Icon(Icons.calendar_month))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomText(
                text: 'Zodiac',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              AuthTextField(
                  hint: 'Enter your sign', controller: zodiacController),
              const SizedBox(
                height: 15,
              ),
              CustomText(
                text: 'Country',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              AuthTextField(
                  hint: 'Enter your Country', controller: countryController),
              const SizedBox(
                height: 15,
              ),
              CustomText(
                text: 'Gender',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ListTile(
                        title: const Text('Male'),
                        leading: Radio<Gender>(
                          value: Gender.male,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 240,
                      child: ListTile(
                        title: const Text('Female'),
                        leading: Radio<Gender>(
                          value: Gender.female,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppButton(
                  onPressed: () {
                   _updateProfile();
                  },
                  text: 'Update'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: Text('Gallery'),
                      onTap: () {
                        getImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      getImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  ImagePicker picker = ImagePicker();
  File? file;
  String imageUrl = "";

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source, imageQuality: 30);
    if (pickedFile != null && pickedFile.path != null) {
      loadingTrue();

      file = File(pickedFile.path);
      setState(() {});
      // ignore: use_build_context_synchronously
      imageUrl = await UploadFileServices().getUrl(context, file: file!);
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userID)
          .set({"image": imageUrl}, SetOptions(merge: true)).then((value) {
        loadingFalse();
        Fluttertoast.showToast(msg: "Profile Image Updated");
      });
    }
  }

  _updateProfile() async {
    try {
      loadingTrue();
      await FirebaseFirestore.instance.collection("Users").doc(userID).set({
        'name': nameController.text,
        'country': countryController.text,
        'zodiac': zodiacController.text,
        'dob': dobController.text,
        "isMale": _gender.name == "male" ? true : false,
      }, SetOptions(merge: true)).then((value) {
        loadingFalse();
        Fluttertoast.showToast(msg: "Updated");
      });
    } on FirebaseException catch (e) {
      loadingFalse();
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  loadingTrue() {
    isLoading = true;
    setState(() {});
  }

  loadingFalse() {
    isLoading = false;
    setState(() {});
  }
}
