// 1. 請 debug 下面這段 Code
let name = "Jane"
var phoneNumber = "0912345678"

print("\(name) 的電話號碼是 phoneNumber")

phoneNumber = "0988777666"
print("\(name) 改電話號碼了，新的號碼是 phoneNumber")

// 2. 定義三個變數，分別代表年、月、日。假設今天是 2022 年 8 月 5 日，印出一句話描述今天日期，再修改變數，印出一句話描述明天日期。
let year = 2022, month = 8
var day = 5
print("今天是\(year)年-\(month)月-\(day)日")
day = 8
print("今天是\(year)年-\(month)月-\(day)日")

// 【ChaoCode】 Swift 基礎篇 2：數學運算子實作作業

// 1. 請完成這組這個計算年紀 code（不考慮幾月生，2021 年生的話就是 1 歲）
let currentYear = 2022
let birthYear = 1998
let age = currentYear - birthYear

print("\(birthYear) 年生的孩子今年 \(age) 歲了")

// 2. 請把華氏溫度 100 轉換成攝氏，並把你的變數放入提供的 print 字串中。（答案應為 37 度）
// 轉換公式 = (華氏溫度 - 32) * 5 / 9
let 华氏温度 = 100
let 摄氏温度 = (华氏温度 - 32) * 5 / 9

print("華氏溫度 \(华氏温度) 度大約是攝氏溫度 \(摄氏温度) 度")

// 3. 請找出大於 300 並且是 11 的倍數的「最小」數字。（答案應為 308）
// 下面提供的變數名稱是 minNumber（最小數字）和 factor（因數），但你可以隨意調整，記得把 print 裡的變數名稱也改掉就好。
let minNumber = 300
let factor = 11

print("大於 \(minNumber) 並且是 \(factor) 的倍數的最小數字是 \(minNumber + factor - (minNumber % factor))")

// 【ChaoCode】 Swift 基礎篇 3：數字類型實作作業

// 1. 請把台幣 975,772 元轉換成日幣，匯率是 1 台幣等於 3.95 日幣。
let 台币: Double = 975772
let 汇率: Double = 3.95
let 日币 = 台币 * 汇率
print("台幣 \(台币) 元等於日幣 \(日币) 元。")

// 2. 請印出十進位的 90000.23 用 Double 儲存會產生的誤差值。
// 答案可以是正數或負數，只要數字部分正確即可。

print("90000.23 用 Double 儲存會產生的誤差值為：？。")

// 【ChaoCode】 Swift 基礎篇 5：Bool 和條件運算子實作作業

// ⚠️ 注意這次的寫法比較不同，你只要編輯👇符號下面的內容即可，編輯範圍到 print 那行（包含 print），這之間你可以任意新增行數，如果還是不確定可以看影片結尾有解釋。
// 這個寫法是為了讓你能比較輕鬆測試不同結果，我把你的 code 包進 function 裡面。現在看不懂沒關係，function 是我們這系列之後會學到的內容。

// 1. 根據不同體重和身高印出不同訊息。

func 體重檢測(weight: Double, height: Double) {
    print("🌼 體重：\(weight) 公斤，身高 \(height * 100) 公分")
    // 👇 體重低於 50 時印出「不能捐血」；50 或 50 以上印出可以捐血。
    weight.isLess(than: 50) ? print("不能捐血") : print("可以捐血")
    
    // 👇 計算出 BMI: 體重 / (身高 * 身高)
    let bmi = weight / (height * height)
    print("你的 BMI 是：\(bmi)")
    // 👇 BMI 小於等于 18.5 時印出「過瘦體型」；BMI 大於等於 30 時印出「過胖」；其餘印出「正常體型」。
    let 体型 = bmi.isLessThanOrEqualTo(18.5) ? "过瘦" : bmi.isLess(than: 30) ? "过胖" : "正常"
    print("\(体型)體型")
}

體重檢測(weight: 47.95385, height: 1.61)
體重檢測(weight: 75, height: 1.75)
體重檢測(weight: 130, height: 1.80)

// 2. 因應虎年，商店舉辦了名字裡有虎的客人可以獲得優惠的活動。請根據客人名字印出他能獲得多少優惠。

func 名字優惠活動(name: String) {
    // 👇 請印出正確的折扣資訊。名字裡有虎的人可以打 8 折；名字開頭是虎的人可以打 5 折；其餘沒有折扣。
    let 折扣 = name.hasPrefix("虎") ?5 : name.contains("虎") ? 8 : 0
    print("📢 名字是 \(name) 的客人，您可以獲得\(折扣)折优惠")
}

// 名字優惠活動(name: "小老虎")
// 名字優惠活動(name: "虎牙妹")
// 名字優惠活動(name: "小貓咪")

// 【ChaoCode】 Swift 基礎篇 7：類型 & Function 實作作業

// 1️⃣ 請閱讀下載好的 Animal 類型，只要看有哪些屬性、方法和要怎麼呼叫那些方法。

// 2️⃣ 請印出戰鬥規則。

print("歡迎來到動物大亂鬥！這裡的規則是：\(Animal.戰鬥規則)")

// 3️⃣ 建立第一回合的選手：台北小野貓，血量 25，攻擊力 7；台東穿山甲，血量 40，攻擊力 4。
let 台北野貓 = Animal("🐱", hp: 25, power: 5),
    台東兔子 = Animal("🐰", hp: 40, power: 4)

// 4️⃣ 開始第一輪戰鬥，由台北小野貓先攻，並印出戰鬥紀錄。
print("第一輪戰鬥開始！")
let winner = 台北野貓.戰鬥(對上: 台東兔子, 我方先攻: false)

// 5️⃣ 請幫獲勝的動物補充血量 25，並印出更新後的血量資訊。
winner.hp + 25
print("🍼\(winner.name)喝了超能能量飲，現在血量為\(winner.hp)")

// 6️⃣ 接著由獲勝的動物和一位隨機動物戰鬥，這次由隨機動物先攻，並印出戰鬥紀錄。
print("第二輪戰鬥開始！")
winner.戰鬥(對上: Animal.隨機(), 我方先攻: false)

// 【ChaoCode】 Swift 基礎篇 8：Tuple 實作作業

// 1. 下面已經建立兩位學生的名字和考試成績變數。請建立一個適合學生的 Tuple 資料類型並設定別名，接著把以下 Code 改成用你建立的 Tuple 資料類型的方式建立 學生A 和 學生B 各一個變數，然後檢查誰的考試成績比較好，並印出他的平均分數。
typealias 成绩 = (名字: String, 数学: Int, 英语: Int, 历史: Int, 国文: Int)
let 学生A: 成绩 = (名字: "🐣", 93, 68, 77, 72)
let 学生B: 成绩 = (名字: "🦆", 84, 89, 59, 72)

let aTotal = 学生A.数学 + 学生A.英语 + 学生A.历史 + 学生A.国文, bTotal = 学生B.数学 + 学生B.英语 + 学生B.历史 + 学生B.国文
let (winnerName, average) = aTotal > bTotal ? (学生A.名字, aTotal / 4) : (学生B.名字, aTotal / 4)

print("学生\(winnerName)的平均分數較高，平均分數為\(average)分")

// 2. 請跟著步驟印出今天花了多少錢和今天的發票有沒有中獎。
// ⚠️ 和上次的作業一樣，請不用在意我提供的 Function 中語法是怎麼寫的，只要會呼叫和使用回傳值就可以了。

// 1️⃣ 請閱讀定義的 Tuple 別名和 Function 的參數和回傳值

typealias 發票 = (號碼: String, 消費金額: Int)

func 結帳(_ 商品價格: Int...) -> 發票 {
    let totalCost = 商品價格.reduce(0) { $0 + $1 }
    return 發票("RE" + Int.random(in: 100...999).description,
              totalCost)
}

func 檢查是否中獎(發票: 發票...) -> Bool {
    let win = 發票.first { $0.號碼.hasSuffix("8") }
    return !(win == nil)
}

// 2️⃣ 以下是今天的三筆花費，請印出今天的總花費。
// 早餐：59 元套餐一份
// 午餐：牛丼 129 元、可樂餅 35 元、可爾必思 50 元
// 晚餐：義大利麵 215 元、拿鐵 90 元
let 早 = 結帳(59)
let 午 = 結帳(129, 35, 50, 215)
let 晚 = 結帳(90)

print("今天吃飯總共花了 \(早.消費金額 + 午.消費金額 + 晚.消費金額) 元")

// 3️⃣ 請檢查今天的發票是否有中獎，並印出結果。
let isRe = 檢查是否中獎(發票: 早, 午, 晚)
if isRe {
    print("發票中獎了！美好的一天")
} else {
    print("明天的發票會更好")
}

import Foundation

// 【ChaoCode】 Swift 基礎篇 9：條件式流程控制——If 實作作業

// 1. 請根據下述的學校入學條件判斷入學申請者能否入學，並印出對印的文字。
// 「這間學校的入學門檻是平均成績須達 80 分，學費為 128,000 元，平均成績達 92 分以上可以以獎學生身份享全額補助入學。」

func 入學申請(名字: String, 平均成績: Int, 存款: Int) {
    // 👇 請根據不同情況印出以下四種結果。
    if 平均成績 < 80 {
        print("❌ \(名字) 成績未達入學門檻，不能入學。")
    } else if 平均成績 > 92 {
        print("🎉 \(名字) 以獎學生身份入學。")
    } else if 存款 >= 128000 {
        print("✅ \(名字) 可以入學。")
    } else {
        print("😢 \(名字) 成績達入學門檻，但無法支付學費，不能入學。")
    }
}

// 入學申請(名字: "保羅", 平均成績: 80, 存款: 128000)
// 入學申請(名字: "傑克", 平均成績: 92, 存款: 18000)
// 入學申請(名字: "蘿拉", 平均成績: 95, 存款: 356700)
// 入學申請(名字: "馬丁", 平均成績: 70, 存款: 152340)
// 入學申請(名字: "米娜", 平均成績: 84, 存款: 238920)
// 入學申請(名字: "海倫", 平均成績: 90, 存款: 127000)

// 2. 請根據 Google Doc 中提供的體脂率計算法和體型對照表印出正確的體脂率和體型資訊，如果對象低於 18 歲則只印出「多吃多動，健康快樂長大就好」。

func 體脂率計算(名字: String, 是男生: Bool, 年齡: Int, 身高: Double, 體重: Double) {
    if 年齡 < 18 {
        print("\(名字)，多吃多動，健康快樂長大就好。")
    } else {
        let bmi = 體重 / ((身高 / 100) * (身高 / 100))
        let bodyFat = 1.2 * bmi + 0.23 * Double(年齡) - 5.4 - 10.8 * (是男生 ? 1 : 0)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        let bodyFatString = "\(名字)的體脂率是 \(formatter.string(for: bodyFat)!) %"
        
        // 💡 以男生 18~39 歲為基準，計算不同性別和年紀的偏差值。
        let genderBias = 是男生 ? 0 : (21 - 8)
        
        let isYoungAdult = 年齡 < 40
        var ageBias = 0
        if !isYoungAdult {
            let isElder = 年齡 > 59
            if 是男生 { ageBias += isElder ? 5 : 3 }
            else { ageBias += isElder ? 3 : 2 }
        }
        
        // 💡 把偏差值加起來，計算出正常範圍和肥胖下限
        let bias = Double(genderBias + ageBias)
        let normalLowerBound = 8 + bias
        let normalUpperBound = 20 + bias
        let obesityLowerBound = 25 + bias
        let idealRangeString = "理想值應為 \(normalLowerBound) ％ ～ \(normalUpperBound) %"
        
        if bodyFat < normalLowerBound {
            print("\(bodyFatString)，，低於正常標準，理想值應為 \(idealRangeString)。")
        } else if bodyFat < normalUpperBound {
            print("\(bodyFatString)，，位於正常標準，繼續保持！")
        } else if bodyFat < obesityLowerBound {
            print("\(bodyFatString)，高於正常標準，理想值應為 \(idealRangeString)。")
        } else {
            print("\(bodyFatString)，，屬於過胖體型，理想值應為 \(idealRangeString)。")
        }
    }
}

// 體脂率計算(名字: "亞倫", 是男生: true, 年齡: 17, 身高: 149, 體重: 40)
// 體脂率計算(名字: "克里斯", 是男生: true, 年齡: 40, 身高: 150, 體重: 60)
// 體脂率計算(名字: "丹尼", 是男生: true, 年齡: 20, 身高: 181, 體重: 53)
// 體脂率計算(名字: "比爾", 是男生: true, 年齡: 26, 身高: 165, 體重: 53)
// 體脂率計算(名字: "吉米", 是男生: true, 年齡: 60, 身高: 173, 體重: 120)
// 體脂率計算(名字: "艾瑪", 是男生: false, 年齡: 17, 身高: 149, 體重: 40)
// 體脂率計算(名字: "凱西", 是男生: false, 年齡: 40, 身高: 150, 體重: 60)
// 體脂率計算(名字: "黛比", 是男生: false, 年齡: 20, 身高: 180, 體重: 53)
// 體脂率計算(名字: "瑪麗", 是男生: false, 年齡: 26, 身高: 165, 體重: 53)
// 體脂率計算(名字: "米蘭達", 是男生: false, 年齡: 60, 身高: 173, 體重: 120)

// 【ChaoCode】 Swift 基礎篇 10：Range 運算子實作作業
//
// 1. 保羅在學校活動的時間是 7:00~13:00 點，艾莉在學校活動的時間是 12:30~17:00 點，溫蒂在學校活動的時間是 10:00~16:00 點，他們有辦法在學校碰面嗎？如果可以的話是幾點到幾點？
// ⚠️ 嘗試用下面提供的 formatter 讓你的數字一律印出兩位數，比方 1 應該印出 01。請用這種一律有兩位數的顯示方式來印出時間。例如 1 點 5 分應該是 01 點 05 分。

let 保罗 = 700..<1300
let 艾丽 = 1230..<1700
let 温蒂 = 1000..<1600
let range = 保罗.clamped(to: 艾丽.clamped(to: 温蒂))

if range.isEmpty {
    print("不能碰面")
} else {
    let formatter = NumberFormatter()
    formatter.minimumIntegerDigits = 2
    
    typealias time = (h: Int, m: Int)
    let start: time = (h: range.lowerBound / 100, m: range.lowerBound % 100)
    let end: time = (h: range.upperBound / 100, m: range.upperBound % 100)
    let 开始时间串 = formatter.string(for: start.h)! + ":" + formatter.string(for: start.m)!
    let 结束时间串 = formatter.string(for: end.h)! + ":" + formatter.string(for: end.m)!
    print("他們可以在\(开始时间串) ~ \(结束时间串)之間碰面")
}

// 2. 請設計一個隨機抽獎活動，每次執行時會從 1 到 1000 隨機抽一個數字。如果這個數字在 100 ~ 200 的範圍中（不含 200）則中 200 元；如果這個數字尾數是 8 或 6 則中 500 元；如果這個數字剛好是 888 或 666 則中 10,000 元。

func 抽獎活動(自選隨機數字: Int? = nil) {
    var 隨機數字: Int = (1...1000).randomElement()!
    隨機數字 = 自選隨機數字 ?? 隨機數字 // ⚠️ 請勿刪掉這行，測試用
    
    print("您抽中的數字是：\(隨機數字)")
    if 隨機數字 >= 100 && 隨機數字 < 200 { // (100..<200).contains(隨機數字)
        print("🎉 恭喜你中了 200 元！")
        return
    }
    
    if 隨機數字 % 10 == 8 || 隨機數字 % 10 == 6 {
        print("🎉 恭喜你中了 500 元！")
        return
    }
    
    if 隨機數字 == 888 || 隨機數字 == 666 {
        print("🎉 恭喜你中了 10,000 元！")
        return
    }
    
    print("很可惜，這次沒有中獎。")
}

抽獎活動(自選隨機數字: 1)
抽獎活動(自選隨機數字: 116)
抽獎活動(自選隨機數字: 239)
抽獎活動(自選隨機數字: 200)
抽獎活動(自選隨機數字: 344)
抽獎活動(自選隨機數字: 246)
抽獎活動(自選隨機數字: 666)
抽獎活動(自選隨機數字: 888)
抽獎活動(自選隨機數字: 777)
抽獎活動(自選隨機數字: 150)
抽獎活動()

// 【ChaoCode】 Swift 基礎篇 11：Switch 實作作業
//
// 1. 請使用 Switch 的條件控制語法，根據月份和地理位置印出季節資訊。
// 北半球： 1~3 月是春天；4~6 月是夏天；7~9 月是秋天；9~12 月是冬天。
// 南半球： 1~3 月是秋天；4~6 月是冬天；7~9 月是春天；9~12 月是夏天。

func 季節判斷(地點: String, 是北半球: Bool, 月份: Int) {
    var 季节 = ""
    var 转换月份 = 是北半球 ? 月份 : (月份 + 6) % 12
    switch 转换月份 {
    case 1...3:
        季节 = "春天"
    case 4...6:
        季节 = "夏天"
    case 7...9:
        季节 = "秋天"
    case 10...12:
        季节 = "冬天"
    default:
        季节 = "wu"
    }
    print("\(地點)在 \(月份) 月時會是 \(季节)季節")
}

// 2. 請使用 Switch 的條件控制語法，根據以下條件幫你朋友篩選約會對象。
// 理想對象：30 歲以內（不含），是男生的話身高至少 180，女生的話身高至少 165。
// 可以考慮：40 歲以內（不含），是男生的話身高至少 177，女生的話身高至少 162，距離在 10.0 公里以內(含）。
// 值得關注：20 歲以內（不含），距離在 15.0 公里以內(含）。

// Person 裡面的資料依序代表是：名字、是否是男生、年齡、身高、距離、自我介紹。
func 過濾配對(_ person: Person) {
    // 👇 請只在以下這個 switch 的範圍內編輯，並且不使用 if 語句。
    switch person {
    case (let 名字, _, ..<20, _, ...15.0, let 自我介紹):
        print("👀 值得關注：\(名字)「\(自我介紹)」")
    case (let 名字, true, ..<30, 180.0..., _, let 自我介紹), (let 名字, false, ..<30, 165.0..., _, let 自我介紹):
        print("💘 理想對象：\(名字)「\(自我介紹)」")
    case (let 名字, true, ..<40, 177.0..., ...10.0, let 自我介紹), (let 名字, false, ..<30, 162.0..., ...10.0, let 自我介紹):
        print("🤗 可以考慮：\(名字)「\(自我介紹)」")
    default:
        break
    }
}

// 請記得下載 checkHelper 才能執行下面這行作業檢查喔 ☺️
作業檢查(weather: 季節判斷, match: 過濾配對)

// 【ChaoCode】 Swift 基礎篇 12：Array 實作作業
//
// 這次的作業只有一題，請根據數字，按步驟建立一個歌單，每個步驟請都 ⚠️ 只使用一行 code 完成。

let 熱門歌曲 = ["如果可以", "好不容易", "想知道你在想什麼", "妹妹", "閣愛妳一擺"]
let 歌曲排行2021 = ["刻在我心底的名字", "愛情你比我想的閣較偉大", "在這座城市遺失了你", "飛鳥和蟬", "想見你想見你想見你"]

// 1️⃣ 建立一個空的我的歌單 Array，Element 是 String。
// var 我的歌单: Array<String> = [] // 我的歌单: [String]  = [] 我的歌单 = Array<Element>() 我的歌单 = [String](  )
////2️⃣ 將熱門歌曲和歌曲排行2021依序放入我的歌單。
// 我的歌单  +=  熱門歌曲 +  歌曲排行2021
//
////3️⃣ 把「忠孝東路走九遍」新增到第一首。
// 我的歌单.insert("忠孝東路走九遍", at: 0)
////4️⃣ 把第五首歌換成「旅行的意義」。
// 我的歌单[5] = "旅行的意義"
////5️⃣ 把第六和第七首換成「小幸運」和「小情歌」。
// 我的歌单[6...7] = ["小幸运","小情歌"]
////6️⃣ 刪除倒數第二首歌。
// 我的歌单.remove(at: 我的歌单.count - 2)
////7️⃣ 印出歌曲數量。
// print("我的歌單一共有 \(我的歌单.count) 首歌")
//
////8️⃣ 依序印出所有歌曲名稱，每一首歌名用「、」分開。
// print("🎤 我的歌單：\(我的歌单.joined(separator: ", "))")
//
////9️⃣ 打亂歌單後再依序印出一次所有歌曲名稱，每一首歌名用「、」分開。
// print("🎲 隨機排序：\(我的歌单.shuffled().joined(separator: ", "))")

// 【ChaoCode】 Swift 基礎篇 13：For Loop 實作作業
//
//
// 1. 學校宿舍新建房間，可再容納 20 人。校方想把這些房間預留給曾經申請過但沒有申請到的學生。請透過前一次的宿舍申請名單，找到其中出席率最高且尚未有宿舍的 20 位學生。以利學校寄送優先申請通知。

let students = getStudentList() // 這是一個已根據出席率由高至低排序的學生清單。
var studentsWithNoDorm: [Student] = [] // 請勿更改此變數名稱。

// 👇 請在下方寫一個 For Loop 完成這題，把「符合條件的」學生放到「studentsWithNoDorm」Array 中，並且使用到 continue 和 break。

// for student in students {
//    if studentsWithNoDorm.count > 19 { break }
//    if student.已有宿舍 { continue }
//
//    studentsWithNoDorm.append(student)
// }

//// 2. 請從一份全球前 50 名最高票房電影清單中，根據年份印出當年的前三最高票房電影。
// func 前三名票房(of year: Int)
// {
// let top50Movies: [Movie] = getTop50Movies() // 這是一個已根據票房由高至低排序的全球前 50 名票房電影清單。
//
// print("沒有高票房的電影 🥲")
// print("🍿 \(year) 票房：")
// print("\t第 ？ 名是「ＯＯＯ」")
// }

// 作業測試(students: studentsWithNoDorm, boxOfficeRank: 前三名票房) // 請勿移除這行

// 3. 學生會舉辦年度方向投票活動，一共有六個主題，請使用 Loop 語法完成計票並印出結果，超過 50% 支持即表示通過。（投票率不需印出小數點位數）

let 所有投票主題 = [
    "宿舍門禁由 22 點改為 23 點",
    "每週二設為節水日，停水一天",
    "鼓勵運動，提高體能的畢業門檻",
    "學校商店從 7-11 改成全家",
    "開放早上第一堂課吃早餐",
    "開放在雨天穿拖鞋上課",
]

var 票数 = [0, 0, 0, 0, 0, 0]
// 👇 請直接使用這個「所有投票」的變數，裡面是 1000 筆投票資料，每一筆投票都是一個 Bool 的 Array，裡頭有 6 個布林值對應上面的投票主題。例如 [true, false, true, true, false, true]，第一個 true 對應的就是支持「宿舍門禁由 22 點改為 23 點」、第二個 false 對應的就是不支持「每週二設為節水日，停水一天」。

// var jdx = 0
// for 主題 in 所有投票主題 {
//    for 投票 in 所有投票 {
//        if 投票[jdx] { 票数[jdx] += 1 }
//    }
//
//    var rate = Int(Double( ) / Double(所有投票.count) * 100)
//    jdx += 1
//    print("「投票主題\(主題)」的支持率是 \(rate)%，\(rate > 50 ? "通過" : "不通過" )")
// }

// 【ChaoCode】 Swift 基礎篇 14：While Loop 實作作業
//
//
// 1. 請用 while loop 寫出整數「次方」的計算方法。

func 次方計算(_ base: Int, power: Int) -> Int {
    // base 表示底數；power 表是指數。例如：3 的 5 次方中，3 是底數、5 是指數。
    switch power {
    case 0:
        return 1
    case ..<0:
        return 0
    default:
        // 👇 請從這邊開始編輯，編輯範圍到「return result」那行之前，在這範圍中間你想加幾行都可以。
        var pow = power, result = base // ⚠️ 最後請記得把你的運算結果存至這個變數中，你可以修改初始的「0」，但請勿更改變數名稱。
        while pow > 1 {
            result *= base
            pow -= 1
        }
        return result // ⚠️ 請勿刪除這行。
    }
}

作業檢查(次方計算)

// 2. 請設計一個剪刀石頭布的遊戲，獲勝條件是三戰兩勝，平手不算。每一回合都需要印出猜拳狀況，最後印出最後的獲勝者、經過的局數和最終比數。
// 💡 提示：你可以從 Array 中取得 randomElement，也可以從正整數中取得 randomElement。
let moves = ["✊", "✌️", "✋"]
var 回合數 = 0,
    aWin = 0,
    bWin = 0

// repeat {
//    typealias round = (String,String)
//    let a = moves.randomElement()!,b = moves.randomElement()!, 回合: round = (a,b)
//    回合數 += 1
//    switch 回合 {
//    case ("✊", "✌️"),("✌️", "✋"),("✋","✊"):
//        aWin += 1
//        print("\(a) VS \(b)，這局由玩家a獲勝。")
//    case ("✌️", "✊"),("✋", "✌️"),("✊","✋"):
//        bWin += 1
//        print("\(a) VS \(b)，這局由玩家b獲勝。")
//    default:
//        print("兩方都出 \(a)，平手。")
//    }
//    print(aWin,bWin)
// } while (aWin < 2 && bWin < 2)

// repeat {
//    回合數 += 1
//    let playerA = (0...2).randomElement()!
//    let playerB = (0...2).randomElement()!
//    if playerA == playerB {
//        let move = moves[playerA]
//        print("兩方都出 \(move)，平手。")
//        continue
//    }
//
//    switch playerA - playerB
//    {
//        case -1, 2:
//            aWin += 1
//        print("\(moves[playerA]) VS \(moves[playerB])，這局由玩家a獲勝。")
//        default:
//            bWin += 1
//        print("\(moves[playerA]) VS \(moves[playerB])，這局由玩家b獲勝。")
//    }
//
// } while !(aWin == 2 || bWin == 2)
//
// print("經過 \(回合數) 次猜拳，最後的贏家是「玩家\(aWin > bWin ? "a" : "b")」，比數為 \(aWin)：\(bWin)。")

// 【ChaoCode】 Swift 基礎篇 15：Set 實作作業
//
//
// 1. 以下是一個班級的模擬考的結果，請印出全班人數、兩科都 Pass 的有幾人以及他們的名字。
// 英文 Pass："菲尼克斯", "安東尼", "伊恩", "羅恩", "約翰", "黛西", "格理芬", "凱登", "麥可", "傑克森", "約瑟夫", "艾斯", "諾亞", "約拿", "埃利奧特", "凱勒", "雅莉安娜", "凱特"
// 數學 Pass："潔西卡", "諾亞", "雅莉森", "凱特", "黛西", "伊恩", "賈斯丁", "艾米", "羅恩", "以賽亞", "達克斯", "伊萊賈", "雅莉安娜", "約翰", "昆恩"
// 都沒 Pass 的有："戴蒙", "雷蒙", "艾莉克西雅", "菲碧"
let eng = Set(["菲尼克斯", "安東尼", "伊恩", "羅恩", "約翰", "黛西", "格理芬", "凱登", "麥可", "傑克森", "約瑟夫", "艾斯", "諾亞", "約拿", "埃利奧特", "凱勒", "雅莉安娜", "凱特"]), math = Set(["潔西卡", "諾亞", "雅莉森", "凱特", "黛西", "伊恩", "賈斯丁", "艾米", "羅恩", "以賽亞", "達克斯", "伊萊賈", "雅莉安娜", "約翰", "昆恩"]), nonePass = Set(["戴蒙", "雷蒙", "艾莉克西雅", "菲碧"])

var stus = eng.union(math).union(nonePass)
print("全班一共有 \(stus.count) 人")
var bothpass = eng.intersection(math)

print("兩科都 Pass 的有 \(bothpass.count) 人，他們是：\(bothpass.joined(separator: ", "))")

// 2. 請寫一個簡單版的狼人殺遊戲。12 個人被分為狼人隊伍和村民隊伍，每天早上會從全部的人中隨機流放一人，而晚上會從村民中隨機送走一人。重複這個流程直到其中一個隊伍內所有人都離開，剩餘還有人的那一隊獲勝。最後請印出花了多少天、哪一個隊伍獲勝以及倖存者姓名。
// * 第一天是從晚上開始，接著就是第二天白天。
// * 如果白天只剩下一個村民和一個狼人，則狼人獲勝。

// var 狼人們: Set<String> = ["妙麗","天狼星","榮恩","石內卜"]
// var 村民們: Set<String> = ["跩哥","哈利","多比","佛地魔","金妮","鄧不利多","露娜","海格"]
// var 天数 = 1
// var isNight = true
// while !(狼人們.isEmpty || 村民們.isEmpty) {
//    if isNight {
//        let folk = 村民們.randomElement()!
//        村民們.remove(folk)
//        print("夜晚狼人行動，送走「\(folk)」。")
//    }else{
//        let all = 村民們.union(狼人們)
//        let 一对一 = all.count == 2
//        let target = 一对一 ? 村民們.first!  : all.randomElement()!
//        狼人們.remove(target)
//        村民們.remove(target)
//        print("白天大家投票決定，流放「\(target)」。")
//        天数+=1
//    }
//    isNight.toggle()
// }
//
// let winStack = 狼人們.isEmpty ? "村民" : "狼人"
// print("🗓 經過了\(天数) 天, \(winStack)獲勝了。")
// print("🎉 倖存者：\(村民們.union(狼人們).joined(separator: ", "))")

// 【ChaoCode】 Swift 基礎篇 16：Dictionary 實作作業
//
// 1. 這一題是練習 Dictionary 基本操作，請跟著以下步驟完成。
//
// 1️⃣ 建立一個空的翻譯機 Dictionary 變數，Key 和 Value 都是 String。

// 2️⃣ 下面 Array 裡的 Tuple 第一個位置是全為小寫的英文，第二個位置是對應的中文翻譯。請透過迴圈把這些資料都放進翻譯機裡，用英文當作 Key，中文當作 Value。
// let dict: Dictionary<String:Int> = [:]  dict:[String:Int] =[:] dict = Dictionary<String:Int>() dict = [String:Int]()
// let 翻譯 = [("and", "和"), ("is", "是"), ("taiwan", "台灣"), ("love", "愛"), ("i", "我"), ("hotpot", "火鍋"), ("awesome", "牛")]
// var 翻译机 = [String:String]()
// 翻译机.reserveCapacity(翻譯.count)
//
// for (key,value) in 翻譯 {
//    翻译机[key] = value
// }
//// 3️⃣ 透過翻譯機印出 Taiwan 的中文。
// print("Taiwan 的中文是 \(翻译机["taiwan"]!)")
//
//// 4️⃣ 把 awesome 的翻譯改成棒棒。
// 翻译机.updateValue("棒棒", forKey: "awesome")
//// 5️⃣ 透過翻譯機翻譯「I love hotpot」並印出中文。
// var sen = ""
// print("I love hotpot".split(separator: " "))
// for word in "I love hotpot".split(separator: " ") {
//    sen += 翻译机[word.lowercased()]!
// }
// print(sen)

// 💡 你會需要使用 String 中 「.split(separator:)」這個方法。
// let sentence   = "Hotpot is awesome and I love hotpot"
// var trans = ""
// for word in sentence.split(separator: " ") {
//    trans += 翻译机[word.lowercased()]!
// }
// print("\(sentence) 的中文是「\(trans)」")
//

// 2. 請透過奧斯卡入圍名單資料，計算每部電影總共入圍幾個獎項，最後印出入圍最多獎項的電影以及「沙丘」入圍幾個獎項。
// 💡 找出入圍最多獎項這點其實有一個 .sorted 方法可以使用，但因為我們還沒有學過 closure，所以請先用迴圈的方式找哦。

let 奧斯卡入圍名單 = 取得奧斯卡入圍名單()
var movies = [String: Int]()
// movies.reserveCapacity(10)  Dictionary Set Array
// Set.init(minimumCapacity: 10) Dictionary
// Array.init(repeating: 0, count: 10)

// for (🥇,🎬) in 奧斯卡入圍名單 {
//    for 获奖电影  in 🎬 {
//        movies[获奖电影,default:0] += 1
//    }
// }
//
// var rewardestMovie = movies.first!
// for (key,value) in movies {
//    if rewardestMovie.value < value {  rewardestMovie = (key,value) }
// }
// print("📣 入圍最多獎項的電影是「\(rewardestMovie.key)」")
// print("🏜 沙丘入圍了 \(movies["沙丘"]!) 個獎項")

// 【ChaoCode】 Swift 基礎篇 17：Protocol & Generic 實作作業
//
// 💡 這兩題都是練習 String 的 Index 操作，所以你可能會想讀一下 String 文件裡頭「Manipulating Indices」這個分類下的屬性和方法。
//
// 1. 請印出位置所對應的 Character，你可以假設 string 不會是空的和 position 的數值大於 0 並且不大於 string.count。
// 例如：string 是 "Hello"，position 是 2 的話應印出 e。
//      string 是 "很好👍🏾"，position 是 3 的話應印出 👍🏾。
extension String {
    // 获取下标对应的字符
    func charAt(pos: Int) -> Character? {
        if pos < 0 || pos >= count {
            return nil // 判断边界条件
        }
        let index = self.index(self.startIndex, offsetBy: pos)
        let str = self[index]
        return Character(String(str))
    }
}

let article = "蘋果（Apple）今天正式宣佈 WWDC 2022 全球開發者大會時間，將於6月6日至6月10日以線上形式舉行，與過去兩年相同開發者皆可免費參加，在 WWDC 2022 將會展示全新 iOS 16、iPadOS 16、macOS 13、tvOS 16 和 watchOS 9 系統，屆時也有可能會在 WWDC 開發者大會上看見新硬體。"

print(article.charAt(pos: article.count - 1)!)
print(article.charAt(pos: 157)!)
print("Emoji🌤🤪😊🎉".charAt(pos: 8)!)

func 印出指定位置(_ string: String, _ position: Int) {
    var index = string.startIndex
    
    var count = 1
    while index != string.endIndex, count < position {
        index = string.index(after: index)
        count += 1
    }
    print(string[index])
}

// 2. 請檢查一個 input 是不是迴文字，你可以假設 string 一定不是空的且一定是小寫。
// 💡 迴文字指的是反過來看也一模一樣，例如「文言文」。
// 💡 CustomStringConvertible 是一個能把他的資料轉換成 String 的 Protocol，你可以看一下文件要怎麼拿到轉換後的 String。
// ⚠️ 請不要使用 .reversed() 方法。

func 迴文測試(_ input: CustomStringConvertible) -> Bool {
    var 是迴文 = true
    let string = input.description
    var frontIndex = string.startIndex
    var backIndex = string.index(before: string.endIndex)
    
    while frontIndex < backIndex && 是迴文 {
        是迴文 = string[frontIndex] == string[backIndex]
        frontIndex = string.index(after: frontIndex)
        backIndex = string.index(before: backIndex)
    }
    return 是迴文
}

// 作業檢查(第一題: 印出指定位置, 第二題: 迴文測試)

// 【ChaoCode】 Swift 基礎篇 18：Function 實作作業
//
//
// 1. 請根據下列規則設計判斷生肖的 Function。
//      a. 單純用陽曆過年判斷，不考慮農曆。
//      b. 請設計兩個名字都是「查生肖」的 Function。
//      c. 一個需要名為「西元年」的 Int 屬性參數；另一個需要名為「國曆年」的 Int 屬性參數。
//      d. 兩個 Function 的回傳值都是 String，也就是對應的生肖。

let 生肖 = ["鼠", "牛", "虎", "兔", "龍", "蛇", "馬", "羊", "猴", "雞", "狗", "豬"]

func 查生肖(西元年: Int) -> String {
    let 生肖 = ["猴", "雞", "狗", "豬", "鼠", "牛", "虎", "兔", "龍", "蛇", "馬", "羊"]
    return 生肖[西元年 % 12]
}

func 查生肖(國曆年: Int) -> String {
    查生肖(西元年: 1911 + 國曆年)
}

生肖測試(西元年: 查生肖(西元年:), 國曆年: 查生肖(國曆年:))

// 2. 請根據下面規則設計數字相乘的 Function。
//      a. Function 名稱為「相乘」。
//      b. Function 接受兩個參數，兩個參數在呼叫使用時都不需要輸入標籤。
//      c. 兩個參數都「必須要」能接受「Int、Double、Decimal」任何一種數字類型並回傳 Double。你可以用設計多個同名稱的 Function 來解決這個問題。
//      d. 計算方法是把兩個數字都先都轉成 Double 後再相乘。
// 💡 如果你想對 Generic 設定一個以上的 Protocol 的話，可以用 & 區分。例如：Element: Hashable & Comparable。
// 💡 如果需要的話，Google 文件上還有其他提示。

//<Number: Numeric & CustomStringConvertible,  Multiple: Numeric & CustomStringConvertible>
func 相乘(_ a: any Numeric & CustomStringConvertible, _ b: any Numeric & CustomStringConvertible) -> Double
{
    Double(a.description)! * Double(b.description)!
}

//print("结果是：",相乘(1,2))

// 👆 在上面寫完你的 Function 後請 Uncomment 下面「全部」內容進行測試，請勿更改任何內容，如果無法執行表示你的 Function 設計不正確。

resetCounter()
for index in 0...4 {
    secondTest(相乘(intNumbers[index], intNumbers[index]))
    secondTest(相乘(doubleNumbers[index], doubleNumbers[index]))
    secondTest(相乘(decimalNumbers[index], decimalNumbers[index]))
    for index2 in 0...4 {
        if (index != index2) {
            secondTest(相乘(intNumbers[index], intNumbers[index2]))
            secondTest(相乘(doubleNumbers[index], doubleNumbers[index2]))
            secondTest(相乘(decimalNumbers[index], decimalNumbers[index2]))
        }
        
        secondTest(相乘(intNumbers[index], doubleNumbers[index2]))
        secondTest(相乘(intNumbers[index], decimalNumbers[index2]))
        secondTest(相乘(doubleNumbers[index], intNumbers[index2]))
        secondTest(相乘(doubleNumbers[index], decimalNumbers[index2]))
        secondTest(相乘(decimalNumbers[index], intNumbers[index2]))
        secondTest(相乘(decimalNumbers[index], doubleNumbers[index2]))
    }
}

print("✅ 您的相乘 function 沒有問題")



// 【ChaoCode】 Swift 基礎篇 19A：Closure 實作作業
//
// ⚠️ 請在不使用 Loop 語法的情況完成這次的每一項作業。
//
// 1. 請把箱子由大到小堆疊，從最下面開始，先放最寬的箱子，如果遇到寬度一樣箱子則先放較厚的箱子。
// ＊Box 是一個有寬度（width）和高（height）的 Tuple。
// 👇 請把這疊箱子改成從大到小排序。（也就是要放在下面的應在 Array 前面。）
let boxes: [Box] = [(2, 1), (1, 1), (4, 1), (6, 1), (4, 3)]


var sortClo = { (a:Box, b: Box) -> Bool in
    if a.width > b.width {
        return true
    }
    
    return a.width == b.width && a.height > b.height
}
let sortedBoxes = boxes.sorted(by: sortClo)
print("排序後的箱子順序是 \(sortedBoxes)")
// 你可以使用下面這個 function 印看看箱子疊起來的樣子。
drawBoxes(sortedBoxes)


// 👇 上面的 box 排序成功後，請呼叫「箱子疊疊樂」function，這個 function 會用你提供的排序方式重新排列 13 組箱子，請用和第一題同樣的規則來重新排列這些箱子。
// 如果不確定為什麼不對的話，也可以自己使用上面的 drawBoxes() 來看看有什麼不一樣。
箱子疊疊樂

// 2. 請設計一個把一組撲克牌組按照「大老二」大小規則，由大到小重新排序，並回傳排序後的牌組的 Function。
// 大小規則：先比數字大小，假如同大小的話再比花色。
// ＊號碼大小：2 > A > K > Q > J > 10 > 9 > 8 > 7 > 6 > 5 > 4 > 3
// ＊花色大小：黑桃 > 紅心 > 方塊 > 梅花
// 💡 你可以設計一個幫助你對照大小的 Dictionary。
// 你的 function 應接收一個「撲克牌的 Array」並回傳一個「撲克牌的 Array」
// ＊撲克牌是 (花色: String, 號碼: String) 的別稱。


func 排序扑克牌(_ cards:[撲克牌]) -> [撲克牌] {
    let ref = ["3":1,"4":2,"5":3,"6":4,"7":5,"8":6,"9":7,"10":8,"J":9,"Q":10,"K":11,"A":12,"2":13,"黑桃":4,"紅心":3,"方塊":2,"梅花":1]
    
    return cards.sorted(by: {
        let a = (號碼:$0.號碼,花色:$0.花色)
        let b = (號碼:$1.號碼,花色:$1.花色)
        if ref[a.號碼]! >  ref[b.號碼]! {
            return true
        }
        return ref[a.號碼]! == ref[b.號碼]! && ref[a.花色]! > ref[b.花色]!
    })
    
//    答案：
//    return cards.sorted {
//        let a = (花色: sizeRef[$0.花色]!, 號碼: sizeRef[$0.號碼]!)
//        let b = (花色: sizeRef[$1.花色]!, 號碼: sizeRef[$1.號碼]!)
//        switch a.號碼 {
//        case (b.號碼 + 1)...:
//            return true
//        case b.號碼:
//            return a.花色 > b.花色
//        default:
//            return false
//        }
//    }
}
// 👇 請呼叫「大老二排序測試」這個 function 測試你的 function。你會需要把你設計的 function 當作引數丟進去。
大老二排序測試(排序扑克牌)



// 【ChaoCode】 Swift 基礎篇 19B：Closure 實作作業
// 答案 https://unngb44802.feishu.cn/docs/doccnurmFkRjfwy5A5de03EWdgg
// ⚠️ 請在不使用 Loop 語法的情況完成這次的每一項作業。
//
// 1. 請計算持有股票的總資產價值，計算方式為單股價格 * 持有股數。
typealias 股票 = (name: String, 單股價格: Double, 持有股數: Int)
let 持有股票: [股票] = [("台積電", 575.5, 1000), ("長榮航", 36.425, 7820), ("中鋼", 39.55, 5500), ("台泥", 47.95, 13600), ("元大台灣50", 135.15, 8000)]


print("💰 股票總資產價值為 ？ 元")


// 2. 請透過 getTeamRecords() 取得 NBA 球隊資料，並回答以下問題。
//    * getTeamRecords() 的回傳值是一個 [Team]，Team 是 (隊伍名: String, 勝場數: Int, 敗場數: Int, 分區: String) 的別稱。


// a. 請使用 .reduce 找出東區勝率最高的球隊。

print("🏆 東區勝率最高的隊伍是：？")


// b. 請使用 .contains 找出東區和西區個別是否有勝率低於 25%（含）的隊伍。

print("🏀 東區和西區個別是否有勝率低於 25% 的隊伍？  東區？？，西區？？")

// c. 請整理出一個「只有勝率至少有 60% 的隊伍」的 Array，Array 裡面的每筆資料是「隊伍名稱和勝率的 Tuple」，並將 Array 照勝率從高到低排序後印出。
// * 請把勝率 * 100 並轉成 Int，例如 0.52398 應轉為 52。

print("💪 勝率 60 % 以上（含）的隊伍")




struct doc {
    let name:String
    
    let code:String?
}

let docs:[doc?] = [.init(name: "first", code: "123"),nil,nil]

let phone = docs.map(\.?.code)
print(phone)
let phonenumber = docs.compactMap(\.?.code)
print(phoneNumber)


