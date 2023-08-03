import 'package:twitter_clone/features/auth/widgets/widgets.dart';

//! 47:00
class CustomRichText extends StatelessWidget {
  final String text;
  final String title;
  final VoidCallback onTitleTap; // Define a callback function to handle the tap

  const CustomRichText({
    Key? key,
    required this.text,
    required this.title,
    required this.onTitleTap, // Pass the callback function as a parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Pallete.blueColor,
              fontSize: 16,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = onTitleTap, 
          ),
        ],
      ),
    );
  }
}
