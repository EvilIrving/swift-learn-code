// ⚠️ 這次的測試需要跟你的 property wrapper 在同一個檔案中。請自行把要測試的 code 貼回你的作業下方測試。你要全放到最下方或是一個一個單獨測試都可以。
// ⚠️ 每個 struct 代表一個測試，直接呼叫他的靜態方法 .check() 即可檢查。

// 1️⃣
struct TrimTest {
    @Trimmed var input: String

    static func check() {
        let testCases: [(test: String, answer: String)] = [
            ("\n \t  Hello, \nWorld  \n", "Hello, \nWorld"),
            (" 　你好世界。", "你好世界。"),
            ("Hello~~", "Hello~~"),
            ("         \n\n\n\n", ""),
            ("🐶     ", "🐶"),
        ]
        for (string, answer) in testCases {
            let testCase = TrimTest(input: string)
            guard testCase.input == answer  else {
                print("❌「\(string)」應該被儲存為「\(answer)」，但您的結果為「\(testCase.input)」")
                return
            }
        }

        var trimmed = TrimTest(input: "")
        for (string, answer) in testCases {
            trimmed.input = string
            guard trimmed.input == answer  else {
                print("❌「\(string)」應該被儲存為「\(answer)」，但您的結果為「\(trimmed.input)」")
                return
            }
        }

        print("✅ 您的 Trimmed 屬性包裝沒有問題。")
    }
}
//
//
// 2️⃣
struct LogTest {
    static func check() {
        print("⚠️ 請自行比對以下 print 內容，應該要是剛好 4 次放大鏡和 2 次鉛筆。")
        LogTestModel(description: "日期", from: Date.now, to: Date(timeIntervalSince1970: 1))
        LogTestModel(description: "郵遞區號", from: (100, "中正區"), to: (802, "苓雅區"))
    }

    struct LogTestModel<T> {
        @Log var data: T
        var secondValue: T

        init(description: String, from data: T, to secondValue: T) {
            _data = .init(wrappedValue: data, 描述: description)
            self.secondValue = secondValue
            self.data
            self.data = secondValue
            self.data
        }
    }
}
//
//
// 3️⃣
struct PercentTest {
    @Percentage var defaultDigitTest: Double
    @Percentage var customDigitTest: Double

    init(number: Double, digits: Int) {
        defaultDigitTest = number
        _customDigitTest = .init(wrappedValue: number, 小數點位數: digits)
    }

    static func check() {
        let testCases: [(number: Double, digits: Int, defaultAnswer: String, customAnswer: String)] = [
            // 測整數
            (1, 2, "100%", "100%"),
            (2, 2, "200%", "200%"),
            (-1, 2, "-100%", "-100%"),
            (1.999, 2, "200%", "200%"),
            // 測小數四捨五入
            (0.2345, 3, "23%", "23.5%"),
            (0.8712, 3, "87%", "87.1%"),
            (0, 3, "0%", "0.0%"),
            (0.1234, 4, "12%", "12.34%"),
            (0.12345, 4, "12%", "12.35%"),
            (-0.123, 4, "-12%", "-12.30%"),
            (-0.09756, 4, "-10%", "-9.76%"),
            // 測小數位數小於 2
            (-1, 1, "-100%", "-100%"),
            (0, 0, "0%", "0%"),
            (-0.881, -2, "-88%", "-88%"),
            (0.7787, -3, "78%", "78%"),
        ]

        for (number, digits, defaultAnswer, customAnswer) in testCases {
            let testCase = PercentTest(number: number, digits: digits)
            guard testCase.$defaultDigitTest == defaultAnswer else {
                print("❌ 兩位小數的 \(number) 應顯示為 \(defaultAnswer)，而您的結果是「\(testCase.$defaultDigitTest)」")
                return
            }
            guard testCase.$customDigitTest == customAnswer else {
                print("❌ \(digits) 位小數的 \(number) 應顯示為 \(customAnswer)，而您的結果是「\(testCase.$customDigitTest)」")
                return
            }
        }

        print("✅ 您的 Percentage 屬性包裝沒有問題。")
    }
}
//
//
// 👇 下面這幾行會執行測試。
TrimTest.check()
print("-------------------")
LogTest.check()
print("-------------------")
PercentTest.check()
