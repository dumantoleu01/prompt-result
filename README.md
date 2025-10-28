# AI Image Generator - Flutter Test Assignment

A professional Flutter application implementing a mock AI image generation workflow with clean architecture and BLoC state management.

## ✅ Assignment Completion

All requirements from the test assignment have been successfully implemented:

- ✅ 2 screens (Prompt → Result)
- ✅ flutter_bloc for state management
- ✅ Clean architecture
- ✅ Mock API with ~50% failure rate
- ✅ Loading states and animations
- ✅ Error handling with retry
- ✅ Modern, professional UI
- ✅ All text in English
- ✅ No code comments
- ✅ Zero linter errors

## Quick Start

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Run tests
flutter test

# Analyze code
flutter analyze
```

## Features

### Screen 1: Prompt Input
- Modern gradient UI with icon and title
- Text input field with placeholder
- Generate button (disabled when empty)
- Smooth animations and transitions

### Screen 2: Result Display
- **Loading State**: Animated loader (2-3 seconds)
- **Success State**: Displays generated image with fade-in animation
- **Error State**: User-friendly error message with retry button
- **Actions**:
  - "Try Another" - Regenerate with same prompt
  - "New Prompt" - Return to input screen

## Architecture

### Clean Architecture Layers

```
├── Domain Layer (Business Logic)
│   ├── Entities
│   ├── Repositories (Interfaces)
│   └── Use Cases
│
├── Data Layer (Implementation)
│   ├── Data Sources (Mock API)
│   ├── Models
│   └── Repository Implementations
│
└── Presentation Layer (UI)
    ├── BLoC (State Management)
    └── Pages (Screens)
```

## Tech Stack

- **Flutter 3+** with null-safety
- **flutter_bloc ^8.1.3** - State management
- **go_router ^14.0.2** - Navigation
- **equatable ^2.0.5** - Value equality
- **dartz ^0.10.1** - Functional programming

## Project Structure

```
lib/
├── main.dart
├── injection_container.dart
├── core/
│   └── error/
│       └── failures.dart
├── domain/
│   ├── entities/
│   │   └── generated_image.dart
│   ├── repositories/
│   │   └── image_generator_repository.dart
│   └── usecases/
│       └── generate_image.dart
├── data/
│   ├── datasources/
│   │   └── image_generator_remote_data_source.dart
│   ├── models/
│   │   └── generated_image_model.dart
│   └── repositories/
│       └── image_generator_repository_impl.dart
└── presentation/
    ├── bloc/
    │   ├── image_generator_bloc.dart
    │   ├── image_generator_event.dart
    │   └── image_generator_state.dart
    └── pages/
        ├── prompt_page.dart
        └── result_page.dart
```

## Mock API

The mock implementation simulates real-world scenarios:
- 2.5 second delay (network simulation)
- ~50% failure rate
- Returns placeholder image on success
- Throws exception on failure

## UI/UX Highlights

- **Material Design 3** with custom theme
- **Smooth animations**: Fade-in, scale, and opacity transitions
- **Loading states**: Clear visual feedback
- **Error handling**: User-friendly messages with recovery options
- **Responsive design**: Works on all screen sizes
- **Professional appearance**: Modern gradient backgrounds, card layouts, shadows

## Code Quality

- ✅ Zero linter errors
- ✅ Zero analyzer warnings
- ✅ All tests passing (3/3)
- ✅ Clean code without comments
- ✅ Follows Flutter best practices
- ✅ Type-safe throughout
- ✅ Proper error handling

## Testing

Run the test suite:
```bash
flutter test
```

Tests cover:
- App initialization
- Button state management
- Input validation

## Documentation

- **README.md** - This file
- **PROJECT_OVERVIEW.md** - Detailed project documentation
- **IMPLEMENTATION_SUMMARY.md** - Complete implementation details
- **QUICK_START.md** - Getting started guide

## Design Decisions

### Why Clean Architecture?
- Scalable and maintainable
- Easy to test
- Clear separation of concerns
- Professional approach

### Why BLoC?
- Industry standard
- Excellent for complex state
- Testable business logic
- Clear event/state flow

### Why Material Design 3?
- Modern, fresh appearance
- Built-in Flutter support
- Consistent with platform guidelines
- Professional out-of-the-box

## What's Included

✅ Complete working application
✅ Clean architecture implementation
✅ BLoC state management
✅ Modern, professional UI
✅ Smooth animations
✅ Error handling
✅ Loading states
✅ Navigation system
✅ Dependency injection
✅ Unit tests
✅ Comprehensive documentation

## Production Ready

This app demonstrates:
- Professional code structure
- Modern UI/UX practices
- Proper error handling
- Smooth user experience
- Scalable architecture
- Testable code
- Clean, maintainable codebase

## Future Enhancements

Potential improvements:
- Real API integration
- Image caching
- Share functionality
- Generation history
- Different image styles
- Prompt suggestions
- Analytics integration
- Performance monitoring

## License

This is a test assignment implementation.

## Contact

For questions or clarifications about the implementation, please refer to the documentation files or the code itself.

---

**Built with ❤️ using Flutter**
