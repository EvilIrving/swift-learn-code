//
//  GridView.swift
//  myResume
//
//  Created by Actor on 2023/10/18.
//

import SwiftUI
struct AnimalVote:Identifiable {
    var name:String
    var vote:Int
    var rate:Double
    
    var id: String { name }
    
    static let mockSet: [AnimalVote] = [
        .init(name: "🦋 ButterFly", vote: 10000, rate: 0.5),
        .init(name: "🐯 Tiger", vote: 34, rate: 0.8),
        .init(name: "🦁️ Lion", vote: 22, rate: 0.2)
    ]
}

struct GridView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("* 默认排列")
            ForEach(AnimalVote.mockSet){ animal in
                HStack {
                    Text(animal.name).lineLimit(1).minimumScaleFactor(0.2)
                    Gauge(value: animal.rate){ }
                    Text(animal.vote.description).lineLimit(1).minimumScaleFactor(0.5)
                }
            }
            
            Text("* Grid排列").frame(maxWidth: .infinity,alignment: .leading)
            
            Grid {
                ForEach(AnimalVote.mockSet){animal in
                    GridRow {
                        Text(animal.name)
                            .gridColumnAlignment(.leading)
                            .lineLimit(1)
                            .minimumScaleFactor(0.2)
                            
                        Gauge(value: animal.rate){ }
                        Text(animal.vote.description)
                            .gridColumnAlignment(.trailing)
                    }
                }
                
                GridRow {
                    Text("🐰 rat")
                    Gauge(value: 0.8) {}
                    Text("9")
                }
            }
        }.padding().font(.title2)
//            .dynamicTypeSize(.xSmall ... .accessibility2)
        
        
        
       
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
