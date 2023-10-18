//
//  DotLineShape.swift
//  myResume
//
//  Created by Actor on 2023/10/16.
//

import SwiftUI

struct DotLineShape: Shape {
    var lineWidth:CGFloat = 5
    var circleSize:CGFloat = 14
    enum lineStyle { case bottomHalf,full,topHalf}
    var style:lineStyle = .full
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let dotBase = style == .bottomHalf ? 0.3 : style == .topHalf ? 0.5 : 0.5
        let lineBase = style == .full ? 1 : style == .bottomHalf ? 0.7 : 0.5
        
        path.addEllipse(in: CGRect(x: rect.midX - circleSize / 2,
                                   y: rect.height * dotBase - circleSize / 2,
                                   width: circleSize,
                                   height: circleSize))
        
        path.addRect(CGRect(x: rect.midX - lineWidth/2,
                            y: style == .bottomHalf ? rect.height * dotBase : rect.minY,
                            width: lineWidth,
                            height: rect.height * lineBase ))
        return path
    }
    
  
}

struct DotLineShape_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            DotLineShape(style: .bottomHalf).background(.cyan)
            DotLineShape(style: .full).background(.yellow)
            DotLineShape(style: .topHalf).background(.cyan)
        }.frame(height: 500)
    }
}
