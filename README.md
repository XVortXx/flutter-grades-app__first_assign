# 🎓 Student Grade Tracker

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

A clean, responsive, and interactive Flutter mobile application designed for tracking student grades with real-time class average computation and native RTL (Right-to-Left) Hebrew typography support.

---

## 📱 App Preview

<p align="center">
  <img src="screenshots/app_screenshot.png" alt="Student Grade Tracker UI" width="300" style="border-radius: 16px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);"/>
</p>

---

## ✨ Features

- **⚡ Real-Time Average Calculation:** The overall class average recalculates dynamically whenever any student score changes.
- **🔄 Interactive Adjustment Controls:** Dedicated `+` and `-` buttons to adjust scores incrementally (clamped between `0` and `100`).
- **🎯 Visual Status Feedback:**
  - 🟢 **Green Badge:** Passing score ($\ge 56$)
  - 🔴 **Red Badge:** Failing score ($< 56$)
- **🌐 Native RTL Orientation:** Designed for Right-to-Left script layout with student labels, score details, and controls positioned accordingly.
- **🎨 Modern Aesthetic:** Minimalist Material 3 card accents, rounded controls, and clean typography.

---

## 🛠️ Tech Stack & Requirements

| Component | Specification |
| :--- | :--- |
| **Framework** | Flutter (Channel stable, 3.47+) |
| **Language** | Dart 3.13+ |
| **Target Platform** | Android, Web, Windows |
| **Design Guidelines** | Material 3 (RTL) |

---

## 🚀 Getting Started

Follow these steps to build and run the project locally.

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed and configured in your `PATH`.
- Android Studio / Android Emulator running an active virtual device.

### Local Setup

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/XVortXx/flutter-grades-app__first_assign.git](https://github.com/XVortXx/flutter-grades-app__first_assign.git)
   cd flutter-grades-app__first_assign
