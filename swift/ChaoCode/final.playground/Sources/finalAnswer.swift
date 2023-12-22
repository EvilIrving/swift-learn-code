// 【ChaoCode】 Swift 基礎篇：期末作業參考答案 😊

typealias 手牌 = (points: Int, cards: [Int])


func countCardsPoints(cards: [Int]) -> Int {
    var points = cards.reduce(0) { $0 + min($1, 10) }
    
    var totalACount = cards.filter { $0 == 1 }.count
    points += totalACount * 10
    
    while (totalACount > 0 && points > 21) {
        points -= 10
        totalACount -= 1
    }
    
    return points
}

func dealCard(to currentCards: 手牌 = (0, []), newCard: Int) -> 手牌 {
    let cards = currentCards.cards + [newCard]
    let points = countCardsPoints(cards: cards)
    
    return (points, cards)
}

func getCardsString(_ cards: 手牌) -> String {
    let specialCards = [ 1:"A", 11: "J", 12: "Q", 13: "K" ]
    let string = cards.cards.map { specialCards[$0] ?? $0.description }.joined(separator: " ")
    //    specialCards[$0] ?? $0.description 這段就是假如字典裡找不到對應的字就直接使用 description，等同於下面這段
    //    let string = specialCards[$0]
    //    if string != nil { return string! }
    //    return $0.description
    
    return string
}

func determineWinner(player: 手牌, banker: 手牌) {
    switch (player.points, banker.points) {
        case (22..., _):
            print("玩家爆牌，👑 莊家獲勝。")
        case (_, 22...):
            print("莊家爆牌，👑 玩家獲勝。")
        case (_, _) where banker.cards.count == 5:
            print("👑 莊家五張牌獲勝。")
        case (let playerPoint, let bankerPoint) where playerPoint == bankerPoint:
            print("平手。")
        case (let playerPoint, let bankerPoint):
            let winner = playerPoint > bankerPoint ? "玩家" : "莊家"
            let specialWin = playerPoint == 21 || bankerPoint == 21 ? "✨21 點✨ " : ""
            print("👑 \(winner) \(specialWin)獲勝。")
    }
}

// 遊戲開始

var cards = (Array(1...13) + Array(1...13)).shuffled()

var playerCards = dealCard(newCard: cards.popLast()!)
var bankerCards = dealCard(newCard: cards.popLast()!)

print("""
玩家第一張牌為 \(getCardsString(playerCards))；\
莊家第一張牌為 \(getCardsString(bankerCards))。
""")

var isPlayersTurn = true
var playerDidStop = false

game: while (playerCards.points < 21 && bankerCards.points < 21 && bankerCards.cards.count < 5)
{
    let willDealCard = Bool.random()
    
    switch isPlayersTurn {
        case true:
            print("＞ 玩家要補牌嗎？")
            if (willDealCard || playerCards.points < 11) {
                print("要")
                playerCards = dealCard(to: playerCards, newCard: cards.popLast()!)
            } else {
                print("玩家停止補牌。")
                playerDidStop = true
            }
            
        case false where bankerCards.points < 17 || willDealCard:
            print("＞ 莊家補牌。")
            bankerCards = dealCard(to: bankerCards, newCard: cards.popLast()!)
        case false where playerDidStop:
            print("＞ 莊家和玩家皆停止補牌。")
            break game
        case false:
            print("＞ 莊家不補牌。")
    }
    
    isPlayersTurn = playerDidStop ? false : !isPlayersTurn
}

determineWinner(player: playerCards, banker: bankerCards)

print("""
玩家 \(playerCards.points) 點，手牌為「\(getCardsString(playerCards))」；
莊家 \(bankerCards.points) 點，手牌為「\(getCardsString(bankerCards))」。
""")
