import 'package:duckcart/Components/next_screen.dart';
import 'package:duckcart/Pages/login_screen.dart';
import 'package:duckcart/Pages/user_details.dart';
import 'package:duckcart/providers/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:duckcart/Constants/constants.dart';
import 'package:duckcart/Pages/body.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    final sp = context.read<SignInProvider>();
    return AppBar(
      backgroundColor: Colors.deepPurple,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
        ),
        onPressed: () {
          sp.userSignOut();
          nextScreenReplace(context, const LoginScreen());
        },
        color: Colors.white,
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            nextScreen(context, UserDetails());
          },
          child: CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage("${sp.imageUrl}"),
            backgroundColor: Colors.transparent,
          ),
        ),
        SizedBox(width: kDefaultPadding)
      ],
    );
  }
}
