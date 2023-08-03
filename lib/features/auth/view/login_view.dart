import 'package:twitter_clone/features/auth/view/view.dart';

class LoginView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) {
          return const LoginView();
        },
      );
  const LoginView({super.key});
  @override
  ConsumerState createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final appbar = AppBarContant.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onLogin() {
    ref.read(authControllerProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isLoading
          ? const Loader()
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      AuthFiled(
                        hintText: "Email",
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      AuthFiled(
                        hintText: "Password",
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: RoundedSmallButton(
                          label: "Done",
                          onTap: onLogin,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomRichText(
                        onTitleTap: () {
                          Navigator.pushReplacement(
                              context, SignUpView.route());
                        },
                        text: "Dont't have an account? ",
                        title: "Sign up",
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
