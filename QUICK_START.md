# Quick Start Guide

## Setup

```bash
cd /Users/duman/Flutter/work2/prompt_result
flutter pub get
```

## Run the App

```bash
flutter run
```

## Usage Flow

1. **Launch App** → Opens Prompt screen
2. **Enter text** → "A beautiful sunset over mountains"
3. **Click Generate** → Navigates to Result screen
4. **Wait 2-3 seconds** → Loading animation
5. **Result appears** → Either success (image) or error (retry option)

### If Success:
- **Try Another** → Regenerate with same prompt
- **New Prompt** → Go back to edit prompt

### If Error:
- **Retry** → Try generation again
- **Back to Prompt** → Return to input screen

## Key Features Demo

### Test Empty Input
1. Open app
2. Try clicking Generate
3. ✅ Button is disabled

### Test Success Flow
1. Enter any text
2. Click Generate
3. Wait for loading
4. See result (50% chance)
5. Click "Try Another"
6. See new result

### Test Error Flow
1. Generate until error appears (50% chance)
2. Click Retry
3. Continue until success

### Test Navigation
1. From result, click "New Prompt"
2. Edit text
3. Generate again

## Architecture Quick Reference

```
Prompt Input → BLoC Event → Use Case → Repository → Data Source
                    ↓
            Loading State → UI shows loader
                    ↓
        Success/Error State → UI updates
```

## File Structure Quick Reference

- **Entry Point**: `lib/main.dart`
- **Screens**: `lib/presentation/pages/`
- **State Logic**: `lib/presentation/bloc/`
- **Business Logic**: `lib/domain/`
- **Data/API**: `lib/data/`

## Common Commands

```bash
# Get dependencies
flutter pub get

# Run app
flutter run

# Analyze code
flutter analyze

# Run tests (when added)
flutter test

# Build for release
flutter build apk        # Android
flutter build ios        # iOS  
flutter build web        # Web
```

## Troubleshooting

### Java Version Issue (Android)
If you see Java 11/17 error:
```bash
flutter doctor --verbose
# Update Android Studio or set correct JDK
```

### Dependencies Issue
```bash
flutter clean
flutter pub get
```

### Cache Issue
```bash
flutter clean
rm -rf pubspec.lock
flutter pub get
```

## Project Structure

```
lib/
├── main.dart                   # Entry point
├── injection_container.dart    # DI setup
├── core/
│   └── error/                  # Error types
├── domain/                     # Business logic
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── data/                       # Data layer
│   ├── datasources/            # Mock API
│   ├── models/
│   └── repositories/
└── presentation/               # UI layer
    ├── bloc/                   # State management
    └── pages/                  # Screens
```

## Testing the App

### Manual Test Checklist
- [ ] Empty input disables button
- [ ] Text input enables button
- [ ] Generate shows loading
- [ ] Loading lasts ~2-3 seconds
- [ ] Success shows image
- [ ] Error shows retry button
- [ ] Try Another regenerates
- [ ] New Prompt goes back
- [ ] Back button works
- [ ] Text is preserved in bloc

### Success Metrics
- ✅ No crashes
- ✅ Smooth animations
- ✅ Clear feedback
- ✅ Professional appearance
- ✅ Intuitive flow

## Notes

- The app uses a mock API with 50% failure rate
- Placeholder image is located in `assets/images/`
- All text and UI is in English
- No comments in code (as per requirements)
- Clean architecture with BLoC pattern
- Material Design 3 styling

