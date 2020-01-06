import 'package:flutter/widgets.dart';

class Picons {
  Picons._();

  static const _kFontFam = 'Picons';
  static const _kFontGift = 'Gift';
  static const _kFontFavHeart = 'FavoriteHeartButton';
  static const _kFontHeart = 'favoriteHeart';

  static const IconData heart = const IconData(0xe801, fontFamily: _kFontHeart);
  static const IconData gift = const IconData(0xe800, fontFamily: _kFontGift);
  static const IconData plain_gift = const IconData(0xe803, fontFamily: _kFontFam);
  static const IconData favorite_heart_button = const IconData(0xe802, fontFamily: _kFontFavHeart);
}
