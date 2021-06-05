class Food {
  String id;
  String name;
  List<String> receiptList;

  Food({this.id, this.name, this.receiptList});

  String getId() {
    return this.id;
  }

  void setId(String id) {
    this.id = id;
  }

  String getName() {
    return this.name;
  }

  void setName(String name) {
    this.name = name;
  }

  List<String> getReceiptList() {
    return this.receiptList;
  }

  void setReceiptList(List<String> receiptList) {
    this.receiptList = receiptList;
  }

}