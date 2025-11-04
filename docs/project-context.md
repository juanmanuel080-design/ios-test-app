# Project: GymStreak

## Goal
A small iOS app to track how often I go to the gym.  
Users can log each gym visit with one tap, view their total workout count, and celebrate milestones.  
Future versions may add consecutive streaks, reminders, and analytics.

## Platform
- iOS (minimum version: 17)
- SwiftUI (preferred, no UIKit unless required)
- Xcode on macOS

## Tone / UX
- Follow Apple Human Interface Guidelines (HIG)
- Clear visual hierarchy, generous spacing (16–24 pt paddings)
- Use SF Symbols and system colors for a native look
- Large, accessible primary buttons
- Light mode first

## Architecture
- SwiftUI + MVVM (View + ViewModel + optional Service layer)
- Local persistence first (AppStorage / UserDefaults)
- No Core Data yet
- Future: optional iCloud or Core Data sync

## Metrics & Rules
- Track **Total Workouts** (cumulative) — never resets if days are missed.
- Allow **only one log per calendar day**; disable the button after logging.
- Store locally using `@AppStorage`:
  - `streakCount` → represents total workouts
  - `lastVisitDate` → Double (seconds since 1970)
- Milestones trigger celebration messages at totals **5, 20, 50, 100**
- Future: optional **Consecutive Streak** metric in addition to total count.
- Persist **visit dates** as unique calendar days in `@AppStorage("visitsJSON")` as a JSON array of ISO date strings (yyyy-MM-dd).
- `totalWorkouts` = number of unique visit dates.
- `visitsThisMonth` = count of visit dates within the current calendar month.
- Grid shows up to 25 dots filled for **this month’s visits**.


## Milestone Messages
| Total | Message |
|-------|----------|
| 5 | “Nice start!” |
| 20 | “You’re consistent.” |
| 50 | “Halfway there!” |
| 100 | “Beast mode.” |

## Coding style
- Use structs for views
- Use private helpers
- Avoid force unwraps
- Add brief comments for public methods and logic sections

## Naming conventions
- Views → `SomethingView.swift`
- ViewModels → `SomethingViewModel.swift`
- Services → `SomethingService.swift`
- Avoid placeholder filenames like `Test.swift` or `Playground.swift`
