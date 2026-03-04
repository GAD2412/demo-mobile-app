<div align="center">
  <h1>🌌 Nexus Wallet</h1>
  <p><i>A cutting-edge Web3 Crypto Wallet dashboard featuring a deep space dark theme, stunning glassmorphism effects, and butter-smooth native animations.</i></p>

  <!-- Badges -->
  <a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" /></a>
  <a href="https://dart.dev/"><img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" /></a>
  <a href="https://github.com/"><img src="https://img.shields.io/badge/Stars-Awesome-yellow?style=for-the-badge&logo=apache-spark" alt="Stars" /></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-success?style=for-the-badge" alt="License" /></a>
</div>

---

## 📸 Screenshots

| 🏠 Home Dashboard | 🗂️ 3D Slide-out Menu |
| :---: | :---: |
| ![Home Dashboard Placeholder](https://via.placeholder.com/250x500/121212/FFFFFF?text=Home+Screen) | ![3D Menu Placeholder](https://via.placeholder.com/250x500/121212/FFFFFF?text=3D+Drawer) |

> *(Replace these placeholder images with your actual spectacular app screenshots!)*

---

## ✨ Key Features

This application showcases the true power of Flutter's UI composition and animation engine.

*   **Custom 3D Slide-out Menu (`Swipe-to-open`):** An elegant, interactive drawer that opens with a 3D perspective effect, pushing the main screen aside to provide a premium navigation experience.
*   **Glassmorphism UI:** A luxurious frosted glass aesthetic. **Performance Optimized:** Uses `BackdropFilter` exclusively for static elements, whilst deploying smart gradient/opacity techniques for scrollable lists to guarantee maximum FPS.
*   **Smooth Native Animations:** Features continuous "breathing" animations for the balance card and satisfying "spring-back" tap physics on interactive elements, breathing life into the application.
*   **Lean State Management:** Completely free of heavy third-party state management libraries. Utilizes pure Dart `ValueNotifier` and Flutter's `ValueListenableBuilder` to precisely control the drawer state without superfluous widget tree rebuilds.
*   **Highly Responsive Design:** The UI automatically adapts based on `MediaQuery`. The drawer seamlessly calculates its dimensions (occupying up to 75% of screen width), fully responsive across both mobile and tablet form factors.
*   **Clean Architecture:** A well-structured, modularized, and maintainable codebase demonstrating enterprise-level software design principles within pure Flutter.

---

## 🛠 Tech Stack & Architecture

We believe in keeping things fast, simple, and dependency-free to illustrate the core capabilities of the framework.

*   **Framework:** [Flutter](https://flutter.dev/)
*   **Language:** [Dart](https://dart.dev/)
*   **State Management:** Built-in `ValueNotifier` & `ValueListenableBuilder` (Pure Flutter approach).
*   **Design Pattern:** Modular Feature-First Structure / Clean UI Architecture.
*   **External Packages:** None (100% Native Widgets & Animations).

---

## 📂 Folder Structure

Here's an overview of the modular codebase layout promoting high maintainability:

```text
lib/
 ├── constants/       # App-wide constants (App Colors, Text Styles, Theme data)
 ├── data/            # Mock data and local storage logic
 ├── models/          # Dart entity models (e.g., Crypto currency model)
 ├── screens/         # Main UI screens (Dashboard, 3D Canvas layout)
 ├── widgets/         # Reusable, modular UI components
 │    ├── glass_box.dart            # Optimized frosted glass widget
 │    ├── neon_border.dart          # Glowing neon accent borders
 │    ├── crypto_list_item.dart     # Cryptocurrency list tile
 │    ├── action_button.dart        # Reusable buttons with tap physics
 │    ├── pressable_widget.dart     # Core spring-back animation wrapper
 │    └── ... 
 └── main.dart        # Application entry point
```

---

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

Ensure you have the latest stable version of [Flutter SDK installed](https://docs.flutter.dev/get-started/install).

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/nexus-wallet.git
    ```

2.  **Navigate into the project folder:**
    ```bash
    cd nexus-wallet
    ```

3.  **Fetch the dependencies (although we mostly use pure Flutter, this resolves standard pubspec configs):**
    ```bash
    flutter pub get
    ```

4.  **Run the application:**
    ```bash
    flutter run
    ```

---

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project.
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`).
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the Branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

---

<div align="center">
  <p>Built with ❤️ using <strong>Flutter</strong>.</p>
</div>
