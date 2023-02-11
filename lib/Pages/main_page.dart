import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:duckcart/Constants/constants.dart';
import 'package:duckcart/Pages/body.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
        ),
        onPressed: () {},
        color: Colors.white,
      ),
      actions: const <Widget>[
        CircleAvatar(
          radius: 22,
          backgroundImage:
              NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(width: kDefaultPadding)
      ],
    );
  }
}
