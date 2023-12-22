import Foundation

// 【ChaoCode】 Swift 中級 1：Struct 實作作業
struct 手機: Equatable {
    let 用戶姓名: String
    let 電話號碼: String
    private(set) var 收件箱: [String] = []

    init(_ 用戶姓名: String, 號碼: String) {
        self.用戶姓名 = 用戶姓名
        self.電話號碼 = 號碼
    }

    init(_ 姓名: String) {
        self.用戶姓名 = 姓名
        self.電話號碼 = Self.隨機號碼()
    }

    mutating func 收到訊息(_ 訊息: String) {
        收件箱.append(訊息)
    }

    mutating func 轉移訊息(from 手機: 手機) {
        // 在現有收件箱中，新增引數的收件箱內容。引數的收件箱內容應在 Array 的前面。
        收件箱 = 手機.收件箱 + 收件箱
    }

    // 加入下列靜態方法
    static func 隨機號碼() -> String {
        // 方法內容不需改動
        "09" + Int.random(in: 10_000_000 ... 99_999_999).description
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.電話號碼 == rhs.電話號碼
    }
}

var 我的號碼 = 手機("Jane", 號碼: "0912345678")
我的號碼.收到訊息("寶貝：在幹麻")
我的號碼.收到訊息("媽媽：早安")

var 隨機新號碼 = 手機("Jane")
隨機新號碼.收到訊息("系統通知：您的號碼已開啟所有服務。")
隨機新號碼.轉移訊息(from: 我的號碼)
print("\(隨機新號碼.用戶姓名) 的新號碼：\(隨機新號碼.電話號碼)")
print(隨機新號碼.收件箱)

print("隨機號碼 \(手機.隨機號碼())")
let 我的號碼測試 = 手機("Amy", 號碼: "0912345678")
print("結果應為 true：\(我的號碼 == 我的號碼測試)")

// 【ChaoCode】 Swift 中級 2：計算屬性 Computed Property & 屬性觀察 Property Observers 實作作業

// 1. 請根據下列要求設計「姓名」、「年紀」和「已成年」屬性。

struct Human {
    private(set) var 姓: String
    private(set) var 名: String

    // 請用計算屬性設定姓名屬性，並加入 set 來改變姓名，將第一個字作為姓，剩下的作為名。
    var 姓名: String {
        set(name) {
//                   var name = name
//                   姓 = String(name.removeFirst())
//                   名 = name

            姓 = String(name.prefix(1))
            名 = String(name[
                name.index(name.startIndex, offsetBy: 1) ... name.index(before: name.endIndex)
            ]
            )
        }

        get {
            return 姓 + 名
        }
    }

    // 年紀是一個 Int 的儲存屬性，請加入屬性觀察，並在變化時改變「已成年」的值。
    var 年紀: Int {
        willSet {
//            已成年 = 是否成年(newValue)
        }

        didSet {
            已成年 = 是否成年(年紀)
        }
    }

    private(set) lazy var 已成年: Bool = 是否成年(年紀)

    func 是否成年(_ 年紀: Int) -> Bool {
        print(年紀 > 17, 年紀)
        return 年紀 > 17
    }
}

var human = Human(姓: "", 名: "", 年紀: 14)
human.姓名 = "楊過"
print(human)
print("\(human.姓名)\(human.已成年 ? "已成年" : "未成年")")

human.姓名 = "小龍女"
human.年紀 = 18
print(human)
print("\(human.姓名)\(human.已成年 ? "已成年" : "未成年")")

// 2. 請根據以下規定設計一個 struct 名為「定存」的類型。
// 💡 你可以假設金額一定大於等於一萬元，年數一定大於等於六年。不考慮二進位和十進位落差。
// ＊請設計「金額」和「年數」這兩個屬性，表示定存的金額和時間長度，兩者類型皆為 Int，必須是可以被 set 和 get 的屬性。
// ＊請設計「期滿領回」屬性表示最後能拿回的金額。每年複利計算。結果請轉為 Int，無條件捨去小數位。
//      例如：存 10,000 元， 1 % 年利率。
//      第一年成長為 10,000 * 101% = 10,100 元；第二年則成長為 10,100 * 101% = 10,201
// ＊請設計「報酬率」屬性表示最後的賺到的比例，這是一個 Double 的類型。
//      例如：存 10,000 元， 1 % 年利率，存 2 年，最後得到 10,201，報酬率就是 201 / 10000 = 0.0201。
// ＊請設計一個「描述」屬性來敘述這筆定存內容將上述四個屬性都印出，報酬率顯示方式沒有限制。
//      例如："定存 10000 元，2 年後可領回 10201 元，總報酬率為 2.01%。"

// ＊年利率計算方式為 基本利率 + 加成利率，這兩個利率的計算方式如下：
//      基本利率：存款金額大於等於 10,000 元為 1 %；大於等於 80_000 元為 2 %；大於等於 200_000 元為 3.2 %；大於等於 1_000_000 元為 6 %。
//      加成利率：年份大於等於 6 年為 0.15 %；大於等於 10 年為 0.2 %；大於等於 20 年為 1.2 %。
//      例如：存 20,000 元 10 年就會是基本利率 1 % + 加成利率 0.2 %，年利率就是 1.2 %。
// ＊只要符合上述條件並且最後檢查沒問題即可，但希望你能至少用到一個 computed property。

struct 定存: HomeworkProtocol {
    var 金額: Int

    var 年數: Int

    var 期滿領回: Int {
        let rate = getRate(金額, 年數)
        return Int(getMoney(money: Double(金額), year: 年數, rate: rate))
    }

    var 報酬率: Double { Double(期滿領回 - 金額) / Double(金額) }

    var 描述: String {
        "定存 \(金額) 元，\(年數) 年後可領回 \(期滿領回) 元，總報酬率為 \(String(format: "%.3f", 報酬率 * 100)) %。"
    }

    // 請設定啟動內容（請勿更改參數類型、參數和引數名稱）
    init(_ 金額: Int, 年數: Int) {
        self.金額 = 金額
        self.年數 = 年數
    }

    // 靜態屬性 💡 你可以透過下面這些 Array 找對應利率，當然你也可以自己設計其他方式。
    typealias 利率對照 = (最小金額: Int, 利率: Double)
    typealias 年數加成對照 = (最小年數: Int, 利率: Double)

    static let 基礎利率對照表: [利率對照] = [(10_000, 0.01), (80_000, 0.02), (200_000, 0.032), (1_000_000, 0.06)]
    static let 年數利率加成對照: [年數加成對照] = [(6, 0.0015), (10, 0.002), (20, 0.012)]

    func getRate(_ base: Int, _ plus: Int) -> Double {
        var baseRate: Double
        switch base {
        case 10_000 ..< 80_000:
            baseRate = 0.01
        case 80_000 ..< 200_000:
            baseRate = 0.02
        case 200_000 ..< 1_000_000:
            baseRate = 0.032
        case 1_000_000...:
            baseRate = 0.06
        default:
            baseRate = 0.0
        }

        var plusRate: Double
        switch plus {
        case 6 ..< 10:
            plusRate = 0.0015
        case 10 ..< 20:
            plusRate = 0.002
        case 20...:
            plusRate = 0.012
        default:
            plusRate = 0.0
        }

        return baseRate + plusRate
    }

    func getMoney(money: Double, year: Int, rate: Double) -> Double {
        if year == 0 { return money }
        return getMoney(money: money + money * rate, year: year - 1, rate: rate)
    }
}

// 答案
// struct 定存: HomeworkProtocol {
//    var 金額: Int { didSet { 更新利率() } }
//    var 年數: Int { didSet { 更新利率() } }
//    private(set) var 年利率: Double = .zero
//
//    // computed property
//    var 期滿領回: Int {
//        let money = (0..<年數).reduce(Double(金額)) { money, _ in money * (1 + 年利率) }
//        return Int(money)
//    }
//    var 報酬率: Double { Double(期滿領回 - 金額) / Double(金額) }
//    var 描述: String { "定存 \(金額) 元，\(年數) 年後可領回 \(期滿領回) 元，總報酬率為 \(String(format: "%.3f %%", 報酬率 * 100))。" }
//
//    // 啟動
//    init(_ 金額: Int, 年數: Int) {
//        self.金額 = 金額
//        self.年數 = 年數
//        更新利率()
//    }
//
//    // 方法
//    private mutating func 更新利率() {
//        let base = Self.基礎利率對照表.last { 金額 >= $0.最小金額 }!.利率
//        let bonus = Self.年數利率加成對照.last { 年數 >= $0.最小年數 }!.利率
//        年利率 = base + bonus
//    }
//
//    // 靜態屬性
//    typealias 利率對照 = (最小金額: Int, 利率: Double)
//    typealias 年數加成對照 = (最小年數: Int, 利率: Double)
//
//    static let 基礎利率對照表: [利率對照] = [(10_000, 0.01), (80_000, 0.02), (200_000, 0.032), (1_000_000, 0.06)]
//    static let 年數利率加成對照: [年數加成對照] = [(6, 0.0015), (10, 0.002), (20, 0.012)]
// }

let save = 定存(250_000, 年數: 10)
print(save.描述)
利率檢查(type: 定存.self)

/*:
 ### 【ChaoCode】 Swift 中級篇 3：Property Wrapper 作業
  ---
 1. 設定一個名為 Trimmed 的屬性包裝，功能是把文字的前後空白或換行移除。
     * 限制：wrappedValue 需為儲存屬性（Stored Property）。
     * 💡 你可以使用 String 裡的 .trimmingCharacters 方法。
  ---
 */
struct Trimmed {}

/*:
 ---
 2. 設定一個名為 Log 的屬性包裝，功能是在每次存取或是更改時印出通知。
     * 可搭配任何屬性使用，需要提供一個名為「描述」的 String 參數。
     * 在存取時印出「🔍 存取\(描述)...」
     * 在修改時印出「✏️ \(描述)的值改為 ＯＯＯ」
     * 請定義 init 啟動方法，請勿修改下方提供的參數名稱和引數名稱。
  ---
 */

struct Log<T> {
    init(wrappedValue: T, 描述: String) {}
}

/*:
 ---
 3. 設定一個名為 Percentage 的屬性包裝，功能是把 Double 數字，透過 projectedValue 用百分比的文字顯示。
    - 需要提供一個名為「小數點位數」的 Int 參數，預設為 2，以該位數四捨五入後顯示，小數點位數不應小於 2。
        ```
         例如：0.18532 小數點位數小於 2 位數都應顯示 18%；小數點位數 3 位應顯示 18.5%。
        ```
    - 請使用 NumberFormatter 或 .formatted 來處理進位和文字轉換。
    - 使用 swift 自動產生的啟動，不自行定義 init。並確保以下兩種提供 wrappedValue 的方式都能執行。
        ```
        @Percentage(小數點位數: 3) var a = 0.2231
        @Percentage(wrappedValue: 0.338, 小數點位數: 3) var b
        ```
 ---
 */

struct Percentage {}

enum 感情狀態: CustomStringConvertible {
    var description: String {
        switch self {
        case .單身:
            return "single"
        case .穩定交往中(伴侶: let 伴侶):
            return "relation with \(伴侶)"
        case .已婚(伴侶: let 伴侶):
            return "married with \(伴侶)"
        case .開放式關係:
            return "open relation"
        case .一言難盡:
            return "cant say"
        }
    }

    case 單身, 穩定交往中(伴侶: String), 已婚(伴侶: String), 開放式關係, 一言難盡
}

print(感情狀態.單身)
print(感情狀態.一言難盡)
print(感情狀態.開放式關係)
print(感情狀態.已婚(伴侶: "結衣"))
print(感情狀態.穩定交往中(伴侶: "哈利"))

/*:
 ---
 2. 請根據下列需求設計以下兩個 enum 和一個 struct。
 * 讓 Card 根據大老二的規則比大小（Comparable）。\
 ```- 先比數字大小，數字一樣時再比花色。```\
 ```- 數字大小 2 > ace > king> queen> jack > 10, 9, 8, 7, 6, 5, 4, 3```\
 ```- 同數字時比較花色，黑桃 > 紅心 > 方塊 > 梅花```
 * 讓 Card 被印出來時印出花色表情 + 全形文字。對印文字如下：\
 ```花色：黑桃 ♠️、紅心 ♥️、方塊 ♦️、梅花 ♣️```\
 ```數字：Ａ、２、３、４、５、６、７、８、９、１０、Ｊ、Ｑ、Ｋ```
 * 請勿修改 case 名稱（你可以調整順序）和屬性名稱，也不要增加自訂的啟動方式。
 ```
 例如：紅心 12 應印出♥️Ｑ
 ```
 ---
 */

enum 卡牌花色: Int, Comparable, CustomStringConvertible {
    static func < (lhs: 卡牌花色, rhs: 卡牌花色) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    case 梅花, 方塊, 紅心, 黑桃

//    var rawValue: Int {
//        switch self {
//        case .黑桃:
//            return 4
//        case .紅心:
//            return 3
//        case .方塊:
//            return 2
//        case .梅花:
//            return 1
//        }
//    }
//
//    init(rawValue: Int) {
//        switch rawValue {
//        case 4:
//            self = .黑桃
//        case 3:
//            self = .紅心
//        case 2:
//            self = .方塊
//        default:
//            self = .梅花
//        }
//    }
//
//    static var allCases: [卡牌花色] = [.梅花, .方塊, .紅心, .黑桃]

    var description: String {
        switch self {
        case .黑桃:
            return "♠️"
        case .紅心:
            return "♥️"
        case .方塊:
            return "♦️"
        case .梅花:
            return "♣️"
        }
    }
}

enum 卡牌數字: Int, Comparable, CustomStringConvertible {
    static func < (lhs: 卡牌數字, rhs: 卡牌數字) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

    case three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace, two

//    static var allCases: [卡牌數字] = [three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace, two]

    var description: String {
        switch self {
        case .three:
            return "３"
        case .four:
            return "4"
        case .five:
            return "５"
        case .six:
            return "６"
        case .seven:
            return "７"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .ten:
            return "１０"
        case .jack:
            return "Ｊ"
        case .queen:
            return "Ｑ"
        case .king:
            return "Ｋ"
        case .ace:
            return "Ａ"
        case .two:
            return "２"
        }
    }

//    init(rawValue: Int) {
//        switch rawValue {
//        case 3:
//            self = .three
//        case 4:
//            self = .four
//        case 5:
//            self = .five
//        case 6:
//            self = .six
//        case 7:
//            self = .seven
//        case 8:
//            self = .eight
//        case 9:
//            self = .nine
//        case 10:
//            self = .ten
//        case 11:
//            self = .jack
//        case 12:
//            self = .queen
//        case 13:
//            self = .king
//        case 14:
//            self = .ace
//        default:
//            self = .two
//        }
//    }
//
//    var rawValue: Int {
//        switch self {
//        case .three:
//            return 3
//        case .four:
//            return 4
//        case .five:
//            return 5
//        case .six:
//            return 6
//        case .seven:
//            return 7
//        case .eight:
//            return 8
//        case .nine:
//            return 9
//        case .ten:
//            return 10
//        case .jack:
//            return 11
//        case .queen:
//            return 12
//        case .king:
//            return 13
//        case .ace:
//            return 14
//        case .two:
//            return 15
//        }
//    }
//
//    typealias RawValue = Int
}

struct Card: Comparable, CustomStringConvertible {
    var 花色: 卡牌花色
    var 數字: 卡牌數字

    var description: String {
        花色.description + 數字.description
    }

//    static func == (lhs: Card, rhs: Card) -> Bool {
//        return lhs.數字 == rhs.數字 && lhs.花色 == rhs.花色
//    }

    static func < (lhs: Card, rhs: Card) -> Bool {
        if lhs.數字 < rhs.數字 { return true }

        return lhs.數字 == rhs.數字 && lhs.花色 < rhs.花色
    }
}

func testCard() {
    let testCases = [(Card(花色: .紅心, 數字: .ace), Card(花色: .黑桃, 數字: .nine), true, "♥️Ａ"),
                     (Card(花色: .梅花, 數字: .two), Card(花色: .梅花, 數字: .queen), true, "♣️２"),
                     (Card(花色: .梅花, 數字: .ace), Card(花色: .梅花, 數字: .three), true, "♣️Ａ"),
                     (Card(花色: .黑桃, 數字: .ten), Card(花色: .黑桃, 數字: .nine), true, "♠️１０"),
                     (Card(花色: .方塊, 數字: .queen), Card(花色: .黑桃, 數字: .ten), true, "♦️Ｑ"),
                     (Card(花色: .梅花, 數字: .king), Card(花色: .紅心, 數字: .king), false, "♣️Ｋ"),
                     (Card(花色: .紅心, 數字: .two), Card(花色: .紅心, 數字: .king), true, "♥️２"),
                     (Card(花色: .梅花, 數字: .six), Card(花色: .梅花, 數字: .ace), false, "♣️６"),
                     (Card(花色: .方塊, 數字: .six), Card(花色: .黑桃, 數字: .two), false, "♦️６"),
                     (Card(花色: .紅心, 數字: .three), Card(花色: .梅花, 數字: .seven), false, "♥️３"),
                     (Card(花色: .紅心, 數字: .five), Card(花色: .黑桃, 數字: .seven), false, "♥️５"),
                     (Card(花色: .梅花, 數字: .ace), Card(花色: .紅心, 數字: .three), true, "♣️Ａ"),
                     (Card(花色: .梅花, 數字: .five), Card(花色: .紅心, 數字: .five), false, "♣️５"),
                     (Card(花色: .方塊, 數字: .king), Card(花色: .黑桃, 數字: .four), true, "♦️Ｋ"),
                     (Card(花色: .梅花, 數字: .ace), Card(花色: .黑桃, 數字: .queen), true, "♣️Ａ"),
                     (Card(花色: .黑桃, 數字: .seven), Card(花色: .方塊, 數字: .seven), true, "♠️７"),
                     (Card(花色: .紅心, 數字: .jack), Card(花色: .梅花, 數字: .eight), true, "♥️Ｊ"),
                     (Card(花色: .方塊, 數字: .jack), Card(花色: .方塊, 數字: .queen), false, "♦️Ｊ"),
                     (Card(花色: .梅花, 數字: .jack), Card(花色: .紅心, 數字: .four), true, "♣️Ｊ")]
    for testCase in testCases {
        if String(describing: testCase.0) != testCase.3 {
            print("❌ 您印出的是\(String(describing: testCase.0))，應印出 \(testCase.3)")
            break
        }
    }

    for test in testCases {
        if (test.0 > test.1) != test.2 {
            let answer = test.2 ? "小於" : "大於"
            print("❌ \(test.0) 應\(answer) \(test.1)")
            break
        }
    }
    print("✅ 您的卡牌設計沒有問題。")
}

testCard()

// 字符串转 Int Double

var intStr = "573", DoubleStr = "5.4f5"
var transferInt = 0

let number = Int(intStr), numberDou = Double(DoubleStr)

print(number ?? 1)
print(numberDou ?? 0.1)

// Int 转字符串 Double

let intNumber = 12
// 转字符串
// "\(intNumber)"
// String(intNumber)

print(intNumber.description, Double(intNumber))

// Double 转 Int 字符串 转百分比 保留小数

var doub = 89.8, doub2 = 0.9878

// String(format:"%.2f",doub) 四舍五入

let numberF = NumberFormatter()
numberF.maximumFractionDigits = 1 // 四舍五入
numberF.numberStyle = .percent

print(
    Int(doub),
    String(doub),
    numberF.string(for: doub2) ?? 0.1,
    String(format: "%.2f", doub),
    separator: ", ")

// 日期
extension Date {
    /**
     *  是否为今天
     */
    func isToday() -> Bool {
        let calendar = Calendar.current
        let unit: Set<Calendar.Component> = [.day, .month, .year]
        let nowComps = calendar.dateComponents(unit, from: Date())
        let selfCmps = calendar.dateComponents(unit, from: self)

        return (selfCmps.year == nowComps.year) &&
            (selfCmps.month == nowComps.month) &&
            (selfCmps.day == nowComps.day)
    }

    /**
     *  是否为昨天
     */
    func isYesterday() -> Bool {
        let calendar = Calendar.current
        let unit: Set<Calendar.Component> = [.day, .month, .year]
        let nowComps = calendar.dateComponents(unit, from: Date())
        let selfCmps = calendar.dateComponents(unit, from: self)
        if selfCmps.day == nil || nowComps.day == nil {
            return false
        }
        let count = nowComps.day! - selfCmps.day!
        return (selfCmps.year == nowComps.year) &&
            (selfCmps.month == nowComps.month) &&
            (count == 1)
    }

    /// 只有年月日的字符串
    func dataWithYMD() -> String {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        let selfStr = fmt.string(from: self)
        let result = fmt.date(from: selfStr)!
        print(result)
        return selfStr
    }

    /// 获取当前年月日的时间戳
    func timeIntervalWithYMDDate() -> TimeInterval {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        let selfStr = fmt.string(from: self)
        let result = fmt.date(from: selfStr)!
        return result.timeIntervalSinceReferenceDate + 24 * 60 * 60
    }

    /**
     *  是否为今年
     */
    func isThisYear() -> Bool {
        let calendar = Calendar.current
        let nowCmps = calendar.dateComponents([.year], from: Date())
        let selfCmps = calendar.dateComponents([.year], from: self)
        let result = nowCmps.year == selfCmps.year
        return result
    }

    /**
     *  获得与当前时间的差距
     */
    func deltaWithNow() -> DateComponents {
        let calendar = Calendar.current
        let cmps = calendar.dateComponents([.hour, .minute, .second], from: self, to: Date())
        return cmps
    }
}

let today = Date()
let calenda = Calendar.current.dateComponents(in: TimeZone.current, from: today)
let weekday = calenda.weekday!, month = calenda.month!
print(weekday, calenda)

let dateFor = DateFormatter()
dateFor.dateFormat = "EEEE"
let weekDay = dateFor.string(from: today)
dateFor.dateFormat = "M"
let monthNumber = dateFor.string(from: today)
print(monthNumber)

let calendarCur = Calendar.current
print(calendarCur.component(.weekday, from: today), calendarCur.component(.month, from: today))

print(today.isToday(), today.isYesterday(), today.isThisYear(), today.dataWithYMD())

class User {
    var id: Int
    var name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

// 【ChaoCode】 Swift 中級 5：Optional 實作作業

struct 客戶資料: Codable { // 請勿移除 Codable，此為讀取資料用
    let 姓氏: String?
    let 名字: String
    let 生日: 日期?

    let 郵遞區號: Int?
    let 城市: String?
    let 街道地址: String?

    let 備註: String?

    var 姓名: String {
        return 姓氏 ?? "" + 名字
    }

    // 2️⃣ 地址是由郵遞區號、城市和街道地址結合的 String。客戶可能沒有填寫全部欄位，只顯示有寫的部分即可。若完全沒有任何地址資訊則回傳 nil。
    var 地址: String? {
        guard let 郵遞區號 = 郵遞區號, let 城市 = 城市, let 街道地址 = 街道地址 else {
            return nil
        }

        return 郵遞區號.description + 城市 + 街道地址
    }

    // 3️⃣ 請使用日期中的靜態屬性「today」計算年紀（Int），年紀用年份相減即可。如果沒有生日資料則回傳 nil。
    var 年紀: Int? {
        guard let 生日 = 生日 else {
            return nil
        }

        return 日期.today.year - 生日.year
    }

    // 4️⃣ 請使用日期中的靜態屬性「today」檢查客戶是否為本月壽星。如果沒有生日資料則直接回傳 false。
    var 是本月壽星: Bool {
        guard let 生日 = 生日 else {
            return false
        }
        return 生日.month == 日期.today.month
    }
}

struct 銷售紀錄: Codable {
    let 訂單編號: Int
    let 消費金額: Int
    let 客戶資料: 客戶資料?
    let 備註: String?

    static func 取得本月資料() -> [銷售紀錄]? {
        guard let url = Bundle.main.url(forResource: "swift205_sellData", withExtension: "dta") else {
            print("❌ 無法讀取資料，請確認是否已經把「swift205_sellData.dta」檔案放入 Resources")
            return nil
        }

        guard let data = try? Data(contentsOf: url),
              let array = try? JSONDecoder().decode([銷售紀錄].self, from: data)
        else {
            print("❌ 無法分析資料，請確認是否有誤把「Codable」這個 Protocol 刪掉")
            return nil
        }

        return array
    }
}

func 尋找資料(本月銷售資料: [銷售紀錄]?) {
    // 5️⃣ 請找出在本月銷售資料中，年紀大於或等於 30 歲的客戶共有幾位。
    let oldThan30: [銷售紀錄]? = 本月銷售資料?.filter { ($0.客戶資料?.年紀 ?? 0) >= 30 }
    print("📊 大於 30 歲的客戶共 \(oldThan30?.count ?? 0) 位")

    // 6️⃣ 請找出在本月銷售資料中，這個月生日的客戶共有幾位，並印出他們的姓名、年齡和地址。如沒有地址資料則印出「無地址」。
    let birthGuest = 本月銷售資料?.filter { $0.客戶資料?.是本月壽星 ?? false }
    print("🥳 本月壽星共 \(birthGuest?.count ?? 0) 位")

    birthGuest?.forEach {
        let message = "🎂\($0.客戶資料?.名字 ?? "no") \($0.客戶資料?.年紀 ?? 0)歲生日，地址：\($0.客戶資料?.地址 ?? "無地址")"
        print(message)
    }

    // 7️⃣ 請使用「if let」語法，印出所有訂單的備註和客戶資料的備註。
    本月銷售資料?.compactMap {
        if let 备注 = $0.備註 {
            print("🛒 訂單 \($0.訂單編號) 備註：\(备注)")
        }

        if let 客户 = $0.客戶資料, let note = 客户.備註 {
            print("📝 顧客 \(客户.姓名) 備註： \(note)")
        }
    }
}

//// ✋ 以下為測試，請勿編輯
print("———————— 測試 nil 資料...")
尋找資料(本月銷售資料: nil)
print("———————— 測試正常資料...")
尋找資料(本月銷售資料: 銷售紀錄.取得本月資料())
//: ### 【【ChaoCode】 Swift 中級 6：Extension 實作作業

/*: 1. 新增以下兩個功能到 String 中：
    * 名為「trimmed」的方法，功能是回傳把前後的空白和換行都移除的 String。
    * 新增可以放入 ClosedRange<Int> 做為 Index 的 subscript，只需設定 get，回傳對應位置的 String，如超過範圍則回傳一個空的 String。這個 subscript 不需要引數名稱，你可以假設 ClosedRange 中不會有負數。
    ```例如："ABCD"[1...2] 應回傳 "BC"。```
 */
extension String {
    func trimmed() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }

    subscript(_ range: ClosedRange<Int>) -> String? {
        if range.lowerBound > count - 1 { return "" }

        var curIdx = 0, str = ""

        for character in self {
            if range.contains(curIdx) {
                str += String(character)
            }
            curIdx += 1

            if curIdx > range.upperBound { break }
        }

        return str
    }

//    单个 下标
//    subscript(_ offset: Int) -> Character? {
//        guard offset >= 0, let index = index(startIndex,
//                                             offsetBy: offset - 1,
//                                             limitedBy: index(before: endIndex))
//        else {
//            return nil
//        }
//        return self[index]
//    }
}

// stringExtensionCheck(trimmed: { $0.trimmed() }) { $0[$1] }

/*: 2. 為 Collection 新增一個名為「prettyPrint」的方法，功能是印出每一個 Element 並用「、」分隔。
 ```例如：[1,2,3,4] 應印出 "1、2、3、4"。```
 */

extension Collection {
    func prettyPrint() {
        print(map { String(describing: $0) }, separator: ", ")
    }
}

// 👇 下面這些提供你測試，請自行檢查印出來的結果。
print("-------------------------")
"我吃飽了".prettyPrint()
Set([1, 2, 3, 4]).prettyPrint()
["貓咪", "狗狗", "兔兔"].prettyPrint()
["貓咪": 3, "狗狗": 5, "兔兔": 10].prettyPrint()
[(), ()].prettyPrint()

/*: 3. 為 Element 有 conforms to Hashable 的 Array 新增名為「unique」的方法。功能是只留下沒有重複的值（需維持原本順序）。
    * 假如 Element 是 String 的話，必須把 String trimmed 後判斷是否為空，如果是空的話也不留下。（trimmed 指的是第一題完成的方法）
    ```
        ["abc", "abc", ""].unique() 應回傳 ["abc"]。
        [2, 3, 2, 1].unique() 應回傳 [2, 3, 1]。
    ```
 */

// ✋ 下面內容為測試用，請勿修改，並且在此行上方完成這題。
// ⚠️ 假如你的 extension 沒有設好或者名稱用不一樣的會無法執行。

print("-------------------------")

extension Array where Element: Hashable {
    func unique() -> Self {
        var uniqueMap = [Element: Bool]()

        return filter {
            uniqueMap.updateValue(true, forKey: $0) == nil
        }
    }
}

extension Array where Element == String {
    func unique() -> Self {
        var uniqueMap = [String: Bool]()

        return map { $0.trimmed() }.filter {
            uniqueMap.updateValue(true, forKey: $0.trimmed()) == nil && !$0.isEmpty
        }
    }
}

arrayExtensionCheck(uniqueString: { $0.unique() }) { $0.unique() }
