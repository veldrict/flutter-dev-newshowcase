abstract class Routes {
  // Auth
  static const String main = '/';
  static const String login = '/login';
  static const String register = '/register';

  // Landing
  static const String landing = '/landing';
  static const String products = 'products';
  static const String productsDetail = ':productId';

  static const String productsCategories = 'categories';
  static const String category = ':categoryId';

  static const String wishList = 'wishlist';

  static const String feed = 'feed';

  static const String transaction = 'transaction';

  static const String officialStore = 'officialStore';

  static const String profile = '/profile';
  static const String newProfile = '/newProfile';
  static const String editProfile = 'editProfile';
  static const String cart = '/cart';
  static const String cartDetail = ':cardId';
}
