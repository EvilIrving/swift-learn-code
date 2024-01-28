
/*: ### 【ChaoCode】 Swift 中級 4：Enum 實作作業
 ---
 1. 建立一個名為「感情狀態」的 enum。
 * 一共有五種選項：單身、穩定交往中、已婚、開放式關係、一言難盡。
 * 穩定交往和結婚需要輸入伴侶名字。
 * 調整這個類型被印出來時顯示的文字，如果是穩定交往或是已婚需要顯示對象。
 ```
 例如：和小白穩定交往中。
 ```
 ---
 */
enum 感情狀態: CustomStringConvertible {
    case 單身, 穩定交往中(伴侶: String), 已婚(伴侶: String), 開放式關係, 一言難盡

    var description: String {
        switch self {
        case .單身:
            return "单身"
        case .穩定交往中(let 伴侶):
            return "和\(伴侶)交往中"
        case .已婚(let 伴侶):
            return "已婚(伴侣: \(伴侶))"
        case .開放式關係:
            return "开放关系"
        case .一言難盡:
            return "一言难尽"
        }
    }
}

// 👇 請勿刪除下面的 print，你需要讓它們可以正常執行，請自行確認結果是否如同預期。
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

enum 卡牌花色:Equatable {
    case 黑桃, 紅心, 方塊, 梅花
}

enum 卡牌數字 {
    case ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king,
}

struct Card {
    var 花色: 卡牌花色
    var 數字: 卡牌數字
}
