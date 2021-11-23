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
  static const String profile = 'profile';
  static const String cart = '/cart';
  static const String cartDetail = ':cardId';
}
