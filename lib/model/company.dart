//for representing a single company (used for showing item in watchlist)
class Company {
  String abbreviation;
  String name;
  String growth;
  String img;
  String value;
  String price;
  Company(
      {this.abbreviation = '',
      this.name = '',
      this.growth = '',
      this.img = '',
      this.value = '',
      this.price = ''});
}
