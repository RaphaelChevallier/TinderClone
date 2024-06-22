import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tinder_clone/auth/login_or_register.dart';
import 'package:tinder_clone/pages/home_page/home_page_desktop_body.dart';
import 'package:tinder_clone/pages/home_page/home_page_mobile_body.dart';
import 'package:tinder_clone/pages/home_page/home_page_tablet_body.dart';
import 'package:tinder_clone/responsive/responsive_layout.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Supabase.instance.client.auth.onAuthStateChange,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final event = snapshot.data!.event;
              final session = snapshot.data!.session;

              switch (event) {
                case AuthChangeEvent.initialSession:
                case AuthChangeEvent.signedIn:
                  if (session != null) {
                    return ResponsiveLayout(
                        mobileBody: HomePageMobileScaffold(),
                        tabletBody: const HomePageTabletScaffold(),
                        desktopBody: const HomePageDesktopScaffold());
                  } else {
                    return const LoginOrRegister();
                  }
                case AuthChangeEvent.signedOut:
                  return const LoginOrRegister();
                default:
                  return const LoginOrRegister();
              }
            } else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
