import Foundation

func firstTest(_ 印單一個字: (String, Int) -> Void){
    印單一個字("１", 1)
    印單一個字("WWDC 2022 發佈會日期", 14)
    let article = "蘋果（Apple）今天正式宣佈 WWDC 2022 全球開發者大會時間，將於6月6日至6月10日以線上形式舉行，與過去兩年相同開發者皆可免費參加，在 WWDC 2022 將會展示全新 iOS 16、iPadOS 16、macOS 13、tvOS 16 和 watchOS 9 系統，屆時也有可能會在 WWDC 開發者大會上看見新硬體。"
    印單一個字(article, 29)
    印單一個字(article, 157)
    印單一個字(article, article.count)
    印單一個字("Emoji🌤🤪😊🎉", 8)
}

func secondTest(_ 迴文檢查: (CustomStringConvertible) -> Bool) {
   // let intCases = [(112, false), (101, true), (9999, true)]
    let testCases: [(CustomStringConvertible, Bool)] = [("人人為我，我為人人", true), ("花蓮噴水池噴蓮花", false), (112, false), ("大哥大", true), ("狗狗", true), ("天上龍捲風捲上天", false), ("11/11/11", true), ("bbc", false), (101, true), ("4個4", true), ("array", false), ("111.1111", false), ("✨🇹🇼✨", true), ("學數學", true), ("喜歡的少年是你，你是少年的歡喜", false), ("下雨吃東西", false), ("reviver", true), ("水上自來水來自水上", false), ("霍格華茲魔法與巫術學校的小精靈", false), ("生魚片生", false), (9999, true), ("好", true), ("船上女子叫子女上船", true), ("akasaka", true), ("起喘藥喘喘氣", false), ("王國", false), ("牙刷刷牙", true), ("été", true), ("réifier", false), ("sins", false), ("484", true), ("level", true), ("國泰飛機飛泰國", true), ("自我突破破除自我", false), ("wow", true)]
    
    for testCase in testCases {
        let result = 迴文檢查(testCase.0)
        if (result != testCase.1) {
            let isPalindrome = testCase.1 ? "是" : "不是"
            print("❌ \(testCase.0) 「\(isPalindrome)」，但您的答案是 \(result)")
            return
        }
    }
    print("✅ 您的迴文檢查沒有問題")
}


public func 作業檢查(第一題: (String, Int) -> Void, 第二題: (CustomStringConvertible) -> Bool) {
    firstTest(第一題)
    secondTest(第二題)
}

