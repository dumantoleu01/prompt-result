# AI Image Generator - Flutter Application

A modern Flutter application demonstrating clean architecture with BLoC state management. This app simulates an AI image generation workflow with two screens: Prompt input and Result display.

## Features

### Screen 1: Prompt Page
- Clean, modern UI with gradient background
- Text input field with placeholder: "Describe what you want to see..."
- Generate button that activates only when text is entered
- Smooth transitions and professional design

### Screen 2: Result Page
- Loading state with animated loader (2-3 seconds)
- Success state displaying generated image with smooth fade-in animation
- Error state with retry functionality
- Two action buttons:
  - "Try Another" - Regenerates with the same prompt
  - "New Prompt" - Returns to prompt screen (preserves entered text)

## Architecture

The project follows Clean Architecture principles with three main layers:

### Domain Layer (`lib/domain/`)
- **Entities**: `GeneratedImage` - Core business object
- **Repositories**: Abstract repository interface
- **Use Cases**: `GenerateImage` - Business logic

### Data Layer (`lib/data/`)
- **Data Sources**: `ImageGeneratorRemoteDataSource` - Mock API implementation
- **Models**: `GeneratedImageModel` - Data transfer objects
- **Repositories**: Implementation of domain repositories

### Presentation Layer (`lib/presentation/`)
- **BLoC**: State management using flutter_bloc
  - `ImageGeneratorBloc` - Business logic component
  - `ImageGeneratorEvent` - User actions
  - `ImageGeneratorState` - UI states
- **Pages**: UI screens
  - `PromptPage` - Input screen
  - `ResultPage` - Result display screen

## Technologies Used

- **Flutter 3+** with null-safety
- **flutter_bloc ^8.1.3** - State management
- **go_router ^14.0.2** - Navigation
- **equatable ^2.0.5** - Value equality
- **dartz ^0.10.1** - Functional programming (Either type)

## Mock API Implementation

The mock API (`ImageGeneratorRemoteDataSource`) simulates real-world scenarios:
- 2.5 second delay to simulate network request
- ~50% failure rate to demonstrate error handling
- Returns placeholder image path on success

## Key Features

### State Management
- Uses BLoC pattern for predictable state management
- Clear separation of events and states
- Maintains current prompt for regeneration

### Navigation
- go_router for type-safe navigation
- Clean route definitions
- Proper back button handling

### UI/UX Highlights
- Material Design 3
- Smooth animations (fade-in, scale)
- Loading states with visual feedback
- Error handling with user-friendly messages
- Responsive design
- Professional color scheme

### Dependency Injection
- Simple dependency injection container
- Singleton BLoC instance
- Easy to test and maintain

## Project Structure

```
lib/
├── core/
│   └── error/
│       └── failures.dart
├── data/
│   ├── datasources/
│   │   └── image_generator_remote_data_source.dart
│   ├── models/
│   │   └── generated_image_model.dart
│   └── repositories/
│       └── image_generator_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── generated_image.dart
│   ├── repositories/
│   │   └── image_generator_repository.dart
│   └── usecases/
│       └── generate_image.dart
├── presentation/
│   ├── bloc/
│   │   ├── image_generator_bloc.dart
│   │   ├── image_generator_event.dart
│   │   └── image_generator_state.dart
│   └── pages/
│       ├── prompt_page.dart
│       └── result_page.dart
├── injection_container.dart
└── main.dart
```

## Running the Application

1. Install dependencies:
```bash
flutter pub get
```

2. Run the app:
```bash
flutter run
```

## Code Quality

- No linter errors
- Follows Flutter best practices
- Clean code without comments (as requested)
- Modern Flutter features (Material 3, null-safety)
- Proper error handling

## Design Decisions

1. **Clean Architecture**: Ensures maintainability and testability
2. **BLoC Pattern**: Provides predictable state management
3. **go_router**: Type-safe navigation with modern API
4. **Material Design 3**: Modern, professional look
5. **Animations**: Smooth transitions for better UX
6. **Error Handling**: User-friendly error messages with retry options

## Future Enhancements

- Add image caching
- Implement real API integration
- Add share functionality
- Add image history
- Add prompt suggestions
- Add different image styles/filters

