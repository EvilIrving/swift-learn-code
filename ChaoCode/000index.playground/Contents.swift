import Foundation

extension Int {
    // 计算属性
    var toDouble: Double {
        Double(self)
    }

    // 方法
    func square() -> Int {
        self * self
    }

    // 静态属性
    static let one = 1
    // 静态方法
    static func random() -> Self {
        random(in: Int.min ... Int.max)
    }

    // 初始化
    init(_ bool: Bool) {
        self = bool ? 1 : 0
    }

    // 转换数字成String
    func formatted() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(for: self)!
    }
}

let number = 100
print(number.toDouble)
Int.one
number.square()
// print(Int.random())
Int(true)
Int(false)

extension Locale {
    static var tch: Locale = .init(identifier: "zh-hant-tw")
    static var japan: Locale = .init(identifier: "ja-JP")
}

extension Numeric {
    func formatted(by style: NumberFormatter.Style = .decimal, locale: Locale = .tch) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        formatter.locale = locale
        return formatter.string(for: self)!
    }
}

let number2 = 2000
print(number2.formatted(by: .currency, locale: .japan))
print(2000.35355.formatted(by: .decimal, locale: .tch))
print(Decimal(3234).formatted())
// 改进

// extension Locale {
//    static var tch: Locale = .init(identifier: "zh-hant-tw")
//    static var japan: Locale = .init(identifier: "ja-JP")
// }
//
// extension NumberFormatter {
//    static let decimalFormatter: NumberFormatter = {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .decimal
//        formatter.locale = .init(identifier: "zh-CN")
//        return formatter
//    }()
//
//    static let currencyFormatter: NumberFormatter = {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        formatter.locale = .japan
//        return formatter
//    }()
// }
//
// extension Numeric {
//    func formatted(by formatter: NumberFormatter = .decimalFormatter) -> String {
//        formatter.string(for: self)!
//    }
// }
//
// let number2 = 2000
// print(number.formatted())
// print(2000.35355.formatted(by: .currencyFormatter))
// print(Decimal(3234).formatted())

print(number2.formatted(.number))
print(number2.formatted(.currency(code: "TWD")))
print(number2.formatted(.currency(code: "JPY")))
