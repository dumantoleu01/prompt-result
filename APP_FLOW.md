# Application Flow Diagram

## User Journey

```
┌─────────────────────────────────────────────────────────────────┐
│                        APP STARTS                                │
└────────────────────────┬────────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│                    SCREEN 1: PROMPT                              │
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  🎨 AI Image Generator                                    │  │
│  │  Transform your ideas into stunning visuals               │  │
│  └──────────────────────────────────────────────────────────┘  │
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  Describe what you want to see...                         │  │
│  │                                                            │  │
│  │  [User types here]                                        │  │
│  └──────────────────────────────────────────────────────────┘  │
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │              ⚡ [Generate Button]                         │  │
│  │              (Disabled if empty)                          │  │
│  └──────────────────────────────────────────────────────────┘  │
└────────────────────────┬────────────────────────────────────────┘
                         │
                         │ User clicks Generate
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│                    SCREEN 2: RESULT                              │
│                     (Loading State)                              │
│                                                                  │
│                         ⏳                                       │
│                    Generating...                                 │
│                  (2-3 seconds)                                   │
│                                                                  │
└────────────┬──────────────────────────┬─────────────────────────┘
             │                          │
    ~50% Success                   ~50% Failure
             │                          │
             ▼                          ▼
┌─────────────────────────┐    ┌──────────────────────────────────┐
│   SUCCESS STATE          │    │      ERROR STATE                 │
│                          │    │                                  │
│  ┌───────────────────┐  │    │      ⚠️ Error                    │
│  │                   │  │    │   Oops! Something                │
│  │   [Image]         │  │    │   went wrong                     │
│  │                   │  │    │                                  │
│  └───────────────────┘  │    │   ┌──────────────────┐         │
│                          │    │   │   🔄 Retry       │         │
│  Prompt: "..."           │    │   └──────────────────┘         │
│                          │    │   ┌──────────────────┐         │
│  ┌──────────────────┐   │    │   │ Back to Prompt   │         │
│  │ 🔄 Try Another   │   │    │   └──────────────────┘         │
│  └──────────────────┘   │    │                                  │
│  ┌──────────────────┐   │    └──────┬───────────────────────────┘
│  │ ✏️ New Prompt   │   │           │
│  └──────────────────┘   │           │ Click Retry
└────┬──────────┬─────────┘           │
     │          │                      │
     │          │                      ▼
     │          │              ┌───────────────┐
     │          │              │ Try Again     │
     │          │              └───────┬───────┘
     │          │                      │
     │          └──────────────────────┘
     │
     ▼
Click "New Prompt"
     │
     ▼
Back to SCREEN 1
(with prompt preserved in BLoC)
```

## State Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                     BLoC STATE FLOW                              │
└─────────────────────────────────────────────────────────────────┘

┌──────────────┐
│   Initial    │ ──────────────────────────────────────────┐
└──────────────┘                                            │
                                                            │
User enters text & clicks Generate                          │
        │                                                   │
        ▼                                                   │
┌──────────────┐                                            │
│GenerateImage │ (Event)                                    │
│   Event      │                                            │
└──────┬───────┘                                            │
       │                                                    │
       ▼                                                    │
┌──────────────┐                                            │
│   Loading    │ ◄── Shows loader                           │
│    State     │     for 2-3 seconds                        │
└──────┬───────┘                                            │
       │                                                    │
       │ Mock API call                                      │
       │                                                    │
    ┌──▼───┐                                                │
    │ API  │                                                │
    └──┬───┘                                                │
       │                                                    │
  ┌────┴────┐                                               │
  │         │                                               │
Success  Failure                                            │
  │         │                                               │
  ▼         ▼                                               │
┌──────┐ ┌──────┐                                           │
│Success│ │Error │                                           │
│ State│ │State │                                           │
└───┬──┘ └──┬───┘                                           │
    │       │                                               │
    │       │ Click Retry                                   │
    │       └───────────┐                                   │
    │                   │                                   │
    │                   ▼                                   │
    │           ┌──────────────┐                            │
    │           │ Regenerate   │                            │
    │           │    Event     │                            │
    │           └──────┬───────┘                            │
    │                  │                                    │
    │                  └────────────────────────────────────┘
    │
    │ Click "Try Another"
    └──────────────────────────────────────────────────────┘

Click "New Prompt"
        │
        ▼
Navigate back to Prompt Screen
(BLoC maintains state)
```

## Navigation Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                      NAVIGATION                                  │
└─────────────────────────────────────────────────────────────────┘

    Route: "/"                      Route: "/result"
         │                                  │
         ▼                                  ▼
┌──────────────────┐            ┌──────────────────────┐
│   Prompt Page    │ ────────▶  │    Result Page       │
│                  │  Generate   │                      │
│                  │             │                      │
│  - Text Input    │             │  - Loading State     │
│  - Generate Btn  │             │  - Success State     │
│                  │             │  - Error State       │
└──────────────────┘             │                      │
         ▲                       │  - Try Another Btn   │
         │                       │  - New Prompt Btn    │
         │                       └──────────────────────┘
         │                                  │
         └──────────────────────────────────┘
              Click "New Prompt"
              or Back Button
```

## Data Flow Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    CLEAN ARCHITECTURE FLOW                       │
└─────────────────────────────────────────────────────────────────┘

UI Layer (Presentation)
    │
    │ User taps Generate
    │
    ▼
┌──────────────────────┐
│   ImageGenerator     │
│       BLoC           │ ◄────────── Manages State
└──────────┬───────────┘
           │
           │ Calls Use Case
           ▼
┌──────────────────────┐
│   GenerateImage      │
│     Use Case         │ ◄────────── Business Logic
└──────────┬───────────┘
           │
           │ Calls Repository
           ▼
┌──────────────────────┐
│  ImageGenerator      │
│    Repository        │ ◄────────── Abstract Interface
└──────────┬───────────┘
           │
           │ Implementation
           ▼
┌──────────────────────┐
│  ImageGenerator      │
│ RepositoryImpl       │ ◄────────── Concrete Implementation
└──────────┬───────────┘
           │
           │ Calls Data Source
           ▼
┌──────────────────────┐
│  ImageGenerator      │
│  RemoteDataSource    │ ◄────────── Mock API
└──────────┬───────────┘
           │
           │ 50/50 Success/Failure
           │
    ┌──────┴──────┐
    │             │
Success        Failure
    │             │
    ▼             ▼
GeneratedImage   Exception
    │             │
    │             │
    │ (Propagates back up)
    │             │
    ▼             ▼
Right<Image>   Left<Failure>
    │             │
    │ (BLoC receives result)
    │             │
    ▼             ▼
Success State  Error State
    │             │
    │ (UI updates)
    │             │
    ▼             ▼
Show Image     Show Error
```

## Component Interaction

```
┌─────────────────────────────────────────────────────────────────┐
│                   COMPONENT INTERACTION                          │
└─────────────────────────────────────────────────────────────────┘

┌──────────────┐         ┌──────────────┐         ┌──────────────┐
│              │         │              │         │              │
│  Prompt      │  push   │   Router     │ create  │   Result     │
│   Page       │────────▶│  (go_router) │────────▶│    Page      │
│              │         │              │         │              │
└──────┬───────┘         └──────────────┘         └──────┬───────┘
       │                                                  │
       │                                                  │
       │                ┌──────────────┐                 │
       └───────────────▶│              │◀────────────────┘
                        │  BLoC        │
                        │  Provider    │
                        │              │
                        └──────┬───────┘
                               │
                               │ Singleton
                               │
                        ┌──────▼───────┐
                        │              │
                        │ Image        │
                        │ Generator    │
                        │ BLoC         │
                        │              │
                        └──────────────┘
```

## File Dependencies

```
main.dart
  │
  ├─── injection_container.dart
  │     └─── presentation/bloc/image_generator_bloc.dart
  │           └─── domain/usecases/generate_image.dart
  │                 └─── domain/repositories/image_generator_repository.dart
  │                       └─── domain/entities/generated_image.dart
  │
  ├─── presentation/pages/prompt_page.dart
  │     └─── presentation/bloc/image_generator_bloc.dart
  │
  └─── presentation/pages/result_page.dart
        └─── presentation/bloc/image_generator_bloc.dart

data/repositories/image_generator_repository_impl.dart
  │
  ├─── domain/repositories/image_generator_repository.dart
  │
  └─── data/datasources/image_generator_remote_data_source.dart
        └─── data/models/generated_image_model.dart
              └─── domain/entities/generated_image.dart
```

## Event Sequence

```
┌─────────────────────────────────────────────────────────────────┐
│                      EVENT TIMELINE                              │
└─────────────────────────────────────────────────────────────────┘

Time  Event                    State               UI
────  ─────────────────────   ──────────────────  ────────────────
0ms   App Launch              Initial             Prompt Screen
      │
      ▼
1000  User types text         Initial             Button enabled
      │
      ▼
1500  User clicks Generate    Initial             Navigate
      │
      ▼
1510  GenerateImageEvent      Loading             Show loader
      │
      ▼
4000  API returns result      Success/Error       Show result/error
      │                       (after 2.5s)
      ▼
      ┌─── Success
      │    │
      │    ▼
      │    User sees image
      │    │
      │    ├─── Click "Try Another"
      │    │    └─── Back to Loading → Success/Error
      │    │
      │    └─── Click "New Prompt"
      │         └─── Navigate to Prompt (state preserved)
      │
      └─── Error
           │
           └─── Click Retry
                └─── Back to Loading → Success/Error
```

