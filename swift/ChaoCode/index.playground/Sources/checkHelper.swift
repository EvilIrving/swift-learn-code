/// 資料依序代表是：名字、是否是男生、年齡、身高、距離、自我介紹
public typealias Person = (String, Bool, Int, Double, Double, String)


public func 作業檢查(weather: (String, Bool, Int) -> Void, match: (Person) -> Void)
{
    weather("台灣", true, 1)
    weather("美國", true, 3)
    weather("捷克", true, 4)
    weather("英國", true, 6)
    weather("德國", true, 9)
    weather("日本", true, 11)
    weather("土耳其", true, 12)
    
    weather("澳洲", false, 1)
    weather("南非", false, 3)
    weather("烏拉圭", false, 6)
    weather("阿根廷", false, 7)
    weather("馬達加斯加", false, 9)
    weather("玻利維亞", false, 10)
    weather("紐西蘭", false, 11)
    weather("智利", false, 12)
    
    print("-----------")
    
    let people: [Person] = [
        ("康納", true, 28, 177, 7.5, "被程式碼耽誤的美食家。"),
        ("愛麗絲", false, 33, 160, 5.8, "日本、泰奶、哥吉拉"),
        ("史蒂夫", true, 40, 180, 8.2, "比你前任更有趣聰明又貼心。"),
        ("安妮", false, 29, 160, 4.5, "白天做物理研究，晚上餵貓喝啤酒。"),
        ("伊麗莎白", false, 18, 168, 12.3, "找一個高富帥生小孩。這一切都是為了我的小孩著想。"),
        ("卡拉", false, 25, 158, 0.3, "Hi"),
        ("茱莉", false, 32, 170, 22, "這個人沒有自我介紹"),
        ("奧利", true, 35, 182, 14, "要來我家看貓嗎？"),
        ("歐文", true, 19, 172, 3.5, "尋找我的靈魂伴侶。"),
        ("詹姆", true, 30, 175, 9.3, "幼稚園老師，對古怪的美人無抵抗力。"),
        ("凱莉", false, 20, 162, 10.9, "不怕蟑螂但怕蝴蝶。"),
        ("貝克漢", true, 42, 173, 10.3, "想和真誠，勇敢，熱愛生命的你一起去世界冒險。"),
        ("辛西雅", false, 26, 163, 1.9, "曾擔任風紀股長。"),
    ]
    for person in people { match(person) }
}
