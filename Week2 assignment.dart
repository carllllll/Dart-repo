import 'dart:math';

void main(){
  //Initial shopping cart with prices
  List<double> cart = [5.0, 15.0, 30.0, 8.0, 50.0];
  //Step 1: Filter Items (remove items below $10 using an anonymous function)
  cart.removeWhere((item) => item < 10);
  print("Filtered cart: $cart");
  //Step 2: Apply Discount (higher-order function)
  List<double> applyDiscount(List<double> items, double discountPercent){
    return items.map((item) => item * (1- discountPercent / 100)).toList();
  }
  cart = applyDiscount(cart, 20); // 20% discount
  print("Cart after discount: $cart");
  //Step 3: Calculate Total with optional tax
  double calculateTotal(List<double> items, {double taxPercent = 0}){
    double subtotal = items.fold(0, (sum, item) => sum + item);
    return subtotal * (1 + taxPercent / 100);
  }
   double totalWithTax = calculateTotal(cart, taxPercent: 8); // 8% tax
  print("Total with Tax: \$${totalWithTax.toStringAsFixed(2)}");

  // Step 4: Factorial Discount (recursive function)
  int factorial(int n) => (n <= 1) ? 1 : n * factorial(n - 1);

  int itemCount = cart.length;
  int fact = factorial(itemCount);
  double extraDiscount = min(fact.toDouble(), 50); // Cap discount to 50%
  print("Factorial Discount (capped at 50%): $extraDiscount%");

  double finalTotal = totalWithTax * (1 - extraDiscount / 100);

  // Step 5: Display Final Price
  print("Final Price After All Discounts: \$${finalTotal.toStringAsFixed(2)}");
}