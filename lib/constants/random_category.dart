import 'dart:math';

final categoryList = [
  'backgrounds',
  'fashion',
  'nature',
  'science',
  'education',
  'feelings',
  'health',
  'people',
  'religion',
  'places',
  'animals',
  'industry',
  'computer',
  'food',
  'sports',
  'transportation',
  'travel',
  'buildings',
  'business',
  'music'
];
final Random random = Random();

class RandomCategory {
  var elementRandom = categoryList[random.nextInt(categoryList.length)];
}
