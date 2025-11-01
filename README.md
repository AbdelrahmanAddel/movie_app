# 🎬 Movie App

A modern Flutter application that fetches and displays popular movies from The Movie Database (TMDB) API with offline caching capabilities and a beautiful, responsive UI.

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 📱 Project Overview

Movie App is a full-featured mobile application built with Flutter that demonstrates clean architecture principles, proper state management, and offline-first approach. The app fetches movie data from TMDB API, caches it locally using Hive, and provides a seamless user experience even without internet connectivity.

## ✨ Features

- **Popular Movies Feed**: Browse through trending and popular movies with infinite scroll
- **Movie Details**: View comprehensive information including overview, release date, and popularity ratings
- **Offline Support**: Automatically caches movies for offline viewing
- **Smart Connectivity Handling**: Detects network changes and syncs data when connection is restored
- **Dark/Light Theme**: Toggle between dark and light modes for comfortable viewing
- **Pull to Refresh**: Refresh movie list with a simple pull-down gesture
- **Image Caching**: Efficient image loading and caching for better performance
- **Error Handling**: Robust error handling with user-friendly messages

## 🛠️ Tech Stack

### Core Technologies
- **Flutter 3.0+** - UI framework
- **Dart 3.0+** - Programming language

### State Management & Architecture
- **BLoC/Cubit** - State management pattern
- **GetIt** - Dependency injection

### Networking
- **Dio** - HTTP client for API requests
- **Retrofit** - Type-safe REST client
- **Connectivity Plus** - Network connectivity monitoring
- **Pretty Dio Logger** - HTTP request/response logging

### Local Storage
- **Hive** - Lightweight and fast NoSQL database for caching

### Data Serialization
- **JSON Serializable** - JSON serialization code generation
- **JSON Annotation** - Annotations for JSON serialization

### UI Components
- **Cached Network Image** - Efficient image loading and caching
- **Material 3** - Modern Material Design components

### Development Tools
- **Logger** - Beautiful console logging
- **Build Runner** - Code generation tool

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                          # Core functionality
│   ├── constants/                 # App-wide constants
│   ├── di/                        # Dependency injection setup
│   ├── error/                     # Error handling & exceptions
│   ├── network/                   # Network configuration
│   ├── state_management/          # BLoC helpers
│   ├── theme/                     # App theming
│   └── utils/                     # Utility functions
├── features/                      # Feature modules
│   └── home/
│       ├── data/
│       │   ├── datasources/       # Remote & Local data sources
│       │   ├── models/            # Data models & DTOs
│       │   ├── mapper/            # Data mapping layer
│       │   └── repositories_impl/ # Repository implementations
│       ├── domain/
│       │   ├── entities/          # Business entities
│       │   └── repositories/      # Repository interfaces
│       └── presentation/
│           ├── cubit/             # State management
│           ├── pages/             # Screen widgets
│           └── widgets/           # Reusable UI components
├── shared/                        # Shared components
│   ├── cubit/                     # Global cubits (theme, etc.)
│   └── helpers/                   # Helper functions
└── main.dart                      # App entry point
```

### Architecture Layers

1. **Presentation Layer**: UI components, pages, and state management (Cubit)
2. **Domain Layer**: Business logic, entities, and repository contracts
3. **Data Layer**: Data sources (remote API & local cache), models, and repository implementations

### Key Design Patterns

- **Repository Pattern**: Abstracts data sources
- **Dependency Injection**: Loose coupling with GetIt
- **BLoC Pattern**: Predictable state management
- **Mapper Pattern**: Separates data models from domain entities

## 📂 Folder Structure

```
lib/
├── core/
│   ├── constants/app_constants.dart
│   ├── di/injection_container.dart
│   ├── error/
│   │   ├── error_model.dart
│   │   ├── exceptions.dart
│   │   └── handle_errors.dart
│   ├── network/
│   │   ├── dio_factory.dart
│   │   └── network_info.dart
│   ├── state_management/bloc_helpers.dart
│   ├── theme/app_theme.dart
│   └── utils/validators.dart
├── features/home/
│   ├── data/
│   │   ├── datasources/
│   │   │   ├── movie_local_data_source.dart
│   │   │   └── movie_remote_data_source.dart
│   │   ├── models/
│   │   │   ├── hive_model/movie_hive_model.dart
│   │   │   └── movie_model.dart
│   │   ├── mapper/movie_mapper.dart
│   │   └── repositories_impl/movie_repository_impl.dart
│   ├── domain/
│   │   ├── entities/movie.dart
│   │   └── repositories/movie_repository.dart
│   └── presentation/
│       ├── cubit/
│       │   ├── movie_cubit.dart
│       │   └── movie_state.dart
│       ├── pages/
│       │   ├── home_page.dart
│       │   └── details_page.dart
│       └── widgets/
│           ├── home_body.dart
│           ├── movie_list.dart
│           ├── movie_container.dart
│           ├── details_body.dart
│           ├── details_backdrop.dart
│           ├── movie_title_section.dart
│           └── movie_overview_section.dart
├── shared/
│   ├── cubit/
│   │   ├── setting_cubit.dart
│   │   └── setting_state.dart
│   └── helpers/logger.dart
├── main.dart
└── movie_app.dart
```

## 🚀 How to Run the Project

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code with Flutter extensions
- An Android/iOS device or emulator

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/AbdelrahmanAddel/movie_app.git
   cd movie_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code files**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Get TMDB API Key**
   - Visit [The Movie Database](https://www.themoviedb.org/)
   - Create an account and generate an API key
   - Replace the API key in `lib/core/network/dio_factory.dart` (line 21)

5. **Run the app**
   ```bash
   flutter run
   ```


## 🔮 Future Improvements

- [ ] **Search Functionality**: Add movie search feature
- [ ] **Favorites**: Allow users to save favorite movies
- [ ] **Movie Categories**: Browse by genres, top-rated, upcoming, etc.
- [ ] **User Reviews**: Display and add movie reviews
- [ ] **Trailers**: Integrate video player for movie trailers
- [ ] **Advanced Filters**: Filter by year, rating, genre
- [ ] **Localization**: Multi-language support
- [ ] **Unit Tests**: Comprehensive test coverage
- [ ] **CI/CD Pipeline**: Automated testing and deployment
- [ ] **Analytics**: Track user behavior and app performance
- [ . **Watchlist**: Create and manage personal watchlist
- [ ] **Social Sharing**: Share movies on social media
- [ ] **Push Notifications**: Notify users of new releases

## 📸 Screenshots

<div align="center">

### Light Mode
<img width="300" alt="Home Screen - Light Mode" src="https://github.com/user-attachments/assets/da310761-fbbc-4f0b-ad37-dc55052cbac6" />
<img width="300" alt="Movie Details - Light Mode" src="https://github.com/user-attachments/assets/705ed49b-c450-4528-aed0-72b00cbe2b22" />

### Dark Mode
<img width="300" alt="Home Screen - Dark Mode" src="https://github.com/user-attachments/assets/d6064dfe-7836-4da5-bff4-1932f6fbcfe1" />
<img width="300" alt="Movie Details - Dark Mode" src="https://github.com/user-attachments/assets/1151055f-3c47-450b-97dc-f313174c553a" />

</div>

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Abdelrahman Ezzeldean**

- 💼 LinkedIn: [Abdelrahman Ezzeldean](https://www.linkedin.com/in/abdelrahman-ezzeldean/)
- 🐙 GitHub: [@AbdelrahmanAddel](https://github.com/AbdelrahmanAddel)
- 📧 Email: abdelrahmanezzeldean@gmail.com

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## ⭐ Show your support

Give a ⭐️ if this project helped you!

## 🙏 Acknowledgments

- [The Movie Database (TMDB)](https://www.themoviedb.org/) for providing the movie data API
- Flutter community for amazing packages and support
- All contributors who help improve this project

---

<div align="center">
  Made with ❤️ using Flutter
</div>
