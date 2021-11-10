class Filter {
  String keyword;
  int minPrice;
  int maxPrice;
  List<String> locations;

  bool isEmpty() {
    return keyword != null &&
        keyword.isNotEmpty &&
        minPrice != null &&
        minPrice > 0 &&
        maxPrice != null &&
        maxPrice > 0 &&
        maxPrice <= minPrice;
  }

  bool get isNotEmpty => !isEmpty();

  Filter({this.keyword, this.minPrice, this.maxPrice, this.locations});
}
