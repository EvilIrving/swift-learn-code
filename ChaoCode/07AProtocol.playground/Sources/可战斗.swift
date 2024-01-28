import Foundation

public protocol 可战斗 {
    var name: String { get }
    var hp: Int { get set }
    var 最大hp: Int { get set }
    var 攻击力: Int { get set }
    var 等级: Int { get set }

    init()
}

public extension 可战斗 {
    mutating func 休息() {
        hp = 最大hp
        print("\(name)恢复满血")
    }

    mutating func 升级() {
        最大hp = Int(Double(最大hp) * 1.1)
        攻击力 = Int(Double(攻击力) * 1.2)
        hp = 最大hp
        等级 += 1
        print("\(name)升级")
    }

    func 攻击<T: 可战斗>(on target: inout T) {
        target.hp -= 攻击力
        print("\(target.name)被\(name)攻击，掉血\(攻击力)")
    }
}
