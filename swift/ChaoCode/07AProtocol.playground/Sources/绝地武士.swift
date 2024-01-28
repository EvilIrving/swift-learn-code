import Foundation

public protocol 绝地 {
    associatedtype Level: Strideable where Level.Stride == Int

    var name: String { get }
    var hp: Int { get set }
    var 最大hp: Int { get set }
    var 攻击力: Int { get set }
//    var 等级: Int { get set }
    var 等级: Level { get set }

//    mutating func 提升等级()
}

public extension 绝地 {
    mutating func 休息() {
        hp = 最大hp
        print("\(name)恢复满血")
    }

    mutating func 升级() {
        最大hp = Int(Double(最大hp) * 1.1)
        攻击力 = Int(Double(攻击力) * 1.2)
        hp = 最大hp
        // 等级 += 1
        // 提升等级()
        等级 = 等级.advanced(by: 1)
        print("\(name)升级")
    }

    func 攻击<T: 可战斗>(on target: inout T) {
        target.hp -= 攻击力
        print("\(target.name)掉血\(攻击力)")
    }
}
