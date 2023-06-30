import 'dart:ui';

import 'package:brothers_of_code/core/state/base_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

void stateTest<STATE, PROVIDER extends BaseStateNotifier>(
  String description, {
  required PROVIDER stateProvider,
  required Function(PROVIDER provider) act,
  required List<bool> Function(STATE state) expectedStates,
  required List<VoidCallback> when,
  required List<VoidCallback> verify,
}) =>
    test(
      description,
      () {
        int initialState = 0;
        expect(when.length, verify.length);

        for (var element in when) {
          element();
        }

        stateProvider.addListener((state) {
          expect(true, expectedStates(state)[initialState]);
          initialState++;
        });

        act(stateProvider);

        for (var element in verify) {
          element();
        }
      },
    );
