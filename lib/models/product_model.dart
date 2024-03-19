import '/models/product_data_model.dart';

class ProductModel {
  final String id;
  final String company;
  final String companyLogoUrl;

  final List<ProductDataModel> data;

  ProductModel({
    required this.id,
    required this.company,
    required this.companyLogoUrl,
    required this.data,
  });
}
