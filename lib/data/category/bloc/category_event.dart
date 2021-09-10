part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetCategories extends CategoryEvent {
  @override
  List<Object> get props => [];
}

class CreateCategory extends CategoryEvent {
  final Category category;

  CreateCategory(this.category);
  @override
  List<Object> get props => [category];
}
