
// 【ChaoCode】 Swift 中級 1：Struct 實作作業
//enum Example: Comparable {
//    case a, b
//    case c(i: Int)
//    case d
//}
//let a = Example.d
//let b = Example.c(i: 3)
//let c = Example.c(i: 2)
//let d = Example.a
//print(c > d) // true
//let arr = [a, b, c, d]
//let arrSorted = arr.sorted()
//for i in arrSorted {
//    print(i.self)
//}

class C {
    var p: String
    init(_ p: String) {
        self.p = p
    }
    
    // 下标操作
    subscript(s: String) -> String {
        get {
            return p + s
        }
        set {
            p = s + newValue
        }
    }
}

let c = C("hi")
print(c.p)
print(c[" ming"])
c["k"] = "v"
print(c.p)

// 1️⃣ 建立一個名為「手機」的類型
struct 手機:Equatable {
    let  用戶姓名:String
    let 電話號碼:String
    private(set)  var 收件箱:[String] = []
    
    
    init(_ 用戶姓名:String,號碼:String) {
        self.用戶姓名 = 用戶姓名
        self.電話號碼 = 號碼
    }
    
    init(_ 姓名:String) {
        self.用戶姓名 = 姓名
        self.電話號碼 = Self.隨機號碼()
    }
    
    mutating  func 收到訊息(_ 訊息: String) {
        self.收件箱.append(訊息)
    }

   mutating func 轉移訊息(from 手機: 手機) {
    // 在現有收件箱中，新增引數的收件箱內容。引數的收件箱內容應在 Array 的前面。
       收件箱 = 手機.收件箱 + 收件箱
    }

    // 加入下列靜態方法
   static func 隨機號碼() -> String {
    // 方法內容不需改動
       "09" + Int.random(in: 10000000...99999999).description
    }
     
    static func == (lhs: Self  ,rhs: Self) -> Bool {
        return lhs.電話號碼 == rhs.電話號碼
    }

    
}
// 2️⃣ 設定屬性：用戶姓名 String、電話號碼 String、收件箱 [String]。
//            用戶姓名和電話號碼創建後不可更改。
//            收件箱預設為空，其他屬性沒有預設值，不能從外部更改。
// 3️⃣ 設定方法：
// 4️⃣ 設定兩個啟動方式：一個參數是用戶姓名和號碼；另一個參數是姓名，號碼是隨機產生。
// 5️⃣ 讓手機變成 Equatable，並且只比較「手機號碼」。


// 👇 你可以 uncomment 下面這行，嘗試檢查手機的收件箱是否能從外部更新，設定正確的話應該會顯示紅字報錯「Cannot assign to property: '收件箱' setter is inaccessible」。
// 手機("Test").收件箱 = []

// 👇 請勿修改下方 Code，你應該在上面建立好 struct 讓以下 Code 能順利執行。

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

// 💡 這個作業在錄影完後有更新，新增了一個基本練習題，還有第二題多了一個方便你對照利率的靜態屬性。你沒有下載錯~~🙈

// 1. 請根據下列要求設計「姓名」、「年紀」和「已成年」屬性。

struct Human {
private(set) var 姓: String
private(set) var 名: String

// 請用計算屬性設定姓名屬性，並加入 set 來改變姓名，將第一個字作為姓，剩下的作為名。
var 姓名

// 年紀是一個 Int 的儲存屬性，請加入屬性觀察，並在變化時改變「已成年」的值。
var 年紀: Int

// 請將已成年設為一個 lazy 屬性。
var 已成年 = false
}

// 👇 請勿刪除下列內容，印出來的內容應該要跟作業上提供的答案「完全一樣」。
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
//      第一年成長為 10,100 * 1.01% = 10,100 元；第二年則成長為 10,100 * 1.01% = 10,201
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
// 請勿刪除「HomeworkProtocol」，這個 Protocol 規範了這個作業需要的設計。
// 請設定啟動內容（請勿更改參數類型、參數和引數名稱）
init(_ 金額: Int, 年數: Int) {
  
}

// 靜態屬性 💡 你可以透過下面這些 Array 找對應利率，當然你也可以自己設計其他方式。
typealias 利率對照 = (最小金額: Int, 利率: Double)
typealias 年數加成對照 = (最小年數: Int, 利率: Double)

static let 基礎利率對照表: [利率對照] = [(10_000, 0.01), (80_000, 0.02), (200_000, 0.032), (1_000_000, 0.06)]
static let 年數利率加成對照: [年數加成對照] = [(6, 0.0015), (10, 0.002), (20, 0.012)]
}


// 👇 請勿刪除下列內容，描述沒有透過 function 檢查，所以請自行確認是否正確。記得要下載 checkHelper 才能執行。
let save = 定存(250000, 年數: 10)
print(save.描述)
利率檢查(type: 定存.self)




// 【ChaoCode】 Swift 中級 5：Optional 實作作業

// 這次作業有兩段，請跟著數字完成。第一段請先完成設計客戶資料的「屬性」，第二段請在下方找出要求的資料。
// ⚠️ 請不要使用 if 或 switch 語法。請使用這堂課教的 Optional 語法。（可以用 if let，它是 Optional 語法）

import Foundation

struct 客戶資料: Codable { // 請勿移除 Codable，此為讀取資料用
    
    let 姓氏: String?
    let 名字: String
    let 生日: 日期?
    
    let 郵遞區號: Int?
    let 城市: String?
    let 街道地址: String?
    
    let 備註: String?
    
    // 👇 請由此處開始設計以下「計算屬性」，請勿修改變數名稱。
    // 1️⃣ 姓名是姓氏和名字結合的 String，如沒有姓氏則直接印出名字
    var 姓名:String { 姓氏 ?? "" + 名字 }
    
    // 2️⃣ 地址是由郵遞區號、城市和街道地址結合的 String。客戶可能沒有填寫全部欄位，只顯示有寫的部分即可。若完全沒有任何地址資訊則回傳 nil。
    var 地址:String? {
        let addr = (郵遞區號?.description ?? "") + (城市 ?? "") + (街道地址 ?? "")
        return addr.isEmpty ? nil : addr
    }
    
    // 3️⃣ 請使用日期中的靜態屬性「today」計算年紀（Int），年紀用年份相減即可。如果沒有生日資料則回傳 nil。
    var 年紀:Int? {
            guard let 生日 = 生日 else {
                return nil
            }
        return 日期.today.year - 生日.year
        
    }
    
    // 4️⃣ 請使用日期中的靜態屬性「today」檢查客戶是否為本月壽星。如果沒有生日資料則直接回傳 false。
    var 是本月壽星:Bool{
        guard let 生日 = 生日 else {
            return false
        }
        return 日期.today.month == 生日.month
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
              let array = try? JSONDecoder().decode([銷售紀錄].self, from: data) else {
            print("❌ 無法分析資料，請確認是否有誤把「Codable」這個 Protocol 刪掉")
            return nil
        }
        
        return array
    }
}



func 尋找資料(本月銷售資料: [銷售紀錄]?) {
    // 👇 請由此處繼續編輯，根據敘述印出需要的內容，請嘗試至少使用一次 .compactMap()。
    let oldThan30:[銷售紀錄]? = 本月銷售資料?.filter{($0.客戶資料?.年紀 ?? 0 ) >= 30}
    // 5️⃣ 請找出在本月銷售資料中，年紀大於或等於 30 歲的客戶共有幾位。
    print("📊 大於 30 歲的客戶共 \( oldThan30?.count ?? 0 ) 位")
    
    // 6️⃣ 請找出在本月銷售資料中，這個月生日的客戶共有幾位，並印出他們的姓名、年齡和地址。如沒有地址資料則印出「無地址」。
    let birthGuest = 本月銷售資料?.filter({ $0.客戶資料?.是本月壽星 ?? false })
    print("🥳 本月壽星共 \( birthGuest?.count ?? 0 ) 位")
    
    birthGuest?.forEach{
        let message = "🎂\($0.客戶資料?.名字 ?? "no") \($0.客戶資料?.年紀 ?? 0)歲生日，地址：\($0.客戶資料?.地址 ?? "無地址")"
        print(message)
    }
    
    // 7️⃣ 請使用「if let」語法，印出所有訂單的備註和客戶資料的備註。
    本月銷售資料?.compactMap{
        if let 备注 = $0.備註 {
            print("🛒 訂單 \($0.訂單編號) 備註：\(备注 )")
        }
       

        if let 客户 = $0.客戶資料, let note = 客户.備註 {
            print("📝 顧客 \(客户.姓名) 備註： \(note)")
        }
    }
}

// ✋ 以下為測試，請勿編輯
print("———————— 測試 nil 資料...")
尋找資料(本月銷售資料: nil)
print("———————— 測試正常資料...")
尋找資料(本月銷售資料: 銷售紀錄.取得本月資料())

