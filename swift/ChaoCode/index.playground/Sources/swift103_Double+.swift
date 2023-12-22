import Foundation


/// 避免使用科學符號表示法，小於 `Double.leastNormalMagnitude` 的數字依然會用科學符號表示。
/// - Parameters:
///   - number: 轉換的數值
///   - showComma: 是否顯示千分位的逗號分隔，預設為否。
public func print(_ number: Double, showComma: Bool = false)
{
    if (number < Double.leastNonzeroMagnitude) {
        print(number.description)
        return
    }
    var string = number.formattedString
    if (!showComma) { string = string.replacingOccurrences(of: ",", with: "") }
    print(string)
}


extension Double {
    fileprivate var formattedString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 325
        formatter.maximumSignificantDigits = 325

        return formatter.string(from: NSNumber(value: self))!
    }
}
