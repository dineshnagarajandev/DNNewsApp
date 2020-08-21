import 'package:DNNewsApp/models/category_model.dart';
import 'package:flutter/material.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

// 0
  categoryModel.categoryName = "Top Headlines";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1585829365295-ab7cd400c167?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80";
  category.add(categoryModel);

  //1
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80";
  category.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  category.add(categoryModel);

  //6
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  //7
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  return category;
}

List<CountryModel> getCounties() {
  List<CountryModel> countries = new List<CountryModel>();
  CountryModel country = new CountryModel();

  country.countryCode = 0;
  country.countryName = "India";
  country.codeForAPI = "in";
  country.countryImage = Image.asset(
    'icons/flags/png/in.png',
    package: 'country_icons',
    width: 30,
    height: 30,
  );
  countries.add(country);

  country = new CountryModel();
  country.countryCode = 1;
  country.countryName = "United States";
  country.codeForAPI = "us";
  country.countryImage = Image.asset(
    'icons/flags/png/us.png',
    package: 'country_icons',
    width: 30,
    height: 30,
  );
  countries.add(country);

  country = new CountryModel();
  country.countryCode = 2;
  country.countryName = "China";
  country.codeForAPI = "cn";
  country.countryImage = Image.asset(
    'icons/flags/png/cn.png',
    package: 'country_icons',
    width: 30,
    height: 30,
  );
  countries.add(country);

  return countries;
}
