import 'package:first_app/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];

  CategoryModel categoryModel;

  // Pizza
  categoryModel = CategoryModel(
    name: "Pizza",
    image: "assets/images/pizza.png",
  );
  category.add(categoryModel);

  // Burger
  categoryModel = CategoryModel(
    name: "Burger",
    image: "assets/images/burger.png",
  );
  category.add(categoryModel);

  categoryModel = CategoryModel(
    name: "Chinese",
    image: "assets/images/tacos.png",
  );
  category.add(categoryModel);

  return category;
}
