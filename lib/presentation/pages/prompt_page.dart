import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/image_generator_bloc.dart';
import '../bloc/image_generator_event.dart';
import '../widgets/gradient_background.dart';
import '../widgets/app_header.dart';
import '../widgets/prompt_input_field.dart';
import '../widgets/generate_button.dart';

class PromptPage extends StatefulWidget {
  const PromptPage({super.key});

  @override
  State<PromptPage> createState() => _PromptPageState();
}

class _PromptPageState extends State<PromptPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _controller.text.trim().isNotEmpty;
    });
  }

  void _onGenerate() {
    final prompt = _controller.text.trim();
    if (prompt.isNotEmpty) {
      context.read<ImageGeneratorBloc>().add(GenerateImageEvent(prompt));
      context.push('/result');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const AppHeader(),
                const SizedBox(height: 48),
                PromptInputField(controller: _controller),
                const SizedBox(height: 24),
                GenerateButton(isEnabled: _isButtonEnabled, onPressed: _onGenerate),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
