
// 【ChaoCode】 Swift 中級篇 17 Asynchronous 實作作業

import _Concurrency
import AppKit
import Foundation

/*
   语法:
 async await
 Task{}
 @MainActor
     @MainActor.run{}

 DispatchQueue.main.async{}
 Task.detached {  @MainActor in

 }

  网络读取资料:
  let randomPic  = URL(string: "")
 URLSession 的 dataTask

   */

// 1. 以下是一段 Synchronous 的叫外送方式，請修改讓外送變成 Asynchronous 的，讓最後在大約 3 秒初完成所有運送「所有餐點」。
// ⚠️ 下一集會教更便利地一次處理多個任務的方法，但現在請用目前學會的方式來處理，確保掌握了基本概念。
let orderTime = Date.now
var itemReceived = 0
extension Deliverable {
    func order() async {
        guard let _ = try? await Task.sleep(seconds: Self.deliveryTime) else {
            assertionFailure("超时无法送达：\(self)")
            return
        }

        print("您的餐點已抵達：\(self)")
    }
}

let allItems: [Deliverable] = Food.allCases + Drink.allCases
print(allItems.count)

// 答案
for item in allItems {
    await item.order()
    
    Task {
        defer {
            itemReceived += 1
            if itemReceived == (Food.allCases.count + Drink.allCases.count) {
                printElapsedTime(from: orderTime)
            }
        }

        await item.order()
    }
}

// for item in allItems {
//    Task { @MainActor in
//        await item.order()
//        itemReceived += 1
//        if itemReceived == (Food.allCases.count + Drink.allCases.count) {
//            printElapsedTime(from: orderTime)
//        }
//    }
// }

/* 2. 練習取得網路上的資料，請透過下列網址會取得隨機貓咪知識，收到資料請透過 CatFact(data:) 來啟動 CatFact，並印出其中的 fact。請取得三個貓咪知識，並且滿足以下條件：
 > 三個請求等待不阻擋彼此。
 > 確保網路請求不是在 Main Thread 進行，而最後印出來貓咪知識時是在 Main Thread 進行。
 > 在網路請求和印出貓咪知識的地方都印出是否在 Main Thread。
 */
enum 网络错误: Error {
    case 失去连接
}

struct CatFact: Codable {
    let fact: String
    let length: Int

    init(data: Data) throws {
        self = try JSONDecoder().decode(CatFact.self, from: data)
    }

    static func getCatFact() async throws -> String? {
        print("> 網路請求是否在 Main Thread？\(Thread.current.isMainThread)")
        let url = "https://catfact.ninja/fact"
        let (data, res) = try await URLSession.shared.data(from: URL(string: url)!)
        guard let res = res as? HTTPURLResponse, (200 ... 299).contains(res.statusCode) else {
            throw 网络错误.失去连接
        }
        var cat: CatFact? = try CatFact(data: data)
        guard let cat = cat else {
            return nil
        }
        return cat.fact
    }
}

var catIdx = 0
var catTime = Date.now

for _ in 1 ... 3 {
    Task.detached { @MainActor in
        let fact = try await CatFact.getCatFact()
        catIdx += 1
        print("🐈 貓咪知識：\(fact!)")
        print("> 印出貓咪知識是否在 Main Thread？\(Thread.current.isMainThread)")
        if catIdx == 3 {
            printElapsedTime(from: catTime)
        }
    }
}

// 答案
/*

 enum HTTPError: Error {
     case invalidResponse
 }

 struct CatFact: Codable {
     let fact: String
     let length: Int

     init(data: Data) throws {
         self = try JSONDecoder().decode(CatFact.self, from: data)
     }

     private static let requestUrl = URL(string: "https://catfact.ninja/fact")!

     static func getRandomFact() async throws -> String {
         print("> 網路請求是否在 Main Thread？\(Thread.current.isMainThread)")
         let (data, res) = try await URLSession.shared.data(from: requestUrl)
         guard let res = res as? HTTPURLResponse,
               (200 ... 299).contains(res.statusCode)
         else {
             throw HTTPError.invalidResponse
         }

         let catFact = try CatFact(data: data)
         return catFact.fact
     }
 }

 var catCount = 1
 var catTime = Date.now
 for _ in 1 ... 3 {
     Task {
         let fact = (try? await CatFact.getRandomFact()) ?? "Something went wrong..."
         await MainActor.run {
             print("> 印出貓咪知識是否在 Main Thread？\(Thread.current.isMainThread)")
             print("🐈 貓咪知識：\(fact)")
             catCount += 1
             if catCount == 4 {
                 printElapsedTime(from: catTime)
             }
         }
     }
 }
  */
