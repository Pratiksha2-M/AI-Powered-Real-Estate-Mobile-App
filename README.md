# 🏠 AI-Powered Real Estate Mobile App

A cross-platform mobile marketplace application built with **Flutter (Dart)** and an **Interactive Web App Preview (React + Vite + Tailwind CSS)**. 

The application connects **Owners**, **Builders**, and **Buyers** under a single account system with dynamic role-switching, AI valuation engines, multi-property Ask AI comparative reasoning, Uber-style telephony call masking, watermarked legal document protection, and real-time builder analytics.

---

## 🌟 Key Features

### 1. 🔄 Unified Account & Dynamic Role Switching
- **Single Sign-On**: Users sign up once and seamlessly toggle between **Buyer ⇄ Owner ⇄ Builder** roles from their profile.
- **Context-Aware Dashboard**: Role switching dynamically updates available screens, onboarding wizards, analytics, and privacy actions without re-authenticating.

### 2. 📝 Structured Multi-Role Onboarding Flows
- **Owner Onboarding (8 Steps)**:
  1. Contact Details
  2. Duration of Ownership
  3. Selling Price & Terms
  4. Photo/Video Media Uploader
  5. Building Age & Location
  6. Surrounding Area & Connectivity Details
  7. Legal Document Vault Upload
  8. Review & Publish Listing
- **Builder Onboarding (8 Steps)**:
  1. Developer Company Details
  2. Project Schemes Offered
  3. Unit Configurations Matrix (`1BHK`, `2BHK`, `3BHK` with sqft and pricing)
  4. Masterplan Location
  5. RERA & Business Registration
  6. Renders & 3D Walkthrough Gallery
  7. Infrastructure & Connectivity Highlights
  8. Review & Publish Project Scheme
- **Buyer Onboarding (5 Steps)**:
  1. Profile Basics
  2. Budget Range Selector
  3. Location/City Filter
  4. Preferred BHK Configuration
  5. Personalized Feed Initialization

### 3. 🤖 AI Engine Layer
- **AI Natural Language & Voice Search**: Semantic search bar parsing queries like *"3BHK under 1.5 Cr in Whitefield near top schools"* with voice input support.
- **AI Property Valuation & 5-Year Growth Forecast**: Fair market value estimator and 5-year capital appreciation projection curve powered by local infrastructure signals.
- **Ask AI Property Comparison**: Side-by-side comparative analysis of live listings calculating a **Unified Property Suitability Score (0-100%)**, *"Why Choose / Why Not"* reasoning, and environmental & geological risk profiles (seismic zone, flood risk, AQI, groundwater table).
- **Persistent AI Property Assistant**: Floating chat widget providing context-specific answers on maintenance costs, Vastu compliance, and renovation ideas.

### 4. 🛡️ Privacy, Safety & Telephony Call Masking
- **Uber-Style Call Masking**: Generates temporary virtual proxy numbers (e.g. `+1 (888) 555-XXXX`) for buyer-seller contacts with 30-minute expiring sessions to keep real phone numbers private.
- **Encrypted Legal Document Protection**: Uploaded title deeds, RERA registrations, and tax receipts are protected by **dynamic watermarking canvas previewers** (`CONFIDENTIAL • VERIFIED BUYER PREVIEW ONLY`), disabling direct downloading, and logging audit access trails.

### 5. ⚡ Flash Ads & Builder Analytics
- **Flash Ads Carousel**: Rotating sponsored builder project banners featuring custom countdown timers and discount badges (*"5% Early Bird Discount before Nov 30"*).
- **Builder Engagement Dashboard**: Aggregated anonymized view counts, buyer intent reactions, call requests, and bookmark metrics.

---

## 🏗️ Tech Stack

- **Mobile Framework**: Flutter (Dart) — Cross-platform Android + iOS from one codebase
- **Web App Preview**: React 19, Vite, Tailwind CSS v4, Lucide Icons, Recharts
- **State Management**: Provider (Flutter) / React Context
- **Design System**: Dark Mode, Glassmorphism, Responsive Mobile Frame

---

## 📁 Repository Structure

```
.
├── lib/                             # Complete Flutter (Dart) Mobile Application
│   ├── main.dart                    # App Entry Point & Theme Setup
│   ├── models/                      # Property, UserRole, & AI Analysis Models
│   ├── providers/                   # App State Provider
│   ├── services/                    # AIService, TelephonyMaskingService, DocumentSecurityService
│   └── screens/                     # Home, Onboarding Wizards, AI Valuation, & Compare Screens
├── src/                             # Interactive Web App Preview
│   ├── components/                  # Header, FlashAdCarousel, PropertyCard, AI Modals, WatermarkViewer
│   ├── data/                        # Mock Property Dataset & RERA Records
│   ├── App.jsx                      # Main Web Application Component
│   ├── main.jsx                     # Web Entry Point
│   └── index.css                    # Tailwind CSS & Glassmorphism Utilities
├── pubspec.yaml                     # Flutter Dependencies Manifest
├── package.json                     # Node / Vite Web Dependencies
└── vite.config.js                   # Vite Configuration
```

---

## 🚀 Running the Project

### Option A: Interactive Web App Preview
1. Clone the repository:
   ```bash
   git clone https://github.com/Pratiksha2-M/AI-Powered-Real-Estate-Mobile-App.git
   cd AI-Powered-Real-Estate-Mobile-App
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Launch the development server:
   ```bash
   npm run dev
   ```
4. Open `http://localhost:3000` in your browser.

### Option B: Flutter Mobile App (Android / iOS)
1. Ensure Flutter SDK is installed.
2. Run pub get:
   ```bash
   flutter pub get
   ```
3. Run on device or emulator:
   ```bash
   flutter run
   ```

---

## 📜 License
This project is licensed under the MIT License.
