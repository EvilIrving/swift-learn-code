import Foundation

/// 一隻可戰鬥的動物。
public struct Animal
{
    public let name: String
    public var hp: Int
    public let power: Int
    
    /// 建立一隻動物，血量範圍為 1 ~ 50，力量範圍為 1 ~ 10，超過範圍將取最接近值。
    /// - Parameter name: 名字
    /// - Parameter hp: 血量
    /// - Parameter power: 力量
    public init(_ name: String, hp: Int, power: Int)
    {
        var name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        if (name.count == 0) { name = "無名氏🥲" }
        
        self.name = name
        self.hp = hp < 1 ? 1 : min(50, hp)
        self.power = power < 1 ? 1 : min(10, power)
    }
    
    /// 和另外一隻動物戰鬥。預設是我方先攻。
    /// 這個方法會印出對戰訊息並回傳獲勝的動物。
    /// - Returns: 獲勝的動物
    public func 戰鬥(對上 敵人: Animal, 我方先攻: Bool = true) -> Animal
    {
        var attacker = 我方先攻 ? self : 敵人
        var defender = 我方先攻 ? 敵人 : self
        print("⚔️⚔️⚔️ \(name)（HP \(hp) 力量 \(power)） VS \(敵人.name) （HP \(敵人.hp) 力量 \(敵人.power)）⚔️⚔️⚔️")
        
        while (attacker.hp > 0 && defender.hp > 0)
        {
            defender.hp -= attacker.power
            let hpMessage = defender.hp > 0 ? "\(defender.name)血量剩餘 \(defender.hp)。" : "致命一擊！\(defender.name)被打倒了。"
            print("\t\(attacker.name) 對 \(defender.name) 造成了 \(attacker.power) 點傷害！ \(hpMessage)")
            (attacker, defender) = (defender, attacker)
        }
        
        print("✨「\(defender.name)」獲勝！🏆")
        return defender
    }
    
    public static let 戰鬥規則: String = "兩隻動物輪流攻擊，1 點力量可以消耗對方 1 點血量，先讓敵方血量歸零者獲勝。"
    
    /// 隨機產生一隻動物
    public static func 隨機() -> Animal
    {
        let names = "🐶🐱🐹🐰🐻🐼🐻‍❄️🐨🐯🦁🐮🐷🐸🐵🐔🐧🐤🦊🐴🦄🐝🐛🦋🐌🐞🐢🐙🦑🦀🐠🐟🐡🐬🦭🐳🦉"
        return Animal(String(names.randomElement()!),
                      hp: Int.random(in: 10...50),
                      power: Int.random(in: 1...10))
    }
}
