import 'package:flutter/material.dart';
import 'package:k24/presentation/elements/app_button.dart';
import 'package:k24/presentation/elements/custom_text.dart';
import 'package:k24/presentation/elements/custom_textfield.dart';
enum Gender { male, female }
class UpdateProfileBody extends StatefulWidget {
  const UpdateProfileBody({Key? key}) : super(key: key);

  @override
  State<UpdateProfileBody> createState() => _UpdateProfileBodyState();
}
Gender _gender = Gender.male;
class _UpdateProfileBodyState extends State<UpdateProfileBody> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30,),
          const Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/dp.png'),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.camera_alt,size: 18,color: Colors.white,),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          CustomText(text: 'Full Name',fontSize: 15,fontWeight: FontWeight.w600,),
          AuthTextField(hint: 'John Wick', controller: nameController),
          const SizedBox(height: 5,),
          CustomText(text: 'Email',fontSize: 15,fontWeight: FontWeight.w600,),
          AuthTextField(hint: 'Email', controller: nameController),
          const SizedBox(height: 5,),
          CustomText(text: 'Date of Birth',fontSize: 15,fontWeight: FontWeight.w600,),
          AuthTextField(hint: '08/08/2001', controller: nameController),
          const SizedBox(height: 5,),
          CustomText(text: 'Zodiac',fontSize: 15,fontWeight: FontWeight.w600,),
          AuthTextField(hint: 'Enter your sign', controller: nameController),
          const SizedBox(height: 15,),
          CustomText(text: 'Gender',fontWeight: FontWeight.w600,fontSize: 16,),
          SizedBox(
            height: 80,
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
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
          AppButton(onPressed: (){}, text: 'Update'),
        ],
      ),
    );
  }
}
