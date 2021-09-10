import 'package:quiz_proj/data/category/model/category.dart';
import 'package:quiz_proj/data/category/source/category_source.dart';

class CategoryRepository {
  final CategorySource categorySource;

  CategoryRepository(this.categorySource);
  Future<List<Category>> getCategories() async {
    print("reached here");
    return await categorySource.getCategories();
  }

  Future<Category> createCategory(Category category) async {
    print("reached creating category");
    return await categorySource.createCategory(category);
  }
}
