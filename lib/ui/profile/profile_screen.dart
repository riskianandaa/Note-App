import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:noteapp/core/data/model/user.dart';
import 'package:noteapp/core/utils/status.dart';
import 'package:noteapp/core/utils/translation.dart';
import 'package:noteapp/core/widgets/app_colors.dart';
import 'package:noteapp/core/widgets/app_theme.dart';
import 'package:noteapp/gen/assets.gen.dart';
import 'package:noteapp/ui/bloc/main_bloc.dart';
import 'package:noteapp/ui/profile/widget/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User user = const User();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        if (state is LogoutResultState && state.status == Status.success) {
          context.go('/login');
        }
      },
      builder: (context, state) {
        if (state is LoginResultState) {
          if (state.status == Status.success) {
            user = state.data!;
          }
          if (state.status == Status.error) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.text.label_error_get_user)));
          }
        }
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              centerTitle: false,
              title: Text(context.text.menu_profile),
            ),
            body: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                vertical: 70,
                horizontal: 24,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: user.photo == null
                        ? Assets.images.icUser.image() as ImageProvider
                        : NetworkImage(user.photo!),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    user.name == null
                        ? context.text.label_username
                        : user.name!,
                    style: AppTheme().textTheme.subtitle1,
                  ),
                  Text(
                    user.email == null ? context.text.label_email : user.email!,
                    style: AppTheme()
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontSize: 12, color: AppColors.textGray),
                  ),
                  const SizedBox(
                    height: 58,
                  ),
                  CustomButton(
                    onClick: () => context.push('/profile/edit'),
                    title: context.text.menu_edit_profile,
                    icon: const Icon(
                      Icons.person,
                      color: AppColors.textGray,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    onClick: () {
                      BlocProvider.of<MainBloc>(context).add(const Logout());
                    },
                    title: context.text.label_logout,
                    color: Colors.red,
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
