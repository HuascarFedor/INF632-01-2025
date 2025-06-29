import 'package:flutter/material.dart';

mixin ScrollToLastItemMixin<T extends StatefulWidget> on State<T> {
  ScrollController get scrollController;
  void scrollToLastItem() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        final position = scrollController.position.maxScrollExtent;
        scrollController.animateTo(
          position,
          duration: const Duration(microseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
