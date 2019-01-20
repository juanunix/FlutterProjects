class CategoriesModel{
  final String name;
  final String image;

  CategoriesModel(this.name, this.image);

  static List<CategoriesModel> getCategoriesList(){
    List<CategoriesModel> list=new List<CategoriesModel>();
    list.add(CategoriesModel("Man", 'https://previews.123rf.com/images/alexyakimvski/alexyakimvski1704/alexyakimvski170400050/75838319-male-model-in-a-suit-posing-in-front-of-a-wooden-wall.jpg'));
    list.add(CategoriesModel('Woman', 'https://media.gettyimages.com/photos/beautiful-woman-with-makeup-picture-id901642956'));
    list.add(CategoriesModel('Kids', 'https://images.pexels.com/photos/1534125/pexels-photo-1534125.jpeg?cs=srgb&dl=adorable-beautiful-blur-1534125.jpg&fm=jpg'));
    return list;
  }
}