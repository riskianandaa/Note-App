import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/core/utils/theme_extension.dart';
import 'package:noteapp/core/widgets/app_button.dart';
import 'package:noteapp/core/widgets/app_colors.dart';
import 'package:noteapp/core/widgets/app_textfield.dart';
import 'package:noteapp/core/widgets/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 200.w,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40)),
                  color: AppColors.green),
                  child: Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Notes",
                          style: context.textTheme.headline5?.copyWith(color: Colors.white),
                        ),
                        Text(
                          "Please login with your email and passsword",
                          style: context.textTheme.headline6?.copyWith(color: Colors.white, fontSize: 14),
                        )
                      ],
                    ),
                  ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: const AppTextField(
                title: 'Email',
                hint: 'Input your email',
                keyboardType: TextInputType.emailAddress,
                textHintColor: AppColors.textGray,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: const AppTextField(
                title: 'Password', 
                hint: 'Input your password',
                obscure: true,
                textHintColor: AppColors.textGray,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 100.h, bottom: 24.w),
              child: AppButton(
                onPressed: () => context.push('/menu'),
                caption: 'Login',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: AppButton(
                onPressed: () => context.push('/register'),
                caption: 'Register',
                color: Colors.white,
                textStyle: context.textTheme.bodyText1?.copyWith(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
