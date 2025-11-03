# Project: GymStreak

## Goal
A small iOS app to track how often I go to the gym. One-tap logging, visible streak, milestone celebrations.

## Platform
- iOS
- SwiftUI (preferred, no UIKit unless needed)
- Min iOS = 17
- Xcode on macOS

## Tone / UX
- Follow Apple Human Interface Guidelines (clear hierarchy, generous spacing, SF Symbols, large tap areas)
- Single primary action per screen
- Light mode first
- Make it look like a native iOS app, follow Apple HIG, use SF Symbols, paddings 16–24, and large tappable buttons.

## Architecture
- SwiftUI views
- MVVM-ish (View + ViewModel + small service)
- Local persistence first (AppStorage / UserDefaults)
- NO Core Data yet

## Metrics & Rules
- We track **Total Workouts** (cumulative). It **never resets** if days are missed.
- Allow **one log per calendar day**. If today is already logged, the primary button is disabled.
- Store:
  - `streakCount` (Int) → actually **total workouts**
  - `lastVisitDate` (Double: seconds since 1970)
- Milestones fire on **totals**: 5, 20, 50, 100.
- Future (not now): optional “Consecutive Streak” separate from totals.

## Coding style
- Use structs for views
- Use private helpers
- Avoid force unwraps
- Add comments to public methods

## Naming
- Views: `SomethingView.swift`
- ViewModels: `SomethingViewModel.swift`
- Services: `SomethingService.swift`
- No random filenames like `Test.swift` or `Playground.swift`

## Data
- Store streak counts in AppStorage for now.
- Later we might move to Core Data or iCloud, but not in v1.

## Milestones
- 5 visits → “Nice start!”
- 20 visits → “You’re consistent.”
- 100 visits → “Beast mode.”

