import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  final int qty;
  const CartItem({required this.id, required this.name, required this.price, required this.qty});

  CartItem copyWith({int? qty}) => CartItem(
        id: id,
        name: name,
        price: price,
        qty: qty ?? this.qty,
      );
}

class CartState {
  final Map<String, CartItem> items;
  const CartState({this.items = const {}});
}

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState());

  void addItem(CartItem item) {
    final existing = state.items[item.id];
    final updated = {
      ...state.items,
      item.id: existing == null
          ? item
          : existing.copyWith(qty: existing.qty + item.qty),
    };
    state = CartState(items: updated);
  }

  void removeItem(String id) {
    final copy = Map<String, CartItem>.from(state.items)..remove(id);
    state = CartState(items: copy);
  }

  void setQty(String id, int qty) {
    final existing = state.items[id];
    if (existing == null) return;
    if (qty <= 0) {
      removeItem(id);
    } else {
      state = CartState(items: {
        ...state.items,
        id: existing.copyWith(qty: qty),
      });
    }
  }

  void clear() => state = const CartState();
}

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

final cartTotalCountProvider = Provider<int>((ref) {
  final items = ref.watch(cartProvider).items.values;
  return items.fold(0, (sum, i) => sum + i.qty);
});

final cartTotalPriceProvider = Provider<double>((ref) {
  final items = ref.watch(cartProvider).items.values;
  return items.fold(0.0, (sum, i) => sum + i.price * i.qty);
});
