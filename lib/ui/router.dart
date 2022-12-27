import 'package:flutter/material.dart';
import 'package:noteapp/core/data/model/note.dart';
import 'package:noteapp/ui/login/screen/login_screen.dart';
import 'package:noteapp/ui/note/note_screen.dart';
import 'package:noteapp/ui/profile/edit_profile_screen.dart';
import 'package:noteapp/ui/register/screen/register_screen.dart';
import '../ui/menu_screen.dart';
import 'package:go_router/go_router.dart';
import 'splash/screen/splash_screen.dart';

var router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/menu',
    builder: (context, state) => const MenuScreen(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen()
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    path: '/profile/edit',
    builder: (context, state) => const EditProfileScreen(),
  ),
  GoRoute(
    path: '/note',
    name: 'note',
    builder: (context, state) {
      Note? note = state.extra != null ? state.extra as Note : null;
      return NoteScreen(
        note: note,
      );
    },
  )
]);

Widget get errorPage => const Center(
      child: SizedBox(
        width: 200,
        child: Text('Error, maybe you forgot to include required obj'),
      ),
    );
