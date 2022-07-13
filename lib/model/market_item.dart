//for representing a single company in market (used for showing item in market mover)
class MarketItem {
  String abbreviation;
  String name;
  String growth;
  String img;
  String value;
  String price;
  String shares;
  MarketItem(
      {this.abbreviation = '',
      this.name = '',
      this.growth = '',
      this.img = '',
      this.value = '',
      this.price = '',
      this.shares = ''});
}
