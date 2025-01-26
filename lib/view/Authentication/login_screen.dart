import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trucktech_automobiles/view/HomePage/home_screen.dart';
import 'package:trucktech_automobiles/viewModel/auth_provider.dart';

import '../../utlis/assets/app_colors.dart';
import '../../utlis/widgets/CommonButton.dart';
import '../../utlis/widgets/CommonPasswordField.dart';
import '../../utlis/widgets/CommonTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.06),

              /// App Heading Section
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontFamily: 'Lato',
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    margin: EdgeInsets.only(left: 14, right: width / 28),
                    decoration: BoxDecoration(
                      color: AppColor.itemsColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.04),

              /// App Heading
              const Text(
                'Trucktech',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
              SizedBox(height: height * 0.1),

              /// Login Container
              Container(
                width: width,
                height: height,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      AppColor.secondaryColor,
                      AppColor.primaryColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.02),

                    /// Login heading
                    const Text(
                      'Welcome back ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                    ),
                    SizedBox(height: height * 0.01),

                    /// Tabs system
                    Container(
                      width: double.infinity,
                      height: 80,
                      margin: EdgeInsets.only(top: 16, bottom: 16),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withAlpha(20),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                authProvider.setTabIndex(0);
                              },
                              child:
                                  tabForUserType(tabName: 'Admin', index: 0)),
                          InkWell(
                              onTap: () {
                                authProvider.setTabIndex(1);
                              },
                              child: tabForUserType(
                                  tabName: 'Supervisor', index: 1)),
                          InkWell(
                              onTap: () {
                                authProvider.setTabIndex(2);
                              },
                              child: tabForUserType(
                                  tabName: 'Mechanic', index: 2)),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.01),

                    /// Email Textfield
                    CommonTextField(
                      controller: _emailController,
                      labelText: 'Email or phone number',
                      hintText: 'Enter your email or phone number...',
                    ),
                    SizedBox(height: height * 0.02),

                    /// Password TextField
                    const CommonPasswordField(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                    SizedBox(height: height * 0.04),

                    /// Login Button
                    Consumer<AuthProvider>(builder: (context, value, child) {
                      return authProvider.isAuthenticated
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : CommonButton(
                              width: width / 1,
                              height: height * 0.06,
                              buttonText: 'Sign in',
                              onTap: () {
                                authProvider.login(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              },
                            );
                    }),
                    SizedBox(height: height * 0.03),

                    /// Forgot your password
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: AppColor.textColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.04),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Tab widegt
  Widget tabForUserType({required String tabName, required int index}) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        debugPrint('My index is: ${authProvider.tabIndex}');
        final isSelected = authProvider.tabIndex == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.secondaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
          ),
          child: AnimatedScale(
            scale: isSelected ? 1.1 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: Text(
              tabName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'RobotoCondensed',
              ),
            ),
          ),
        );
      },
    );
  }
}
