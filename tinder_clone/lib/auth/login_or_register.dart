import 'package:flutter/cupertino.dart';
import 'package:tinder_clone/pages/login_page/login_page_desktop_body.dart';
import 'package:tinder_clone/pages/login_page/login_page_mobile_body.dart';
import 'package:tinder_clone/pages/login_page/login_page_tablet_body.dart';
import 'package:tinder_clone/pages/register_page/register_page_desktop_body.dart';
import 'package:tinder_clone/pages/register_page/register_page_mobile_body.dart';
import 'package:tinder_clone/pages/register_page/register_page_tablet_body.dart';
import 'package:tinder_clone/responsive/responsive_layout.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show login page

  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return ResponsiveLayout(
          mobileBody: LoginPageMobileScaffold(
            onTap: togglePages,
          ),
          tabletBody: const LoginPageTabletScaffold(),
          desktopBody: const LoginPageDesktopScaffold());
    } else {
      return ResponsiveLayout(
          mobileBody: RegisterPageMobileScaffold(
            onTap: togglePages,
          ),
          tabletBody: const RegisterPageTabletScaffold(),
          desktopBody: const RegisterPageDesktopScaffold());
    }
  }
}
