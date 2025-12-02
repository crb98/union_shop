import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  late final FocusNode _emailFocus;

  @override
  void initState() {
    super.initState();
    _emailController.text = 'Email';
    _emailFocus = FocusNode();
    _emailFocus.addListener(() {
      if (_emailFocus.hasFocus) {
        if (_emailController.text == 'Email') {
          setState(() => _emailController.clear());
        }
      } else {
        if (_emailController.text.isEmpty) {
          setState(() => _emailController.text = 'Email');
        }
      }
    });
  }

  @override
  void dispose() {
    _emailFocus.removeListener(() {});
    _emailFocus.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool get _isPlaceholder => _emailController.text == 'Email';

  @override
  Widget build(BuildContext context) {
    final double squareSize = MediaQuery.of(context).size.width > 480
        ? 420
        : MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: squareSize,
          height: squareSize,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 16,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              children: [                Image.network(
                  'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                  height: 72,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 72,
                      child: Center(
                          child:
                              Icon(Icons.image_not_supported, color: Colors.grey)),
                    );
                  },
                ),
                const SizedBox(height: 18),

                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _emailController,
                          focusNode: _emailFocus,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              color: _isPlaceholder ? Colors.grey : Colors.black87),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/', (route) => false);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            child: const Text(
                              'Continue',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
