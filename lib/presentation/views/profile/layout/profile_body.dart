import 'package:flutter/material.dart';
import 'package:k24/navigation_helper/navigation_helper.dart';
import 'package:k24/presentation/elements/custom_text.dart';

import '../../update_profile/update_profile.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/images/dp.png'),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.amber,
                    child: Icon(Icons.camera_alt,size: 11,color: Colors.white,),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'User Name',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: 'Edit Profile',
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                    ),
                  ],
                ),
              ),

            ],
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: (){
                NavigationHelper.pushRoute(context, UpdateProfile());
              },
              child: CustomText(text: 'Profile')),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          CustomText(text: 'Term & Conditions'),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          CustomText(text: 'Privacy Policy'),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          CustomText(text: 'Payment History'),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          CustomText(text: 'Change password'),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          CustomText(text: 'Delete account',color: Colors.red,),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          CustomText(text: 'Logout',color: Colors.red,),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
