import 'package:duckcart/Components/next_screen.dart';
import 'package:duckcart/Components/snack_bar.dart';
import 'package:duckcart/Pages/main_page.dart';
import 'package:duckcart/providers/internet_provider.dart';
import 'package:duckcart/providers/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    children: const [
                      Image(
                        image: AssetImage('lib/images/image1.png'),
                        height: 230,
                        width: 230,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Welcome To Donation App",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    RoundedLoadingButton(
                      controller: googleController,
                      successColor: Colors.purple,
                      color: Colors.purple,
                      width: MediaQuery.of(context).size.width * 0.80,
                      elevation: 0,
                      borderRadius: 15,
                      onPressed: () {
                        handleGoogleSignIn();
                      },
                      // borderRadius: BorderRadius.circular(12),
                      child: Wrap(
                        children: const [
                          Icon(
                            FontAwesomeIcons.google,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            "Sign In with Google",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RoundedLoadingButton(
                      controller: facebookController,
                      successColor: Colors.blueAccent,
                      color: Colors.blueAccent,
                      width: MediaQuery.of(context).size.width * 0.80,
                      elevation: 0,
                      borderRadius: 15,
                      onPressed: () {},
                      // borderRadius: BorderRadius.circular(12),
                      child: Wrap(
                        children: const [
                          Icon(
                            FontAwesomeIcons.facebook,
                            size: 22,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            "Sign In with Facebook",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // handle google sign in
  Future handleGoogleSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();
    if (ip.hasInternet == false) {
      openSnackbar(context, "Check Your Internet Connection", Colors.red);
      googleController.reset();
    } else {
      await sp.signInWithGoogle().then(
        (value) {
          if (sp.hasError == true) {
            openSnackbar(context, sp.errorCode.toString(), Colors.red);
            googleController.reset();
          } else {
            //checking whether user exists or not
            sp.checkUserExists().then(
              (value) async {
                if (value == true) {
                  await sp.getUserDataFromFirestore(sp.uid).then(
                        (value) => sp.saveDataToSharedPreferences().then(
                              (value) => sp.setSignIn().then(
                                    (value) {
                                      googleController.success();
                                      handleAfterSignIn();
                                    },
                                  ),
                            ),
                      );
                } else {
                  // user doesn't Exists
                  sp.saveDataToFirestore().then(
                        (value) => sp.saveDataToSharedPreferences().then(
                              (value) => sp.setSignIn().then(
                                (value) {
                                  googleController.success();
                                  handleAfterSignIn();
                                },
                              ),
                            ),
                      );
                }
              },
            );
          }
        },
      );
    }
  }

  handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 1000)).then(
      (value) {
        nextScreenReplace(context, const MainPage());
      },
    );
  }
}
