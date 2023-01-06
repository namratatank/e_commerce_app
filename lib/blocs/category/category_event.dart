part of 'category_bloc.dart';

class CategoryEvent extends Equatable{
  const CategoryEvent();

  @override
  List<Object?> get props => [];

}

class LoadCategories extends CategoryEvent{
  @override
  List<Object?> get props => [];
}

class UpdateCategories extends CategoryEvent{
  final List<CategoryModel> categories;
  const UpdateCategories({required this.categories});
  @override
  List<Object?> get props => [];
}