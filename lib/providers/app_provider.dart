import 'package:flutter/foundation.dart';
import '../models/property.dart';
import '../models/user_role.dart';

class AppProvider with ChangeNotifier {
  UserRole _activeRole = UserRole.buyer;
  String _selectedCity = 'All Cities';
  String _searchQuery = '';
  
  UserRole get activeRole => _activeRole;
  String get selectedCity => _selectedCity;
  String get searchQuery => _searchQuery;

  final List<PropertyListing> _properties = [
    PropertyListing(
      id: 'prop_1',
      title: 'Skyline Grand 3BHK Eco-Residences',
      sellerRole: SellerRole.builder,
      sellerName: 'Apex Urban Developers',
      sellerContact: '+91 98765 43210',
      location: 'Whitefield, Bangalore',
      city: 'Bangalore',
      price: 13500000,
      areaSqFt: 1850,
      bhk: '3BHK',
      description: 'Luxury smart green 3BHK apartment with EV charging, rooftop infinity pool, top international schools within 1.5 km.',
      imageUrls: ['https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=800'],
      estimatedValuation: 14200000,
      projected5YrAppreciation: 42.5,
      suitabilityScore: 94.8,
      isFlashAd: true,
      discountTag: '5% Early Bird Discount before Nov 30',
      viewCount: 1420,
      leadCount: 88,
      geologicalRisks: {
        'seismicZone': 'Zone II (Low)',
        'floodRisk': 'Very Low (Elevated Plateau)',
        'airQualityIndex': 42,
        'groundwaterDepth': '140 ft',
      },
      builderUnitConfigs: [
        UnitConfig(bhk: '2BHK', areaSqFt: 1250, price: 9200000, totalUnits: 24),
        UnitConfig(bhk: '3BHK', areaSqFt: 1850, price: 13500000, totalUnits: 16),
      ],
      legalDocs: ['RERA_CERT_BGL_2026.pdf', 'TITLE_DEED_APEX.pdf'],
    ),
    PropertyListing(
      id: 'prop_2',
      title: 'Greenwoods Luxury Villa Compound',
      sellerRole: SellerRole.owner,
      sellerName: 'Rajesh Kumar (Owner)',
      sellerContact: '+91 91234 56789',
      location: 'Koregaon Park, Pune',
      city: 'Pune',
      price: 24000000,
      areaSqFt: 3100,
      bhk: '4BHK',
      description: 'Independent owner listing. Fully renovated Mediterranean style villa with private garden, solar grid, and Italian marble.',
      imageUrls: ['https://images.unsplash.com/photo-1613977257363-707ba9348227?w=800'],
      estimatedValuation: 25500000,
      projected5YrAppreciation: 38.0,
      suitabilityScore: 89.2,
      isFlashAd: false,
      discountTag: 'Direct Owner - Zero Brokerage',
      viewCount: 610,
      leadCount: 29,
      geologicalRisks: {
        'seismicZone': 'Zone III (Moderate)',
        'floodRisk': 'Low',
        'airQualityIndex': 38,
        'groundwaterDepth': '90 ft',
      },
      legalDocs: ['712_EXTRACT_PUNE.pdf', 'NOC_MUNICIPAL.pdf'],
    ),
  ];

  List<PropertyListing> get properties => _properties;

  void switchRole(UserRole newRole) {
    _activeRole = newRole;
    notifyListeners();
  }

  void setCityFilter(String city) {
    _selectedCity = city;
    notifyListeners();
  }

  void setSearchQuery(String q) {
    _searchQuery = q;
    notifyListeners();
  }
}
