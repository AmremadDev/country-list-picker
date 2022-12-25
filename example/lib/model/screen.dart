import 'package:country_list_picker_example/model/category.dart';
import 'package:country_list_picker_example/widget/expansion_tile.dart';

class Screen {
  final String title;
  final List<Category>? categories;

  Screen({
    required this.title,
    this.categories,
  });
}
