
// 【ChaoCode】 Swift 中級篇 10 Reference Type & ARC： 實作作業
//
/*: 請閱讀以下的每一組 class，請根據你的判斷調整修改 class，確保不會有「retain cycle」。\
 ⚠️ 作業沒有測試，請自己加入 deinit 確認每個物件都被釋放。答案中有寫「哪裡產生了循環」，請務必也確認這個部分是否跟你想的一樣。
 */
// 1️⃣
class 教授 {
    var 課程: 課程?

    deinit {
        print("教授退休了")
    }
}

class 課程 {
    unowned var 教授: 教授
    // ✨ 因為課程一定有教授，所以使用 unowned 來產生弱連結。

    init(教授: 教授) {
        self.教授 = 教授
        教授.課程 = self
        // ⚠️ 教授和課程產生了循環。
    }

    deinit {
        print("课程结束了")
    }
}

var 指導教授: 教授? = 教授()
var 計算機概論: 課程? = 課程(教授: 指導教授!)

// 以下兩行執行完後空間應被釋放
指導教授 = nil
計算機概論 = nil

// 2️⃣
class 老闆 {
    var 發薪水: ((Int) -> Void)?

    deinit {
        print("老板破产了")
    }
}

class 帳戶 {
    unowned var 擁有者: 老闆
    // ✨ 因為帳戶一定有擁有者，所以使用 unowned 來產生弱連結。
    var 存款 = 10000

    func 扣款(amount: Int) {
        存款 -= amount
        print("帳戶存款剩下 \(存款)")
    }

    init(擁有者: 老闆) {
        self.擁有者 = 擁有者
        擁有者.發薪水 = 扣款
        // ⚠️ 帳戶.擁有者 -> 老闆 ＆ 老闆.發薪水 -> 帳戶.扣款，產生了循環。
    }

    deinit {
        print("账户没钱了")
    }
}

var boss: 老闆? = 老闆()
var bank: 帳戶? = 帳戶(擁有者: boss!)

// 以下兩行執行完後空間應被釋放
boss = nil
bank = nil

// 3️⃣
class 人 {
    weak var 工作: 工作?
    // ✨ 人可以沒工作，工作也可能沒有負責人，所以用 weak。或者把 人.工作 設成 weak 也沒問題。因為只要其中一端有是弱連結就不會產生 cycle。

    deinit {
        print("失业了")
    }
}

class 工作 {
    var 負責人: 人?

    deinit {
        print("工作结束了")
    }
}

var 男孩: 人? = .init()
var 打工機會: 工作? = .init()

男孩?.工作 = 打工機會
打工機會?.負責人 = 男孩
// ⚠️ 工作和負責人產生了循環。

// 以下兩行執行完後空間應被釋放
男孩 = nil
打工機會 = nil
