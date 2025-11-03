import Foundation
import SwiftUI
import Combine

/// ViewModel for the main screen. Manages the gym streak and visit logging.
final class MainViewModel: ObservableObject {
    @Published private(set) var streakCount: Int = 0
    @Published private(set) var lastVisitDate: Date? = nil
    @Published var milestoneMessage: String? = nil

    init() {
    }

    /// Logs a gym visit for today. Increments streak if not already logged today.
    func logTodayVisit() {
        let today = Calendar.current.startOfDay(for: Date())
        if let last = lastVisitDate, Calendar.current.isDate(last, inSameDayAs: today) {
            // Already logged today; no-op
            return
        }

        // Cumulative total: increment regardless of missed days (max once per day)
        streakCount += 1

        lastVisitDate = today
        milestoneMessage = milestoneText(for: streakCount)
    }

    /// Whether today is already logged.
    var isTodayLogged: Bool {
        guard let last = lastVisitDate else { return false }
        return Calendar.current.isDateInToday(last)
    }

    /// Total workouts (alias for the stored count).
    var totalWorkouts: Int { streakCount }

    /// A short, user-facing date string for the last visit.
    var lastVisitDisplay: String {
        guard let last = lastVisitDate else { return "No visits yet" }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: last)
    }

    // MARK: - Private

    /// Syncs the ViewModel's state from storage values.
    func syncFromStorage(total: Int, lastVisitTimeInterval: Double) {
        streakCount = total
        lastVisitDate = lastVisitTimeInterval > 0 ? Date(timeIntervalSince1970: lastVisitTimeInterval) : nil
    }

    private func milestoneText(for streak: Int) -> String? {
        switch streak {
        case 5: return "Nice start!"
        case 20: return "You’re consistent."
        case 50: return "Keep going!"
        case 100: return "Beast mode."
        default: return nil
        }
    }
}


