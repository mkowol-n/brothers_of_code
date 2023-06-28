import 'package:brothers_of_code/core/state/request_state.dart';
import 'package:brothers_of_code/coreui/base_cross_fade.dart';
import 'package:brothers_of_code/coreui/screen_states/error_screen.dart';
import 'package:brothers_of_code/coreui/screen_states/loading_screen.dart';
import 'package:flutter/material.dart';

class FullScreenStateHandler<T> extends StatelessWidget {
  const FullScreenStateHandler({
    super.key,
    required this.state,
    required this.dataWidget,
    required this.onRetry,
  });

  final RequestState<T> state;
  final Widget Function(T) dataWidget;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return BaseCrossFade<RequestState<T>>(
      value: state,
      builder: (context, crossFadeState) {
        return crossFadeState.maybeWhen(
            data: (data) => SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: dataWidget(data),
                ),
            error: (_) => ErrorScreen(onRetry: onRetry),
            orElse: () => const LoadingScreen());
      },
    );
  }
}
