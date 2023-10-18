import Foundation

public func 生肖測試(西元年: (Int) -> String, 國曆年: (Int) -> String){
    let 西曆 = [(1, "雞"), (677, "牛"), (1283, "羊"), (1999, "兔"), (2022, "虎"), (2222, "狗")]
    let 國曆 = [(1, "鼠"), (39, "虎"), (81, "猴"), (133, "鼠"), (1999, "馬"), (2022, "蛇")]
    
    for (年, 生肖) in 西曆 {
        let answer = 西元年(年)
        if answer != 生肖 {
            print("❌ 西元年 \(年) 應屬「\(生肖)」，但您的答案是 \(answer)")
            return
        }
    }
    
    print("✅ 您的西元年生肖 function 沒有問題")
    
    for (年, 生肖) in 國曆 {
        let answer = 國曆年(年)
        if answer != 生肖 {
            print("❌ 國曆年 \(年) 應屬「\(生肖)」，但您的答案是 \(answer)")
            return
        }
    }
    
    print("✅ 您的國曆年生肖 function 沒有問題")

}






typealias TestCase = (answer: Double, expr: String)
var secondTestCount = -1
public let intNumbers = [-3, -1, 0, 1, 17]
public let doubleNumbers = [-0.01, 0, 0.1, 9.13, 100.08]
public let decimalNumbers: [Decimal] = [ -1.001, 0, 0.1, 13.02, 99]
let testCases: [TestCase] = [(9.0, "Int(-3) * Int(-3)"), (0.0001, "Double(-0.01) * Double(-0.01)"), (1.0020009999999997, "Decimal(-1.001) * Decimal(-1.001)"), (0.03, "Int(-3) * Double(-0.01)"), (3.0029999999999997, "Int(-3) * Decimal(-1.001)"), (0.03, "Double(-0.01) * Int(-3)"), (0.01001, "Double(-0.01) * Decimal(-1.001)"), (3.0029999999999997, "Decimal(-1.001) * Int(-3)"), (0.01001, "Decimal(-1.001) * Double(-0.01)"), (3.0, "Int(-3) * Int(-1)"), (-0.0, "Double(-0.01) * Double(0.0)"), (-0.0, "Decimal(-1.001) * Decimal(0)"), (-0.0, "Int(-3) * Double(0.0)"), (-0.0, "Int(-3) * Decimal(0)"), (0.01, "Double(-0.01) * Int(-1)"), (-0.0, "Double(-0.01) * Decimal(0)"), (1.001, "Decimal(-1.001) * Int(-1)"), (-0.0, "Decimal(-1.001) * Double(0.0)"), (-0.0, "Int(-3) * Int(0)"), (-0.001, "Double(-0.01) * Double(0.1)"), (-0.1001, "Decimal(-1.001) * Decimal(0.1)"), (-0.30000000000000004, "Int(-3) * Double(0.1)"), (-0.30000000000000004, "Int(-3) * Decimal(0.1)"), (-0.0, "Double(-0.01) * Int(0)"), (-0.001, "Double(-0.01) * Decimal(0.1)"), (-0.0, "Decimal(-1.001) * Int(0)"), (-0.1001, "Decimal(-1.001) * Double(0.1)"), (-3.0, "Int(-3) * Int(1)"), (-0.0913, "Double(-0.01) * Double(9.13)"), (-13.033019999999999, "Decimal(-1.001) * Decimal(13.02)"), (-27.39, "Int(-3) * Double(9.13)"), (-39.06, "Int(-3) * Decimal(13.02)"), (-0.01, "Double(-0.01) * Int(1)"), (-0.1302, "Double(-0.01) * Decimal(13.02)"), (-1.001, "Decimal(-1.001) * Int(1)"), (-9.13913, "Decimal(-1.001) * Double(9.13)"), (-51.0, "Int(-3) * Int(17)"), (-1.0008, "Double(-0.01) * Double(100.08)"), (-99.09899999999999, "Decimal(-1.001) * Decimal(99)"), (-300.24, "Int(-3) * Double(100.08)"), (-297.0, "Int(-3) * Decimal(99)"), (-0.17, "Double(-0.01) * Int(17)"), (-0.99, "Double(-0.01) * Decimal(99)"), (-17.017, "Decimal(-1.001) * Int(17)"), (-100.18007999999999, "Decimal(-1.001) * Double(100.08)"), (1.0, "Int(-1) * Int(-1)"), (0.0, "Double(0.0) * Double(0.0)"), (0.0, "Decimal(0) * Decimal(0)"), (3.0, "Int(-1) * Int(-3)"), (-0.0, "Double(0.0) * Double(-0.01)"), (-0.0, "Decimal(0) * Decimal(-1.001)"), (0.01, "Int(-1) * Double(-0.01)"), (1.001, "Int(-1) * Decimal(-1.001)"), (-0.0, "Double(0.0) * Int(-3)"), (-0.0, "Double(0.0) * Decimal(-1.001)"), (-0.0, "Decimal(0) * Int(-3)"), (-0.0, "Decimal(0) * Double(-0.01)"), (-0.0, "Int(-1) * Double(0.0)"), (-0.0, "Int(-1) * Decimal(0)"), (-0.0, "Double(0.0) * Int(-1)"), (0.0, "Double(0.0) * Decimal(0)"), (-0.0, "Decimal(0) * Int(-1)"), (0.0, "Decimal(0) * Double(0.0)"), (-0.0, "Int(-1) * Int(0)"), (0.0, "Double(0.0) * Double(0.1)"), (0.0, "Decimal(0) * Decimal(0.1)"), (-0.1, "Int(-1) * Double(0.1)"), (-0.1, "Int(-1) * Decimal(0.1)"), (0.0, "Double(0.0) * Int(0)"), (0.0, "Double(0.0) * Decimal(0.1)"), (0.0, "Decimal(0) * Int(0)"), (0.0, "Decimal(0) * Double(0.1)"), (-1.0, "Int(-1) * Int(1)"), (0.0, "Double(0.0) * Double(9.13)"), (0.0, "Decimal(0) * Decimal(13.02)"), (-9.13, "Int(-1) * Double(9.13)"), (-13.02, "Int(-1) * Decimal(13.02)"), (0.0, "Double(0.0) * Int(1)"), (0.0, "Double(0.0) * Decimal(13.02)"), (0.0, "Decimal(0) * Int(1)"), (0.0, "Decimal(0) * Double(9.13)"), (-17.0, "Int(-1) * Int(17)"), (0.0, "Double(0.0) * Double(100.08)"), (0.0, "Decimal(0) * Decimal(99)"), (-100.08, "Int(-1) * Double(100.08)"), (-99.0, "Int(-1) * Decimal(99)"), (0.0, "Double(0.0) * Int(17)"), (0.0, "Double(0.0) * Decimal(99)"), (0.0, "Decimal(0) * Int(17)"), (0.0, "Decimal(0) * Double(100.08)"), (0.0, "Int(0) * Int(0)"), (0.010000000000000002, "Double(0.1) * Double(0.1)"), (0.010000000000000002, "Decimal(0.1) * Decimal(0.1)"), (-0.0, "Int(0) * Int(-3)"), (-0.001, "Double(0.1) * Double(-0.01)"), (-0.1001, "Decimal(0.1) * Decimal(-1.001)"), (-0.0, "Int(0) * Double(-0.01)"), (-0.0, "Int(0) * Decimal(-1.001)"), (-0.30000000000000004, "Double(0.1) * Int(-3)"), (-0.1001, "Double(0.1) * Decimal(-1.001)"), (-0.30000000000000004, "Decimal(0.1) * Int(-3)"), (-0.001, "Decimal(0.1) * Double(-0.01)"), (-0.0, "Int(0) * Int(-1)"), (0.0, "Double(0.1) * Double(0.0)"), (0.0, "Decimal(0.1) * Decimal(0)"), (0.0, "Int(0) * Double(0.0)"), (0.0, "Int(0) * Decimal(0)"), (-0.1, "Double(0.1) * Int(-1)"), (0.0, "Double(0.1) * Decimal(0)"), (-0.1, "Decimal(0.1) * Int(-1)"), (0.0, "Decimal(0.1) * Double(0.0)"), (0.0, "Int(0) * Double(0.1)"), (0.0, "Int(0) * Decimal(0.1)"), (0.0, "Double(0.1) * Int(0)"), (0.010000000000000002, "Double(0.1) * Decimal(0.1)"), (0.0, "Decimal(0.1) * Int(0)"), (0.010000000000000002, "Decimal(0.1) * Double(0.1)"), (0.0, "Int(0) * Int(1)"), (0.9130000000000001, "Double(0.1) * Double(9.13)"), (1.302, "Decimal(0.1) * Decimal(13.02)"), (0.0, "Int(0) * Double(9.13)"), (0.0, "Int(0) * Decimal(13.02)"), (0.1, "Double(0.1) * Int(1)"), (1.302, "Double(0.1) * Decimal(13.02)"), (0.1, "Decimal(0.1) * Int(1)"), (0.9130000000000001, "Decimal(0.1) * Double(9.13)"), (0.0, "Int(0) * Int(17)"), (10.008000000000001, "Double(0.1) * Double(100.08)"), (9.9, "Decimal(0.1) * Decimal(99)"), (0.0, "Int(0) * Double(100.08)"), (0.0, "Int(0) * Decimal(99)"), (1.7000000000000002, "Double(0.1) * Int(17)"), (9.9, "Double(0.1) * Decimal(99)"), (1.7000000000000002, "Decimal(0.1) * Int(17)"), (10.008000000000001, "Decimal(0.1) * Double(100.08)"), (1.0, "Int(1) * Int(1)"), (83.35690000000001, "Double(9.13) * Double(9.13)"), (169.5204, "Decimal(13.02) * Decimal(13.02)"), (-3.0, "Int(1) * Int(-3)"), (-0.0913, "Double(9.13) * Double(-0.01)"), (-13.033019999999999, "Decimal(13.02) * Decimal(-1.001)"), (-0.01, "Int(1) * Double(-0.01)"), (-1.001, "Int(1) * Decimal(-1.001)"), (-27.39, "Double(9.13) * Int(-3)"), (-9.13913, "Double(9.13) * Decimal(-1.001)"), (-39.06, "Decimal(13.02) * Int(-3)"), (-0.1302, "Decimal(13.02) * Double(-0.01)"), (-1.0, "Int(1) * Int(-1)"), (0.0, "Double(9.13) * Double(0.0)"), (0.0, "Decimal(13.02) * Decimal(0)"), (0.0, "Int(1) * Double(0.0)"), (0.0, "Int(1) * Decimal(0)"), (-9.13, "Double(9.13) * Int(-1)"), (0.0, "Double(9.13) * Decimal(0)"), (-13.02, "Decimal(13.02) * Int(-1)"), (0.0, "Decimal(13.02) * Double(0.0)"), (0.0, "Int(1) * Int(0)"), (0.9130000000000001, "Double(9.13) * Double(0.1)"), (1.302, "Decimal(13.02) * Decimal(0.1)"), (0.1, "Int(1) * Double(0.1)"), (0.1, "Int(1) * Decimal(0.1)"), (0.0, "Double(9.13) * Int(0)"), (0.9130000000000001, "Double(9.13) * Decimal(0.1)"), (0.0, "Decimal(13.02) * Int(0)"), (1.302, "Decimal(13.02) * Double(0.1)"), (9.13, "Int(1) * Double(9.13)"), (13.02, "Int(1) * Decimal(13.02)"), (9.13, "Double(9.13) * Int(1)"), (118.8726, "Double(9.13) * Decimal(13.02)"), (13.02, "Decimal(13.02) * Int(1)"), (118.8726, "Decimal(13.02) * Double(9.13)"), (17.0, "Int(1) * Int(17)"), (913.7304, "Double(9.13) * Double(100.08)"), (1288.98, "Decimal(13.02) * Decimal(99)"), (100.08, "Int(1) * Double(100.08)"), (99.0, "Int(1) * Decimal(99)"), (155.21, "Double(9.13) * Int(17)"), (903.8700000000001, "Double(9.13) * Decimal(99)"), (221.34, "Decimal(13.02) * Int(17)"), (1303.0416, "Decimal(13.02) * Double(100.08)"), (289.0, "Int(17) * Int(17)"), (10016.0064, "Double(100.08) * Double(100.08)"), (9801.0, "Decimal(99) * Decimal(99)"), (-51.0, "Int(17) * Int(-3)"), (-1.0008, "Double(100.08) * Double(-0.01)"), (-99.09899999999999, "Decimal(99) * Decimal(-1.001)"), (-0.17, "Int(17) * Double(-0.01)"), (-17.017, "Int(17) * Decimal(-1.001)"), (-300.24, "Double(100.08) * Int(-3)"), (-100.18007999999999, "Double(100.08) * Decimal(-1.001)"), (-297.0, "Decimal(99) * Int(-3)"), (-0.99, "Decimal(99) * Double(-0.01)"), (-17.0, "Int(17) * Int(-1)"), (0.0, "Double(100.08) * Double(0.0)"), (0.0, "Decimal(99) * Decimal(0)"), (0.0, "Int(17) * Double(0.0)"), (0.0, "Int(17) * Decimal(0)"), (-100.08, "Double(100.08) * Int(-1)"), (0.0, "Double(100.08) * Decimal(0)"), (-99.0, "Decimal(99) * Int(-1)"), (0.0, "Decimal(99) * Double(0.0)"), (0.0, "Int(17) * Int(0)"), (10.008000000000001, "Double(100.08) * Double(0.1)"), (9.9, "Decimal(99) * Decimal(0.1)"), (1.7000000000000002, "Int(17) * Double(0.1)"), (1.7000000000000002, "Int(17) * Decimal(0.1)"), (0.0, "Double(100.08) * Int(0)"), (10.008000000000001, "Double(100.08) * Decimal(0.1)"), (0.0, "Decimal(99) * Int(0)"), (9.9, "Decimal(99) * Double(0.1)"), (17.0, "Int(17) * Int(1)"), (913.7304, "Double(100.08) * Double(9.13)"), (1288.98, "Decimal(99) * Decimal(13.02)"), (155.21, "Int(17) * Double(9.13)"), (221.34, "Int(17) * Decimal(13.02)"), (100.08, "Double(100.08) * Int(1)"), (1303.0416, "Double(100.08) * Decimal(13.02)"), (99.0, "Decimal(99) * Int(1)"), (903.8700000000001, "Decimal(99) * Double(9.13)"), (1701.36, "Int(17) * Double(100.08)"), (1683.0, "Int(17) * Decimal(99)"), (1701.36, "Double(100.08) * Int(17)"), (9907.92, "Double(100.08) * Decimal(99)"), (1683.0, "Decimal(99) * Int(17)"), (9907.92, "Decimal(99) * Double(100.08)")]

public func resetCounter() { secondTestCount = -1 }

public func secondTest(_ answer: Double) {
    secondTestCount += 1
    let testCase = testCases[secondTestCount]
    if (answer == testCase.answer) { return }
    
    print("❌ \(testCase.expr) 答案應為 \(testCase.answer)，但您的答案是 \(answer)")
    assertionFailure("請試著修正您的 Function 後再執行")
}
