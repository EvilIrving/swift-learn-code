import Foundation

/*
 建立protocol
 方法只要定义名称，参数，返回值
 描述如何设计某个东西
 可能是描述某种特性或一系列相关的功能
 */
protocol Equatabl {
    static func == (lhs: Self, rhs: Self) -> Bool
}

protocol 有基本资料: Equatable {
    // 使用Generic的方式
    associatedtype 密码: Hashable
    // 所有属性都用var宣告，只需要写名称，类型以及是否要能get set
    var 名字: String { get set }
    var 生日: Date { get }
    var 年龄: Int { get }
    var 密码: 密码 { get }
}

// 不能再extension中要求comform to 其他 protocol
extension 有基本资料 {
    var 年龄: Int {
        Date.now.year - 生日.year
    }

    // 但是可以通过加入预设的方法
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.名字 == rhs.名字
    }
}

extension Date {
    var year: Int {
        Calendar(identifier: .gregorian).dateComponents(in: .current, from: self).year!
    }
}

// 示例

struct 宝可梦: 可战斗 {
//    提供预设
    var name: String = "某个宝可梦"
    var hp: Int = 50
    var 最大hp: Int = 50
    var 攻击力: Int = 5
    var 等级: Int = 1
}

struct 邪恶外星人: 可战斗 {
    var name: String = "某个外星人"
    var hp: Int = 60
    var 最大hp: Int = 60
    var 攻击力: Int = 6
    var 等级: Int = 1

    var 武器: String = "🔫"
}

var 皮卡丘 = 宝可梦(name: "宝可梦")
// var 外星人: 可战斗 = 邪恶外星人()
var 外星人 = 邪恶外星人()

皮卡丘.升级()
皮卡丘.攻击(on: &外星人)

// Generic 示例
protocol 绝地 {
    associatedtype Level: Strideable where Level.Stride == Int

    var name: String { get }
    var hp: Int { get set }
    var 最大hp: Int { get set }
    var 攻击力: Int { get set }
//    var 等级: Int { get set }
    var 等级: Level { get set }
}

extension 绝地 {
    mutating func 休息() {
        hp = 最大hp
        print("\(name)恢复满血")
    }

    mutating func 升级() {
        最大hp = Int(Double(最大hp) * 1.1)
        攻击力 = Int(Double(攻击力) * 1.2)
        hp = 最大hp
        等级 = 等级.advanced(by: 1)
        print("\(name)升级到\(等级)")
    }

    func 攻击<T: 可战斗>(on target: inout T) {
        target.hp -= 攻击力
        print("\(target.name)被\(name)攻击，掉血\(攻击力)")
    }
}

struct 绝地武士: 绝地 {
    enum 阶级: Int, Strideable, CustomStringConvertible {
        var description: String {
            switch self {
            case .学徒:
                return "student"
            case .幼儿:
                return "child"
            case .武士:
                return "adult"
            case .大师:
                return "master"
            case .宗师:
                return "advanced master"
            }
        }

        func distance(to other: 绝地武士.阶级) -> Int {
            other.rawValue - rawValue
        }

        func advanced(by n: Int) -> 绝地武士.阶级 {
            let level = rawValue + n
            return 阶级(rawValue: level) ?? .宗师
        }

        // typealias Stride = Int

        case 幼儿, 学徒, 武士, 大师, 宗师
    }

    var name: String = "某个绝地武士"
    var hp: Int = 50
    var 最大hp: Int = 50
    var 攻击力: Int = 5
    var 等级: 阶级 = .幼儿
}

var 武士 = 绝地武士(name: "罗小黑")
武士.升级()
武士.升级()
武士.升级()
武士.升级()
武士.攻击(on: &皮卡丘)

// generic
protocol Cat {
    associatedtype breeds

    func whatBreeds(breed: breeds)
}

// 波斯猫
struct Persian: Cat {
    typealias breeds = String

    func whatBreeds(breed: String) { print(breed) }
}

// 伯曼猫
struct Birman: Cat {
    typealias breeds = Int

    func whatBreeds(breed: Int) { print(breed) }
}

// 没有 associatedtype 的 protocol 可以当做类型使用
/*
 protocol Animal {
     var name: String { get }
     func makeSound()
 }

 class Dog: Animal {
     var name: String

     init(name: String) { self.name = name }

     func makeSound() { print("汪汪汪!") }
 }

 class Cat: Animal {
     var name: String

     init(name: String) { self.name = name }

     func makeSound() { print("喵喵喵!") }
 }

 // 创建一个遵循Animal协议的实例
 let dog = Dog(name: "旺财")
 let cat = Cat(name: "小花")

 // 将动物实例存储在数组中
 let animals: [Animal] = [dog, cat]

 // 遍历动物数组并调用makeSound方法
 for animal in animals {
     animal.makeSound()
 }
 */

// 放在属性，参数，返回值的类型中，可以用 & 结合

protocol HasName: Equatable {
    var name: String { get }
}

struct 动物: HasName {
    var name: String
}

struct 美人鱼: HasName {
    var name: String
}

func doSome<T: HasName>(array: [T]) {}

// doSome函数的泛型参数T要求传入的数组元素类型必须遵循HasName协议，但传入的数组中包含了动物和美人鱼两个不同的类型。
// doSome(array: [动物(name: "🐱"), 美人鱼(name: "🐟")])

// let arr: [HasName] = []
//
// protocol HasAddress {
//    var address: String { get }
// }
//
//// 如果修改 HasName加上:Equatable就会报错
// let array: [HasName & HasAddress] = []

// 【ChaoCode】 Swift 中級篇 7：Protocol 實作作業 A
// ✨ 請閱讀完整份內容，了解使用情境後，跟著以下步驟設計一個能管理兩種隊伍的 protocol。
// 1️⃣ 請設計一個名為「有優先隊伍」的 protocol。
// ＊ conforms to 這個 protocol 的資料會有兩種隊伍，一種是優先隊伍、另一種是一般隊伍，並且知道要如何判斷什麼樣的資料能進優先隊伍。
// ＊ 這個 protocol 會提供兩種方法：
//      1. 第一種是「add」，它會接收「一個隊伍內容的參數」，並把他新增到合適的隊伍中。
//      2. 第二種是「next」，它不需要任何參數，會回傳一個 optional 的隊伍內容。假如兩個隊伍都是空的就回傳 nil。如果優先隊伍有人，就回傳優先隊伍的第一位，否則回傳一般隊伍的第一位。回傳之前記得刪除隊列內的資料並且印出下一位的資訊。

protocol 有優先隊伍 {
    associatedtype T

    var 优先队伍: [T] { get set }
    var 普通队伍: [T] { get set }

    mutating func add(_ player: T)
    mutating func next() -> T?
}

// ✋ 請勿修改玩家和病患這兩個類型。
struct 玩家: CustomStringConvertible {
    var 名字: String
    var 有快速通關: Bool
    var description: String { 名字 }
}

struct 病人: CustomStringConvertible {
    var 名字: String
    var 是急診: Bool
    var description: String { 名字 }
}

// 2️⃣ 請完成以下這兩個 struct，讓他們能 conforms to 你設計的「有優先隊伍」。
// ＊ 遊樂設施中的排隊內容會是玩家，有快速通關的可以進到優先隊伍；診所的排隊內容會是病人，是急診的會進到優先隊伍。
// ＊ 請確保它們都可以不輸入任何參數啟動（不輸入啟動時隊伍都會是空的）。
struct 遊樂設施: 有優先隊伍 {
    typealias T = 玩家

    var 优先队伍: [T] = []
    var 普通队伍: [T] = []

    mutating func add(_ 玩家: T) {
        if 玩家.有快速通關 {
            优先队伍.append(玩家)
        } else {
            普通队伍.append(玩家)
        }
    }

    mutating func next() -> T? {
        var 玩家: 玩家?
        if 优先队伍.isEmpty {
            玩家 = 普通队伍.removeFirst()
            print(">> 下一位是一般隊伍的 \(玩家!.名字)")
        } else if !普通队伍.isEmpty {
            玩家 = 优先队伍.removeFirst()
            print(">> 下一位是優先隊伍的 \(玩家!.名字)")
        } else {
            玩家 = nil
        }
        return 玩家
    }
}

struct 診所: 有優先隊伍 {
    typealias T = 病人
    var 优先队伍: [T] = []
    var 普通队伍: [T] = []

    mutating func add(_ 病人: T) {
        if 病人.是急診 {
            优先队伍.append(病人)
        } else {
            普通队伍.append(病人)
        }
    }

    mutating func next() -> T? {
        var 病人: 病人?
        if 优先队伍.isEmpty {
            病人 = 普通队伍.removeFirst()
            print(">> 下一位是一般隊伍的 \(病人!.名字)")
        } else if !普通队伍.isEmpty {
            病人 = 优先队伍.removeFirst()
            print(">> 下一位是優先隊伍的 \(病人!.名字)")
        } else {
            病人 = nil
        }
        return 病人
    }
}

// 3️⃣ 下面是測試，請勿修改。
var 大怒神 = 遊樂設施()
var allPlayer: [玩家] = [.init(名字: "約翰", 有快速通關: false), .init(名字: "馬可", 有快速通關: false), .init(名字: "亞妮", 有快速通關: true), .init(名字: "艾連", 有快速通關: false), .init(名字: "米卡莎", 有快速通關: false), .init(名字: "阿爾敏", 有快速通關: false), .init(名字: "萊納", 有快速通關: true), .init(名字: "柯尼", 有快速通關: false), .init(名字: "莎夏", 有快速通關: false), .init(名字: "貝爾托特", 有快速通關: true), .init(名字: "法蘭茲", 有快速通關: false), .init(名字: "漢娜", 有快速通關: false), .init(名字: "尤米爾", 有快速通關: true), .init(名字: "希斯特莉亞", 有快速通關: true)]

print("🎢 遊樂園測試...")
while !allPlayer.isEmpty {
    let nextGroup = allPlayer.prefix(2)
    nextGroup.forEach { _ in 大怒神.add(allPlayer.removeFirst()) }

    大怒神.next()
}

var 皮膚科 = 診所()
var allPatients: [病人] = [.init(名字: "艾維", 是急診: true), .init(名字: "萊拉", 是急診: false), .init(名字: "泰勒", 是急診: false), .init(名字: "格雷森", 是急診: false), .init(名字: "艾登", 是急診: false), .init(名字: "安娜", 是急診: false), .init(名字: "金斯頓", 是急診: false), .init(名字: "埃莉諾", 是急診: false), .init(名字: "艾莉", 是急診: true), .init(名字: "阿貝爾", 是急診: false), .init(名字: "亞瑟", 是急診: true)]

print("🏥 看診測試...")
while !allPatients.isEmpty {
    let nextGroup = allPatients.prefix(2)
    nextGroup.forEach { _ in 皮膚科.add(allPatients.removeFirst()) }

    皮膚科.next()
}


//【ChaoCode】 Swift 中級篇 7：Protocol 實作作業 A 參考答案
/*
 
 protocol 有優先隊伍 {
 associatedtype 排隊內容
 var 一般隊伍: [排隊內容] { get set }
 var 優先隊伍: [排隊內容] { get set }

 func 優先判斷(_: 排隊內容) -> Bool
 }

 extension 有優先隊伍 {
 mutating func add(_ 內容: 排隊內容) {
   switch 優先判斷(內容) {
       case true:
           優先隊伍.append(內容)
       case false:
           一般隊伍.append(內容)
   }
 }

 mutating func next() -> 排隊內容? {
   if let next = 優先隊伍.first {
       print(">> 下一位是優先隊伍的\(next)")
       return 優先隊伍.removeFirst()
   }
   
   if let next = 一般隊伍.first {
       print(">> 下一位是一般隊伍的\(next)")
       return 一般隊伍.removeFirst()
   }
   
   return nil
 }
 }

 // ✋ 請勿修改玩家和病患這兩個類型。
 struct 玩家: CustomStringConvertible {
 var 名字: String
 var 有快速通關: Bool
 var description: String { 名字 }
 }

 struct 病人: CustomStringConvertible {
 var 名字: String
 var 是急診: Bool
 var description: String { 名字 }
 }

 // 2️⃣ 請完成以下這兩個 struct，讓他們能 conforms to 你設計的「有優先隊伍」。
 // ＊ 遊樂設施中的排隊內容會是玩家，有快速通關的可以進到優先隊伍；診所的排隊內容會是病人，是急診的會進到優先隊伍。
 // ＊ 請確保它們都可以不輸入任何參數啟動（不輸入啟動時隊伍都會是空的）。
 struct 遊樂設施: 有優先隊伍 {
 var 一般隊伍: [玩家] = []
 var 優先隊伍: [玩家] = []

 func 優先判斷(_ 玩家: 玩家) -> Bool { 玩家.有快速通關 }
 }

 struct 診所: 有優先隊伍 {
 var 一般隊伍: [病人] = []
 var 優先隊伍: [病人] = []

 func 優先判斷(_ 病人: 病人) -> Bool { 病人.是急診 }
 }


 // 3️⃣ 下面是測試，請勿修改。
 var 大怒神 = 遊樂設施()
 var allPlayer: [玩家] = [.init(名字: "約翰", 有快速通關: false), .init(名字: "馬可", 有快速通關: false), .init(名字: "亞妮", 有快速通關: true), .init(名字: "艾連", 有快速通關: false), .init(名字: "米卡莎", 有快速通關: false), .init(名字: "阿爾敏", 有快速通關: false), .init(名字: "萊納", 有快速通關: true), .init(名字: "柯尼", 有快速通關: false), .init(名字: "莎夏", 有快速通關: false), .init(名字: "貝爾托特", 有快速通關: true), .init(名字: "法蘭茲", 有快速通關: false), .init(名字: "漢娜", 有快速通關: false), .init(名字: "尤米爾", 有快速通關: true), .init(名字: "希斯特莉亞", 有快速通關: true)]

 print("🎢 遊樂園測試...")
 while !allPlayer.isEmpty {
 let nextGroup = allPlayer.prefix(2)
 nextGroup.forEach { _ in 大怒神.add(allPlayer.removeFirst()) }

 大怒神.next()
 }

 var 皮膚科 = 診所()
 var allPatients: [病人] = [.init(名字: "艾維", 是急診: true),.init(名字: "萊拉", 是急診: false),.init(名字: "泰勒", 是急診: false),.init(名字: "格雷森", 是急診: false),.init(名字: "艾登", 是急診: false),.init(名字: "安娜", 是急診: false),.init(名字: "金斯頓", 是急診: false),.init(名字: "埃莉諾", 是急診: false),.init(名字: "艾莉", 是急診: true),.init(名字: "阿貝爾", 是急診: false),.init(名字: "亞瑟", 是急診: true)]

 print("🏥 看診測試...")
 while !allPatients.isEmpty {
 let nextGroup = allPatients.prefix(2)
 nextGroup.forEach { _ in 皮膚科.add(allPatients.removeFirst()) }

 皮膚科.next()
 }
 */


