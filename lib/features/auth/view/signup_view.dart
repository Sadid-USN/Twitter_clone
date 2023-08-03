import 'package:twitter_clone/features/auth/view/view.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) {
          return const SignUpView();
        },
      );
  const SignUpView({super.key});
  @override
  ConsumerState createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appbar = AppBarContant.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signUp(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isloading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isloading
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
                          onTap: onSignUp,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                       CustomRichText(
                        
                        onTitleTap: () {
                         Navigator.pushReplacement(context,  LoginView.route());
                        },
                        
                       
                        text: "Already have an account? ",
                        title: "Login",
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
