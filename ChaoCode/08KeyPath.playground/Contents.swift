import Foundation

struct Cat {
    var name: String
}

/*
 KeyPath组成
    Literal expression: \(后面是 KeyPath ) + 类型名称 + .+ 属性名称
    KeyPath<Root,Value>, Root 是被访问属性所在的类型，Value 是是属性的类型(想要访问的属性的类型)
 \Cat.name
 KeyPath(Cat, String)
 */


/*
 存取方法: 用下标存取 object[KeyPath: path]
 */
let cat = Cat(name: "Whiskers")
let nameKeyPath = \Cat.name
cat.name == cat[keyPath: \.name] // 简写的 KeyPath, 此时 Swift 知道所在类型是Cat才可以简写
let catName = cat[keyPath: nameKeyPath] // "Whiskers" 优势: 分开来写

/*
 KeyPath + Protocol
 */

// 如何修改为住户 却遵循同一个协议
protocol 有名字 {
    // var 名字: String { get }
    static var namePath: KeyPath<Self, String> { get }
}

extension 有名字 {
    func 打招呼() {
        // print("你好, \(self.名字)")
        print("你好,\(self[keyPath: Self.namePath])")
    }
}

struct 猫咪: 有名字, CustomStringConvertible {
    static let namePath: KeyPath<猫咪, String> = \.名字
    var 名字: String
    var 颜色: String = "白"

    var description: String {
        "\(名字)(\(颜色))"
    }
}

struct 住址: 有名字 {
    static let namePath: KeyPath<住址, String> = \.住户
    // let name: String
    let 住户: String
    let 街道: String
    let 楼层: String
}

/*
 转换成(Root)->Value 的 closure
 只有 literal expression 可以被判断成 KeyPath 或 (Root)->Value, 无法被判断为 KeyPath 的时候,会尝试转换. 但仍然以 KeyPath 优先,
 */
let cats = [猫咪(名字: "小黑", 颜色: "白+黄"), 猫咪(名字: "小白", 颜色: "黑")]
print(cats.map(\.名字)) // map 的 api 接收一个 closure, 此处 Swift 自动转换了 KeyPath 为 closure, func map<T>((Element) -> T) -> [T]

let keypath: KeyPath<猫咪, String> = \.名字
let writekeypath = \猫咪.名字
let closure: (猫咪) -> String = \.名字 // 写定类型是 closure
// print(cats.map(keypath)) // 报错原因是, 参数已经是一个 KeyPath,而 array 没有使用 KeyPath 的方法
print(cats.map(closure))

print(cats[keyPath: \.[0].名字])
var one = cats.first!
one[keyPath: writekeypath] = "Black"
print(one)

// 重载 filter 方法
extension Array {
    func filter(keyword: String, on paths: [KeyPath<Element, String>]) -> Self {
        filter { 资料 in
            paths.contains { path in
                let 属性资料 = 资料[keyPath: path]
                return 属性资料.contains(keyword)
            }
        }
    }
}

print(cats.filter { $0.名字.contains("黄") || $0.颜色.contains("黄") })
print(cats.filter(keyword: "黄", on: [\.名字, \.颜色]))

/*
  都是 Hashable的,可以当做字典的 key 或存在 Set 里面
 */

// 【ChaoCode】 Swift 中級篇 8：KeyPath 實作作業
//: 1. 在 Array 的 extension 中寫一個能把所有資料的某個 Double 屬性加總後算出平均值的方法。
extension Array {
    func average(_ path: KeyPath<Element, Double>) -> Double {
        var total = reduce(Double.zero) { $0 + $1[keyPath: path] }
        return total / Double(count)
    }
}

// ✨ 以下測試請自行完成，前面是 Array，然後是要計算哪個屬性的平均，最後 == 後面是預期結果，你只需要把中間文字的部分改成你設計的方法並放入 keyPath，然後確認兩邊相比結果是 true 即可

[100, 60, 5.0].average(\.self) == 55 // 這個就是平均數字本身
[長度單位(m: 3), 長度單位(m: 0.23), 長度單位(m: 935), 長度單位(m: 1130)].average(\.公尺) == 517.0575
[長度單位(m: 23), 長度單位(m: 32.311), 長度單位(m: 935), 長度單位(m: 113.0)].average(\.公分) == 27582.775
[長度單位(m: 9), 長度單位(m: 12321), 長度單位(m: 935), 長度單位(m: 1.130)].average(\.公里) == 3.3165325

/*: 2. 在 Sequence 的 extension 中寫一個透過某個屬性分類後回傳字典的方法。
 ```
 假設一筆資料是 [(name: "小芳", 性別: "女"), (name: "偉偉", 性別: "男"), (name: "芯宜", 性別: "女")]
 這筆資料用「性別」分類的話，回傳的字典結果就會是
 ["女": [(name: "小芳", 性別: "女"), (name: "芯宜", 性別: "女")], "男": [(name: "偉偉", 性別: "男")]]
 ```
 */
extension Sequence {
    func groupBy<Value: Hashable>(_ path: KeyPath<Element, Value>) -> [Value: [Element]] {
        var result = [Value: [Element]]()
        for item in self {
            result[item[keyPath: path], default: []].append(item)
        }
        return result
    }
}

print(spends.groupBy(\.類別))
print(spends.groupBy(\.付款方式))
print(movies.groupBy(\.類型))
