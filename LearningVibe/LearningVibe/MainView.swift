import SwiftUI

struct MainView: View {
    @AppStorage("streakCount") private var storedStreakCount: Int = 0
    @AppStorage("lastVisitDate") private var storedLastVisitTimeInterval: Double = 0
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text("Gym Streak")
                    .font(.title).bold()
                Text("Total workouts: \(viewModel.totalWorkouts)")
                    .font(.title2)
                Text("Last visit: \(viewModel.lastVisitDisplay)")
                    .foregroundStyle(.secondary)
            }

            Button(action: {
                viewModel.logTodayVisit()
                storedStreakCount = viewModel.totalWorkouts
                storedLastVisitTimeInterval = viewModel.lastVisitDate?.timeIntervalSince1970 ?? 0
            }) {
                HStack(spacing: 8) {
                    Image(systemName: viewModel.isTodayLogged ? "checkmark.circle.fill" : "figure.strengthtraining.traditional")
                    Text(viewModel.isTodayLogged ? "Logged for Today" : "Log Today’s Visit")
                        .bold()
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(viewModel.isTodayLogged)

            if let message = viewModel.milestoneMessage {
                Text(message)
                    .font(.headline)
                    .foregroundStyle(.green)
                    .padding(.top, 8)
            }

            Spacer(minLength: 0)
        }
        .padding(24)
        .onAppear {
            viewModel.syncFromStorage(total: storedStreakCount, lastVisitTimeInterval: storedLastVisitTimeInterval)
        }
    }
}

#Preview {
    MainView()
}


