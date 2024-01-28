import Foundation

/*
 KeyPath 搭配 Protocol
 */
protocol 可搜寻 {
    static var 搜寻属性: [KeyPath<Self, String>] { get }
}

extension Sequence where Element: 可搜寻 {
    func filter(keyword: String) -> [Element] {
        filter { 资料 in
            Element.搜寻属性.contains { path in
                let 属性资料 = 资料[keyPath: path]
                return 属性资料.contains(keyword)
            }
        }
    }
}

extension Sequence {
    func sorted<T: Comparable>(_ path: KeyPath<Element, T>) -> [Element] {
        sorted {
            $0[keyPath: path] < $1[keyPath: path]
        }
    }

    func sum<T: AdditiveArithmetic>(_ path: KeyPath<Element, T>) -> T {
        reduce(T.zero) { $0 + $1[keyPath: path] }
    }
}

struct 猫咪: 可搜寻, CustomStringConvertible {
    static var 搜寻属性: [KeyPath<猫咪, String>] = [\.名字, \.颜色]

    var 名字: String
    var 颜色: String = "黑"

    var description: String {
        "\(名字)(\(颜色))"
    }
}

struct 狗狗: CustomStringConvertible {
    static var 搜寻属性: [KeyPath<狗狗, String>] = [\.名字]
    static let 所有属性: [PartialKeyPath<狗狗>] = [\.体重, \.名字.utf8, \.品种]
    static let 各式各样属性: [AnyKeyPath] = [\狗狗.体重, \猫咪.名字, \Double.description]

    enum 品种: String {
        case 博美, 柴犬, 哈士奇, 米克斯
    }

    var 名字: String
    var 品种: 品种
    var 体重: Int
    var description: String { "\(名字)" }
}

let 猫咪们 = [猫咪(名字: "小黑", 颜色: "白+黄"), 猫咪(名字: "小白")]
let 狗狗们 = [狗狗(名字: "屁屁", 品种: .博美, 体重: 4),
           狗狗(名字: "米粒", 品种: .哈士奇, 体重: 12),
           狗狗(名字: "果果", 品种: .柴犬, 体重: 8)]

print(猫咪们.filter(keyword: "黑"))
//print(狗狗们.filter(keyword: "米"))

// 语法糖
print(狗狗们.sorted { $0.体重 > $1.体重 })
print(狗狗们.sorted(\.体重))
print(狗狗们.sum(\.体重), "kg", separator: "")
print([12.3, 1.1].sum(\.self))

/*:
    1. 用途:
        1. 语法糖
        2. 确保快捷单纯的使用
    2. 写法: \Root.Value
    3. 读取: rootObject[KeyPath: path]
*/
