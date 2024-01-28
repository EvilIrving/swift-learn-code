
// 【ChaoCode】 Swift 中級篇 11 Class & 繼承： 實作作業參考解答
//

class 蜘蛛 {
    func 吐絲() {
        print("嘶～～🕸")
    }

    func 注入毒液() {
        print("🧪")
    }
}

// 1️⃣
// 請讓蜘蛛人繼承蜘蛛，並新增「name」（String）和「剩餘毒液攻擊次數」（Int）屬性，剩餘毒液攻擊次數預設值為 3。
// 覆蓋注入毒液方法，首先檢查是否還有剩餘次數，如果沒有次數就印出「\(name)：沒有可用毒液😱」並 return，有的話則扣掉一次攻擊次數，接著印出「\(name)：毒液攻擊！」，再呼叫蜘蛛的注入毒液方法。

class 蜘蛛人: 蜘蛛 {
    var name: String
    var 剩餘毒液攻擊次數: Int = 3

    init(_ name: String) { self.name = name }

    func 補充毒液() {
        print("\(name)補充毒液中...")
        剩餘毒液攻擊次數 = 3
    }

    override func 注入毒液() {
        guard 剩餘毒液攻擊次數 > 0 else {
            print("\(name)：沒有可用毒液😱")
            return
        }
        剩餘毒液攻擊次數 -= 1
        print("\(name)：毒液攻擊！", terminator: "")
        super.注入毒液()
    }
}

// 2️⃣
// 請讓鋼鐵蜘蛛人繼承蜘蛛人，覆蓋「剩餘毒液攻擊次數」，讓它在 0 的時候自動呼叫「補充毒液」。
// 請確保此類型無法被繼承。
final class 鋼鐵蜘蛛人: 蜘蛛人 {
    func 鋼爪攻擊() {
        print("👊 \(name)：鋼爪攻擊！")
    }

    override var 剩餘毒液攻擊次數: Int {
        get {
            if super.剩餘毒液攻擊次數 == 0 { 補充毒液() }
            return super.剩餘毒液攻擊次數
        }
        set { super.剩餘毒液攻擊次數 = max(0, newValue) }
    }
}

// 3️⃣ 請在以下變數中建立一個 collection，並放入一位名為「安德魯」的蜘蛛人和一位名為「湯姆」的鋼鐵蜘蛛人。
let 蜘蛛人集合: [蜘蛛人] = [蜘蛛人("安德魯"), 鋼鐵蜘蛛人("湯姆")]

// 請勿修改下內容，如「蜘蛛人集合」設定正確應正常執行。
for item in 蜘蛛人集合 {
    item.吐絲()
    item.注入毒液()
    item.注入毒液()
    item.注入毒液()
    item.注入毒液()
    print("-----------------")
}
