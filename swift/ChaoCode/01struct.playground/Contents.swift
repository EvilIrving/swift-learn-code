// Struct 基本介紹
// Value Type & Reference Type 差別
// Struct 基本介紹
// 建立 Struct
// 設定屬性
// 設定方法
// mutating
// 設定靜態屬性和方法
// 預設啟動方式
// 自訂啟動方式
// 私有屬性 private
// 限制存取 private(set)
// conforms to Protocol

// 【ChaoCode】 Swift 中級 1：Struct 實作作業

// 1️⃣ 建立一個名為「手机」的類型

// 2️⃣ 設定屬性：用戶姓名 String、電話號碼 String、收件箱 [String]。
//            用戶姓名和電話號碼創建後不可更改。
//            收件箱預設為空，其他屬性沒有預設值，不能從外部更改。
// 3️⃣ 設定方法：
// 加入下列方法
struct 手机: Equatable {
    let 用户姓名: String
    let 电话号码: String
    private(set) var 收件箱: [String] = []

    init(_ 用户姓名: String,电话号码: String) {
        self.用户姓名 = 用户姓名
        self.电话号码 = 电话号码
    }

    init(_ 用户姓名: String) {
        self.用户姓名 = 用户姓名
        self.电话号码 = 手机.隨機號碼()
    }

    static func 隨機號碼() -> String {
        "09" + Int.random(in: 10000000 ... 99999999).description
    }

    mutating func 收到訊息(_ 訊息: String) {
        收件箱.append(訊息)
    }

    mutating func 轉移訊息(from 手机: 手机) {
        // 在現有收件箱中，新增引數的收件箱內容。引數的收件箱內容應在 Array 的前面。
        var temp = 手机.收件箱 + 收件箱
        收件箱 = temp
    }

    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.电话号码 == rhs.电话号码
    }
}

// 4️⃣ 設定兩個啟動方式：一個參數是用戶姓名和號碼；另一個參數是姓名，號碼是隨機產生。
// 5️⃣ 讓手机變成 Equatable，並且只比較「手机號碼」。

// 👇 你可以 uncomment 下面這行，嘗試檢查手机的收件箱是否能從外部更新，設定正確的話應該會顯示紅字報錯「Cannot assign to property: '收件箱' setter is inaccessible」。
//手机("Test").收件箱 = []

// 👇 請勿修改下方 Code，你應該在上面建立好 struct 讓以下 Code 能順利執行。

var 我的號碼 = 手机("Jane", 电话号码: "0912345678")
我的號碼.收到訊息("寶貝：在幹麻")
我的號碼.收到訊息("媽媽：早安")

var 隨機新號碼 = 手机("Jane")
隨機新號碼.收到訊息("系統通知：您的號碼已開啟所有服務。")
隨機新號碼.轉移訊息(from: 我的號碼)
print("\(隨機新號碼.用户姓名) 的新號碼：\(隨機新號碼.电话号码)")
print(隨機新號碼.收件箱)

print("隨機號碼 \(手机.隨機號碼())")
let 我的號碼測試 = 手机("Amy", 电话号码: "0912345678")
print("結果應為 true：\(我的號碼 == 我的號碼測試)")
