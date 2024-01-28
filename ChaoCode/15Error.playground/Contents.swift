import Foundation

enum LoginError: Error {
    case invalidUsername
    case invalidPassword
    case userNotFound
    case unknownError
}

func login(username: String, password: String) throws {
    // 检查用户名和密码
    if username.isEmpty {
        throw LoginError.invalidUsername
    }
    if password.isEmpty {
        throw LoginError.invalidPassword
    }

    // 这里是模拟的用户验证过程，实际应用中需要连接数据库或者API来验证用户
    let user = ["username": "testUser", "password": "testPass"]

    if username != user["username"] || password != user["password"] {
        throw LoginError.userNotFound
    }

    // 登录成功的逻辑
    print("Login successful!")
}

do {
    try login(username: "", password: "testPass")
} catch let error as LoginError {
    switch error {
    case .invalidUsername:
        print("Invalid username!")
    case .invalidPassword:
        print("Invalid password!")
    case .userNotFound:
        print("User not found!")
    case .unknownError:
        print("Unknown error occurred!")
    }
}

// 【ChaoCode】 Swift 中級篇 15 Error Handling 實作作業

// 💡 請先閱讀 User 檔案，確認有哪些公開方法可以使用，也可以先看看有哪些錯誤。

// 1. 設計 createUser，依序使用 names 中的名字新建使用者，新建失敗時需印出對應的使用者名稱和原因。如果所有名字都無法使用就進入 Fatal Error，原因是：沒有可用的名字。
@discardableResult
func createUser(names: [String]) -> User {
    for name in names {
        do {
            var user = try User(name)
            return user
        } catch {
            print("\(name):", error.localizedDescription)
        }
    }

    fatalError("没有可用的名字")
}

// ⚠️ 以下為測試。確認沒問題後，後請把一定會失敗的第一組 ["安娜", "安", "比莉"] 刪除，以方便繼續進行測試正常情況。
let selectedNames = [["強尼", "貝克漢", "小周"]]
selectedNames.forEach { createUser(names: $0) }

print("-----------------------------------------------------------------")

// 2. 依步驟內指定的語法完成這題，指定的語法並非最佳寫法（甚至不好看），只是用來確保這幾個語法你都會使用。
// 1️⃣ 請使用 me 變數建立使用者 Jane，如果 Jane 已經存在了就使用 User.getUser 從使用者清單中取得 Jane。請在不使用 do-catch 的情況完成這題。
let me = (try? User("Jane")) ?? (try? User.getUser("Jane"))

func sendMessage(to other: String) {
    /* 2️⃣ 請透過 me 變數傳訊息給 people 中的每個使用者名稱，並搭配請 do-catch 處理錯誤。以下是所有需要處理的錯誤：
     ・AccountError.信箱未認證：印出「尚未完成信箱認證，將認證後重試⋯⋯」，並執行認證後再次傳送訊息。
     ・MessageError.被封鎖：印出「無法傳送訊息給 ＯＯＯ。」
     ・MessageError.僅接收好友訊息：印出「ＯＯＯ」僅接受互相追蹤的訊息，接著 follow 對方後再次傳送訊息並印出「將嘗試再次傳送⋯⋯」，如果在 follow 時報錯表示已經追蹤對方，則不重新傳送訊息（也就是不做任何事）。（這裡請只使用 do-catch。兩層 do-catch 並不是好的寫法，但這邊希望讓你測試一下自己是否真的理解 catch 的流程。）
     ・所有其他 MessageError：印出預設的描述。
     ・剩餘的錯誤則印出預設的錯誤描述，並使用 Fatal Error，原因是「未知的錯誤，這不該發生」。
     */
    var allowRetry = false
    repeat {
        allowRetry = false
        do {
            try me?.send(message: "你在哪裡", to: other)
        } catch let err as AccountError {
            switch err {
            case .信箱未認證:
                print("尚未完成信箱認證，將認證後重試⋯⋯")
                me?.validateMail()
                allowRetry = true
            default:
                print(err.localizedDescription)
            }
        } catch let err as MessageError {
            switch err {
            case .被封鎖:
                print("無法傳送訊息給 \(other)。")
            case .僅接收好友訊息:
                print("\(other)僅接受互相追蹤的訊息")
                do {
                    try me?.follow(username: other)
                    print("將嘗試再次傳送⋯⋯")
                    allowRetry = true
                } catch {}

            default:
                print(err.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
            fatalError("未知的錯誤，這不該發生")
        }

    } while allowRetry

    print("---------------------------------------")
}

// ⚠️ 以下為測試。
// let people = ["猴子", "比莉", "安娜", "強尼", "小周", "馬克", "ERROR"]
// people.forEach { sendMessage(to: $0) }

// 建立Error：throws throw

enum MathError: LocalizedError, CustomNSError {
    case cannotDividedEvenly, cannotDividedByZero

    static var errorDomain: String { "MathError" }

    var errorDescription: String? {
        switch self {
        case .cannotDividedByZero:
            return "除数不可为0"
        default:
            return "无法被整除"
        }
    }
}

extension Int {
    func dividedEvenly(by factor: Int) throws -> Int {
        guard factor != .zero else {
            throw MathError.cannotDividedByZero
        }
        guard self % factor == 0 else {
            throw MathError.cannotDividedEvenly
        }

        return self / factor
    }
}

let number = 3
let divisors = [2, 0, 3]
for divisor in divisors {
    do {
        let result = try number.dividedEvenly(by: divisor)
        print(result)
    } catch let error as NSError {
        print(error)
        print(error.localizedDescription)
        print(error.code)
        print(error.userInfo)
        print(error.domain)
    } catch {
        assertionFailure()
    }
}

// 转发错误：rethrows
// closure本身不会抛出任何错误
// 实参有可能会抛出错误

let array = [1, 2, 3]
extension Array {
    func joined(by separator: String, stringify: (Element) throws -> String) rethrows -> String {
        try map(stringify).joined(separator: separator)
    }
}

let joinedString = array.joined(by: ". ", stringify: \.description)
print(joinedString)
