import 'dart:developer';

import 'package:authorization/common/constants/global_app_color.dart';
import 'package:authorization/common/constants/global_text_constant.dart';
import 'package:authorization/common/widgets/common_button.dart';
import 'package:authorization/common/widgets/common_divider.dart';
import 'package:authorization/common/widgets/common_place_holders.dart';
import 'package:authorization/common/widgets/common_text_field.dart';
import 'package:authorization/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final TextEditingController loginTextController;
  late final TextEditingController passwordTextController;
  String errorText = '';

  @override
  void initState() {
    loginTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthCubit _cubit = context.read<AuthCubit>();
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xffF3F4F6),
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          GlobalTextConstant.authorization,
        ),
      ),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
              success: (user) => null,
              error: (errorText) {
                setState(() {
                  log(errorText);
                  this.errorText = errorText;
                });
              },
              orElse: () => null);
        },
        builder: (context, state) {
          return state.maybeWhen(common: () {
            return Column(
              children: [
                const HBox(312),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: GlobalAppColor.whiteColor,
                  child: Column(
                    children: [
                      CommonTextField(
                        textEditingController: loginTextController,
                        hintText: GlobalTextConstant.email,
                        onChanged: (value) {
                          setState(() {
                            errorText = '';
                          });
                        },
                      ),
                      const HBox(9),
                      const CommonDivider(),
                      const HBox(9),
                      CommonTextField(
                        textEditingController: passwordTextController,
                        hintText: GlobalTextConstant.password,
                        onChanged: (value) {
                          setState(() {
                            errorText = '';
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const HBox(12),
                Text(
                  errorText,
                  style: const TextStyle(color: GlobalAppColor.redColor),
                ),
                const HBox(12),
                CommonButton(
                  text: GlobalTextConstant.login,
                  onTap: () => _cubit.makeLogIn(
                    loginTextController.text,
                    passwordTextController.text,
                  ),
                ),
                const HBox(19),
                CommonButton(
                  text: GlobalTextConstant.signup,
                  onTap: () => null,
                ),
              ],
            );
          }, orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    loginTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
}
