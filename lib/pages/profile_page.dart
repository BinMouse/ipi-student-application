import 'package:flutter/material.dart';

import 'package:ipi_app/primitives/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(Profile.instance.photoUrl ?? ''),
            ),
            Text(Profile.instance.fullName ?? ''),
            Text(Profile.instance.groupName ?? ''),
            Text(Profile.instance.groupNumber ?? ''),
            Text(Profile.instance.phoneNumber ?? ''),
          ],
        ),
      ),
    );
  }
}
