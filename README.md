# 🎨 AI Image Generator

A professional Flutter application demonstrating **Clean Architecture** with **BLoC** state management. This app simulates an AI image generation workflow with a modern, intuitive UI.

[![Flutter](https://img.shields.io/badge/Flutter-3%2B-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.8%2B-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 📱 Features

### Screen 1: Prompt Input
- 🎨 Modern gradient UI with clean design
- ✍️ Text input field with smart placeholder
- ⚡ Generate button (auto-disabled when empty)
- 🎭 Smooth animations and transitions

### Screen 2: Result Display
- ⏳ **Loading State**: Animated loader (2-3 seconds)
- 🖼️ **Success State**: Beautiful image display with fade-in animation
- ⚠️ **Error State**: User-friendly error handling with retry option
- 🔄 **Actions**: "Try Another" & "New Prompt" buttons

## 🏗️ Architecture

Built with **Clean Architecture** principles:

```
├── Domain Layer      → Business logic
├── Data Layer        → API & repositories
└── Presentation      → UI & state management
```

### Tech Stack

- **Flutter 3+** with null-safety
- **flutter_bloc ^8.1.3** - State management
- **go_router ^14.0.2** - Navigation
- **equatable ^2.0.5** - Value equality
- **dartz ^0.10.1** - Functional programming
- **Material Design 3** - Modern UI

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.0 or higher
- Dart SDK 3.8 or higher

### Installation

```bash
# Clone the repository
git clone https://github.com/dumantoleu01/prompt-result.git

# Navigate to project
cd prompt-result

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Run Tests

```bash
flutter test
```

### Code Analysis

```bash
flutter analyze
```

## 📁 Project Structure

```
lib/
├── core/
│   ├── error/              # Error handling
│   └── routing/            # Navigation config
├── data/
│   ├── datasources/        # Mock API
│   ├── models/             # Data models
│   └── repositories/       # Repository implementations
├── domain/
│   ├── entities/           # Business entities
│   ├── repositories/       # Repository interfaces
│   └── usecases/           # Business logic
└── presentation/
    ├── bloc/               # State management
    ├── pages/              # App screens
    └── widgets/            # Reusable components (9 widgets)
```

## 🎨 UI Components

The app features **9 reusable widgets** for better code organization:

- `GradientBackground` - Gradient container
- `AppHeader` - App branding
- `PromptInputField` - Styled text input
- `GenerateButton` - Smart action button
- `LoadingStateWidget` - Animated loader
- `ErrorStateWidget` - Error display with retry
- `GeneratedImageCard` - Image display card
- `PromptInfoCard` - Prompt information
- `ResultActionsPanel` - Action buttons panel

## 🎯 Key Features

### State Management
- ✅ BLoC pattern for predictable state
- ✅ 4 states: Initial, Loading, Success, Error
- ✅ 2 events: Generate, Regenerate
- ✅ Clean event/state flow

### Mock API
- ✅ 2.5 second delay simulation
- ✅ ~50% failure rate for testing
- ✅ Proper error handling

### Navigation
- ✅ go_router for type-safe routing
- ✅ Clean route definitions
- ✅ Back button support

### Code Quality
- ✅ Zero linter errors
- ✅ Zero analyzer warnings
- ✅ All tests passing (3/3)
- ✅ Clean code (no comments as requested)
- ✅ Production-ready

## 🎨 Design

- **Color Scheme**: Dark Teal (#00796B)
- **Typography**: Material Design 3
- **Animations**: Fade, scale, opacity transitions
- **Layout**: Card-based with shadows
- **Style**: Modern, professional, clean

## 📚 Documentation

- [PROJECT_OVERVIEW.md](PROJECT_OVERVIEW.md) - Technical overview
- [IMPLEMENTATION_SUMMARY.md](IMPLEMENTATION_SUMMARY.md) - Implementation details
- [QUICK_START.md](QUICK_START.md) - Quick start guide
- [APP_FLOW.md](APP_FLOW.md) - Flow diagrams
- [REFACTORING_SUMMARY.md](REFACTORING_SUMMARY.md) - Refactoring details

## 🧪 Testing

All tests pass successfully:

```bash
flutter test
# Result: ✅ 3/3 tests passed
```

Test coverage includes:
- App initialization
- Button state management
- Input validation

## 📊 Statistics

- **Files**: 14 Dart files
- **Lines of Code**: ~800+
- **Widgets**: 9 reusable components
- **Architecture Layers**: 3 (Domain, Data, Presentation)
- **Test Coverage**: All critical paths

## 🔄 User Flow

```
App Launch → Prompt Screen → Enter Text → Generate
    ↓
Loading (2-3s) → Success/Error
    ↓
Success: View Image → Try Another / New Prompt
Error: Retry / Back to Prompt
```

## 🛠️ Development

### Adding New Features

1. **Domain Layer**: Define entities and use cases
2. **Data Layer**: Implement data sources and repositories
3. **Presentation Layer**: Create BLoC events/states and UI

### Code Style

- Follow Flutter best practices
- Use meaningful names
- Keep widgets small and focused
- Prefer composition over inheritance

## 🚀 Future Enhancements

Potential improvements:
- [ ] Real API integration
- [ ] Image caching
- [ ] Share functionality
- [ ] Generation history
- [ ] Multiple image styles
- [ ] User accounts
- [ ] Dark mode support

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**dumantoleu01**
- GitHub: [@dumantoleu01](https://github.com/dumantoleu01)

## 🙏 Acknowledgments

- Built with Flutter framework
- Uses flutter_bloc for state management
- Inspired by modern AI image generation apps

## 📞 Contact

For questions or feedback, please open an issue on GitHub.

---

**Made with ❤️ using Flutter**
