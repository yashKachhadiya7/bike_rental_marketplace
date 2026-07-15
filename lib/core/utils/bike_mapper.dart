class BikeMapper {
  BikeMapper._();

  static const List<String> bikeNames = [
    'Royal Enfield Classic 350',
    'KTM Duke 390',
    'Yamaha R15',
    'Honda CB350',
    'TVS Apache RTR 200',
    'Bajaj Pulsar NS200',
    'Suzuki Gixxer SF',
    'Jawa 42',
    'Hero Xpulse 200',
    'BMW G310R',
  ];

  static String getBikeName(int productId) {
    return bikeNames[(productId - 1) % bikeNames.length];
  }

  static bool isAvailable(int productId) {
    return productId.isOdd;
  }
}