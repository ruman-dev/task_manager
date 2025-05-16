import 'package:task_manager/core/utils/exports/exports.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomInputField(
                  controller: _loginController.emailController,
                  headerTitle: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  formValidator: (value) => Validation.validateEmail(value),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => CustomInputField(
                    headerTitle: 'Password',
                    controller: _loginController.passController,
                    hintText: 'Enter your password',
                    isObsecure: _loginController.isShowPassIcon.value,
                    prefixIcon: Icons.lock_outline,
                    formValidator:
                        (value) => Validation.validatePassword(value),

                    suffixWidget:
                        _loginController.isShowPassIcon.value
                            ? GestureDetector(
                              onTap: () {
                                _loginController.togglePasswordVisibility();
                              },
                              child: Icon(Icons.visibility_off),
                            )
                            : GestureDetector(
                              onTap: () {
                                _loginController.togglePasswordVisibility();
                              },
                              child: Icon(Icons.visibility),
                            ),
                  ),
                ),

                const SizedBox(height: 15),
                const SizedBox(height: 20),
                Obx(() {
                  return _loginController.isLoading.value
                      ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                      : CustomButton(
                        text: 'Sign In',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _loginController.loginProcess();
                          }
                        },
                      );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
