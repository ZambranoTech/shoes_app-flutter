import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoeProvider = StateNotifierProvider<ShoeNotifier, ShoeState>((ref) {
  return ShoeNotifier();
});


class ShoeNotifier extends StateNotifier<ShoeState> {
  ShoeNotifier(): super(ShoeState());

  void setSize(double size) {
    state = state.copyWith(
      selectedSize: size
    );
  }

  void setColor(String color) {
    state = state.copyWith(
      selectedColor: color
    );
  }
  
}

class ShoeState {
  final String selectedColor;
  final double selectedSize;

  ShoeState({
    this.selectedColor = 'assets/images/negro.png',
    this.selectedSize = 0,
  });

  ShoeState copyWith({
    String? selectedColor,
    double? selectedSize,
  }) {
    return ShoeState(
      selectedColor: selectedColor ?? this.selectedColor,
      selectedSize: selectedSize ?? this.selectedSize,
    );
  }
}
