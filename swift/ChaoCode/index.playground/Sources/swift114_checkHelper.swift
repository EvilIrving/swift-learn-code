import Foundation

func powCheck(_ powFunction: (Int, Int) -> Int)
{
    let bases = [0, 1, 2, 8, 13, 17, 23, 99, 100]
    let powers = [-7, -1, 0, 1, 2, 7]
    for positiveBase in bases {
        for base in Set([positiveBase, -positiveBase]) {
            for power in powers {
                let checkAnswer = powFunction(base, power)
                let expectedAnswer = (power < 0) ? 0 : Int(pow(Double(base), Double(power)))
                if (checkAnswer != expectedAnswer) {
                    print("❌ \(base) 的 \(power) 次方應為 \(expectedAnswer)，但您的計算結果是 \(checkAnswer)，請重新檢查哦")
                    return
                }
            }
        }
    }
    
    print("✅ 您的次方計算沒有問題！棒棒～")
}

public func 作業檢查(_ 次方計算: (Int, Int) -> Int) {
    powCheck(次方計算)
}
