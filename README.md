# Movie App 🎬

A modern Flutter application for browsing and discovering movies using The Movie Database (TMDB) API. Built with clean architecture principles and featuring a beautiful UI with dark/light theme support.

## Features ✨

- 🎥 **Browse Movies**: Infinite scroll pagination to discover movies
- 📱 **Movie Details**: View detailed information about each movie
- 🌓 **Theme Support**: Switch between light and dark themes
- 💾 **Local Caching**: Movies are cached locally using Hive for offline access
- 🎨 **Modern UI**: Beautiful and responsive user interface
- 🔄 **State Management**: Efficient state management using BLoC pattern
- 🛡️ **Error Handling**: Comprehensive error handling with Sentry integration

## Tech Stack 🛠️

### Core
- **Flutter**: ^3.9.2
- **Dart**: SDK ^3.9.2

### State Management & Architecture
- **flutter_bloc**: ^9.1.1 - State management using BLoC pattern
- **hydrated_bloc**: ^10.1.1 - Persist and restore BLoC states
- **get_it**: ^8.2.0 - Dependency injection

### Networking
- **dio**: ^5.9.0 - HTTP client
- **retrofit**: ^4.7.3 - Type-safe HTTP client generator
- **pretty_dio_logger**: ^1.4.0 - HTTP request/response logging

### Data Persistence
- **hive**: ^2.2.3 - Fast, lightweight key-value database
- **hive_flutter**: ^1.1.0 - Flutter integration for Hive
- **sqflite**: ^2.4.2 - SQLite database

### UI & Routing
- **go_router**: ^16.2.1 - Declarative routing
- **google_fonts**: ^6.3.1 - Beautiful typography
- **cached_network_image**: ^3.4.1 - Efficient image caching

### Error Tracking
- **sentry_flutter**: ^9.7.0 - Error tracking and performance monitoring

### Code Generation
- **json_annotation**: ^4.9.0 - JSON serialization
- **envied**: ^1.3.1 - Environment variable management
- **build_runner**: Code generation tool

## Project Structure 📁

```
lib/
├── core/
│   ├── config/
│   │   └── theme/          # Theme configuration (light/dark)
│   ├── di/                  # Dependency injection setup
│   ├── networking/          # API configuration, error handling
│   └── routes/              # App routing configuration
│
└── features/
    ├── details/
    │   └── presentation/
    │       └── screens/     # Movie details screen
    │
    └── movies/
        ├── data/
        │   ├── datasources/ # Remote & local data sources
        │   ├── models/      # Data models
        │   └── repository/  # Repository implementation
        │
        └── presentation/
            ├── cubit/       # BLoC state management
            ├── screens/     # Movies list screen
            └── widgets/     # Reusable UI components
```

## Getting Started 🚀

### Prerequisites

- Flutter SDK (^3.9.2)
- Dart SDK (^3.9.2)
- Android Studio / VS Code with Flutter extensions
- API key from [The Movie Database](https://www.themoviedb.org/settings/api)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd movie_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up environment variables**
   
   Create a `.env` file in the `env/` directory:
   ```
   API_TOKEN=your_tmdb_api_token_here
   ```
   
   Note: The API key is already configured in `api_constants.dart`, but you may want to use environment variables for production.

4. **Run code generation**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## Building for Production 📦

### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Architecture 🏗️

This project follows **Clean Architecture** principles with clear separation of concerns:

- **Data Layer**: Handles API calls, local storage, and data models
- **Presentation Layer**: Contains UI components, BLoC for state management, and screens
- **Core**: Shared utilities, dependency injection, routing, and theme configuration

### State Management

The app uses the **BLoC (Business Logic Component)** pattern:
- `MoviesCubit`: Manages movie list state and pagination
- `ThemeCubit`: Handles theme switching (light/dark mode)
- States are persisted using `HydratedBloc` for better UX

## API Integration 🔌

The app integrates with [The Movie Database (TMDB) API](https://www.themoviedb.org/documentation/api):
- Base URL: `https://api.themoviedb.org/3/`
- Endpoints are defined using Retrofit for type-safe API calls
- Error handling is centralized with custom error models

## Local Caching 💾

- Movies are cached locally using **Hive** for offline access
- BLoC states are persisted using **HydratedBloc**
- Images are cached using **cached_network_image**

## Error Tracking 🛡️

- **Sentry** integration for production error tracking
- Comprehensive error handling with custom error models
- Network error handling with retry mechanisms

## Contributing 🤝

Contributions are welcome! Please feel free to submit a Pull Request.

## License 📄

This project is private and not licensed for public use.

## Acknowledgments 🙏

- [The Movie Database (TMDB)](https://www.themoviedb.org/) for providing the movie data API
- Flutter team for the amazing framework
- All open-source contributors of the packages used in this project
