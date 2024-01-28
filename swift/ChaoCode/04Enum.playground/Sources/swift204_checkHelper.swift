// 👇 請把下面的內容貼回作業最下方進行第二題的檢查。

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
