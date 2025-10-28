import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/image_generator_bloc.dart';
import '../bloc/image_generator_event.dart';
import '../bloc/image_generator_state.dart';
import '../widgets/loading_state_widget.dart';
import '../widgets/error_state_widget.dart';
import '../widgets/generated_image_card.dart';
import '../widgets/prompt_info_card.dart';
import '../widgets/result_actions_panel.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => context.pop()),
      ),
      body: BlocBuilder<ImageGeneratorBloc, ImageGeneratorState>(
        builder: (context, state) {
          if (state is ImageGeneratorLoading) {
            return const LoadingStateWidget();
          }

          if (state is ImageGeneratorError) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => context.read<ImageGeneratorBloc>().add(const RegenerateImageEvent()),
              onBackToPrompt: () => context.pop(),
            );
          }

          if (state is ImageGeneratorSuccess) {
            return _buildSuccessState(context, state);
          }

          return const LoadingStateWidget();
        },
      ),
    );
  }

  Widget _buildSuccessState(BuildContext context, ImageGeneratorSuccess state) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.scale(scale: 0.8 + (value * 0.2), child: child),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GeneratedImageCard(imageUrl: state.image.imageUrl),
                    const SizedBox(height: 24),
                    PromptInfoCard(prompt: state.image.prompt),
                  ],
                ),
              ),
            ),
          ),
          ResultActionsPanel(
            onTryAnother: () =>
                context.read<ImageGeneratorBloc>().add(const RegenerateImageEvent()),
            onNewPrompt: () => context.pop(),
          ),
        ],
      ),
    );
  }
}
