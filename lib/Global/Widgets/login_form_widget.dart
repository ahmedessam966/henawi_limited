import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:henawi_limited/Global/Widgets/global_loader_animation.dart';
import 'package:henawi_limited/Modules/Sales/Managers/Screens/sales_manager_screen.dart';
import '../Controllers/login_index.dart';
import 'package:henawi_limited/providers.dart';
import 'package:provider/provider.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<LoginScreenControllers, AuthenticationServices>(
        builder: (context, loginProvider, authProvider, _) {
      return SizedBox(
        width: 700,
        height: 500,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Form(
            key: loginProvider.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Henawi Limited | Administrator Panel', style: Theme.of(context).textTheme.titleMedium),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Builder(builder: (context) {
                      return Text(
                          "Sign In | Logging in as: ${authProvider.isAdmin ? 'System Admin' : 'Staff User'}",
                          style: Theme.of(context).textTheme.titleLarge);
                    }),
                    ElevatedButton(
                      onPressed: () {
                        authProvider.setAdminLoginFeature();
                      },
                      child: Text(
                        authProvider.isAdmin ? 'Staff Mode' : 'Admin Mode',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                Text('Email Address/Username', style: Theme.of(context).textTheme.headlineSmall),
                TextFormField(
                  controller: loginProvider.emailController,
                  autofocus: true,
                  validator: (value) => InputValidationServices.validateEmail(email: value),
                  style: Theme.of(context).textTheme.displaySmall,
                  cursorColor: Theme.of(context).textTheme.titleLarge?.color,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail_rounded,
                    ),
                  ),
                ),

                ////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////////////////////////////

                const Spacer(),

                ////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////////////////////////////

                Text('Password', style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    controller: loginProvider.passController,
                    validator: (value) => InputValidationServices.validatePassword(password: value),
                    style: Theme.of(context).textTheme.displaySmall,
                    cursorColor: Theme.of(context).textTheme.titleLarge?.color,
                    obscureText: loginProvider.isObscure,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_person_rounded,
                      ),
                      suffix: loginProvider.isObscure
                          ? TextButton(
                              onPressed: () {
                                loginProvider.obscureText();
                              },
                              child: Text(
                                'Show',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                loginProvider.obscureText();
                              },
                              child: Text(
                                'Hide',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                    ),
                  ),
                ),

                ////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////////////////////////////
                const Spacer(),
                ////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////////////////////////////

                loginProvider.isLoading
                    ? SpinKitThreeBounce(
                        color: Theme.of(context).textTheme.titleLarge?.color,
                        size: 30,
                      )
                    : SizedBox(
                        width: 700,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (loginProvider.loginFormKey.currentState!.validate()) {
                              loginProvider.setLoading(true);
                              if (authProvider.isAdmin) {
                                await authProvider
                                    .adminLoginUsingEmail(
                                        loginProvider.emailController.text, loginProvider.passController.text)
                                    .then((value) {
                                  loginProvider.setLoading(false);
                                  LoginExceptionControllers.handleIncomingStatusCode(value, context)
                                      .then((value) {
                                    if (value == true) {
                                      Navigator.pushReplacement(
                                        context,
                                        RoutingTransitionServices.Transition(
                                          const SalesManagerScreen(
                                            initialViewIndex: 0,
                                          ),
                                        ),
                                      );
                                    }
                                  });
                                });
                              } else {
                                await authProvider
                                    .loginUsingEmail(
                                        loginProvider.emailController.text, loginProvider.passController.text)
                                    .then((value) {
                                  loginProvider.setLoading(false);
                                  LoginExceptionControllers.handleIncomingStatusCode(value, context)
                                      .then((value) {
                                    loginProvider.passController.clear();
                                    if (value == true) {
                                      GlobalLoaderAnimation.showProgressiveTransition(context);
                                      Future.delayed(
                                        const Duration(seconds: 5),
                                      ).whenComplete(
                                        () => Provider.of<InterfaceIdentifierServices>(context, listen: false)
                                            .handleInterfacePerPosition(
                                                context, authProvider.currentUserModel),
                                      );
                                    }
                                  });
                                });
                              }
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),

                ////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////////////////////////////

                const SizedBox(
                  height: 15,
                ),

                ////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////////////////////////////

                SizedBox(
                  width: 700,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Reset Password', style: Theme.of(context).textTheme.labelMedium),
                  ),
                ),

                ////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////////////////////////////

                const SizedBox(
                  height: 15,
                ),

                ////////////////////////////////////////////////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////////////////////////////////////////////////

                SizedBox(
                  width: 700,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        RoutingTransitionServices.Transition(
                          const SizedBox(),
                        ),
                      );
                    },
                    child: Text(
                      'Request New User Access',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
