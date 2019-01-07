import Danger
import Foundation

public struct WarningsCount {
    internal static let danger = Danger()

    public static func ifIncreasesThenFail() {
        let userDefaultsKey = "com.rwbutler.danger-swift.warnings-count"
        let dataExists: Bool = UserDefaults.standard.object(forKey: userDefaultsKey) != nil
        let previousWarningsCount = UserDefaults.standard.integer(forKey: userDefaultsKey)
        let currentWarningsCount = linterWarningsCount()
        if dataExists && (currentWarningsCount > previousWarningsCount) {
            fail("Warnings count has increased from \(previousWarningsCount) to \(currentWarningsCount) warnings.")
        }
    }
}

internal extension WarningsCount {
    static func linterWarningsCount() -> Int {
        let linterViolations = SwiftLint.lint()
        return linterViolations.count
    }
}
