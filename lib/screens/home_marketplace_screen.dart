import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/user_role.dart';
import '../models/property.dart';
import '../services/telephony_masking_service.dart';
import '../services/document_security_service.dart';

class HomeMarketplaceScreen extends StatefulWidget {
  const HomeMarketplaceScreen({super.key});

  @override
  State<HomeMarketplaceScreen> createState() => _HomeMarketplaceScreenState();
}

class _HomeMarketplaceScreenState extends State<HomeMarketplaceScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TelephonyMaskingService _telephonyService = TelephonyMaskingService();
  final DocumentSecurityService _docService = DocumentSecurityService();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.auto_awesome, color: Color(0xFF6366F1)),
            SizedBox(width: 8),
            Text('EstatoCopilot AI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
        actions: [
          // Role Switching Popup Menu
          PopupMenuButton<UserRole>(
            initialValue: provider.activeRole,
            onSelected: (UserRole role) {
              provider.switchRole(role);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<UserRole>>[
              const PopupMenuItem<UserRole>(
                value: UserRole.buyer,
                child: Row(
                  children: [
                    Icon(Icons.person, color: Colors.indigo),
                    SizedBox(width: 8),
                    Text('Switch to Buyer'),
                  ],
                ),
              ),
              const PopupMenuItem<UserRole>(
                value: UserRole.owner,
                child: Row(
                  children: [
                    Icon(Icons.home, color: Colors.emerald),
                    SizedBox(width: 8),
                    Text('Switch to Owner'),
                  ],
                ),
              ),
              const PopupMenuItem<UserRole>(
                value: UserRole.builder,
                child: Row(
                  children: [
                    Icon(Icons.business, color: Colors.amber),
                    SizedBox(width: 8),
                    Text('Switch to Builder'),
                  ],
                ),
              ),
            ],
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF334155)),
              ),
              child: Row(
                children: [
                  Icon(
                    provider.activeRole == UserRole.buyer
                        ? Icons.person
                        : provider.activeRole == UserRole.owner
                            ? Icons.home
                            : Icons.business,
                    size: 16,
                    color: const Color(0xFF818CF8),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    provider.activeRole.name.toUpperCase(),
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              onChanged: (q) => provider.setSearchQuery(q),
              decoration: InputDecoration(
                hintText: 'Search with AI: "3BHK under 1.5 Cr in Whitefield"...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF818CF8)),
                filled: true,
                fillColor: const Color(0xFF0F172A),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFF334155)),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Banner Flash Ads
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E1B4B), Color(0xFF0F172A)],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF6366F1).withOpacity(0.4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text('FLASH DEAL', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10)),
                      ),
                      const SizedBox(width: 8),
                      const Text('5% Early Bird Discount before Nov 30', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('Skyline Grand 3BHK Eco-Residences', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const Text('Whitefield, Bangalore • ₹1.35 Cr', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Listing Grid Title
            Row(
              mainAxisAlignment: MainAxisAlignment.between,
              children: [
                const Text('Marketplace Listings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                Text('${provider.properties.length} Results', style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
              ],
            ),
            const SizedBox(height: 12),

            // Property Cards List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.properties.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final prop = provider.properties[index];
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFF1E293B)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          prop.imageUrls[0],
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.between,
                        children: [
                          Text('₹${(prop.price / 10000000).toStringAsFixed(2)} Cr', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.extrabold, color: Colors.white)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6366F1).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text('${prop.suitabilityScore}% Match', style: const TextStyle(color: Color(0xFF818CF8), fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(prop.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                      Text(prop.location, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                final session = await _telephonyService.initiateMaskedCall(
                                  buyerPhone: '+91 99000 11223',
                                  sellerPhone: prop.sellerContact,
                                );
                                if (context.mounted) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Masked Proxy Call'),
                                      content: Text('Proxy Line: ${session.proxyVirtualNumber}\nExpires in 30 minutes. Real numbers masked.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(Icons.call, size: 16),
                              label: const Text('Masked Call'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.emerald,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {
                                final docInfo = _docService.requestDocumentPreview(
                                  docName: prop.legalDocs[0],
                                  userId: 'USER_8891',
                                  userEmail: 'buyer@example.com',
                                );
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Legal Document Security Vault'),
                                    content: Text('Document: ${docInfo['docName']}\nWatermark: ${docInfo['watermarkOverlay']}\nDownloads Restricted.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Close Preview'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(Icons.security, size: 16),
                              label: const Text('Legal Docs'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.amber,
                                side: const BorderSide(color: Colors.amber),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
