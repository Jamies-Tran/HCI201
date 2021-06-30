class Ingredient {
  int id;
  String name;
  double quantity;
  double price;
  String unit;
  int foodId;

  Ingredient({this.id, this.foodId, this.name, this.quantity, this.price, this.unit});

  double total() => this.price * this.quantity;

  String outputQuantity() => "$quantity$unit";
}