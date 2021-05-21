class Food {
  final String imageAsset;
  final String name;
  final double price;

  Food({
    this.imageAsset,
    this.name,
    this.price,
  });
}

class BuonoFood{
  static List<Food> buonoList = [
  Food(imageAsset: 'assets/images/NewyorkPizza.jpg', name: 'New york Pizza', price: 98900),
  Food(imageAsset: 'assets/images/chickenAlfredoPizza.jpg', name: 'Chicken Alfredo Pizza', price: 77900),
  Food(imageAsset: 'assets/images/noPic.jpg', name: 'Sprite', price: 7100),
  Food(imageAsset: 'assets/images/noPic.jpg', name: 'Cola', price: 7100),
  ];

}