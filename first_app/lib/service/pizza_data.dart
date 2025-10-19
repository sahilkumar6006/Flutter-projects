import 'package:first_app/model/piza_model.dart';

List<PizaModel> getPizzaList() {
  return [
    PizaModel(name: "Pizza", image: "assets/images/pizza.png", price: "12.99"),
    PizaModel(
      name: "Burger",
      image: "assets/images/pizza1.png",
      price: "10.99",
    ),
    PizaModel(
      name: "Chinese",
      image: "assets/images/pizza2.png",
      price: "14.49",
    ),
    PizaModel(name: "Tacos", image: "assets/images/pizza3.png", price: "9.99"),
  ];
}
