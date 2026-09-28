enum PropertyType { apartment, villa, plot, commercial }
enum SellerRole { owner, builder }

class UnitConfig {
  final String bhk;
  final double areaSqFt;
  final double price;
  final int totalUnits;

  UnitConfig({
    required this.bhk,
    required this.areaSqFt,
    required this.price,
    required this.totalUnits,
  });
}

class PropertyListing {
  final String id;
  final String title;
  final SellerRole sellerRole;
  final String sellerName;
  final String sellerContact;
  final String location;
  final String city;
  final double price;
  final double areaSqFt;
  final String bhk;
  final String description;
  final List<String> imageUrls;
  final double estimatedValuation;
  final double projected5YrAppreciation; // percentage
  final double suitabilityScore; // 0 - 100
  final bool isFlashAd;
  final String? discountTag;
  final int viewCount;
  final int leadCount;
  final Map<String, dynamic> geologicalRisks;
  final List<UnitConfig>? builderUnitConfigs;
  final List<String> legalDocs;

  PropertyListing({
    required this.id,
    required this.title,
    required this.sellerRole,
    required this.sellerName,
    required this.sellerContact,
    required this.location,
    required this.city,
    required this.price,
    required this.areaSqFt,
    required this.bhk,
    required this.description,
    required this.imageUrls,
    required this.estimatedValuation,
    required this.projected5YrAppreciation,
    required this.suitabilityScore,
    this.isFlashAd = false,
    this.discountTag,
    this.viewCount = 0,
    this.leadCount = 0,
    required this.geologicalRisks,
    this.builderUnitConfigs,
    required this.legalDocs,
  });
}
