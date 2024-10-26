class SelectedServiceData {
  String name;
  String duration;
  String price;

  SelectedServiceData(
      {required this.name, required this.duration, required this.price});

  SelectedServiceData.empty(
      {this.name = '', this.duration = '', this.price = ''});
}
