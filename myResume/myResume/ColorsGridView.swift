//
//  ColorsGridView.swift
//  myResume
//
//  Created by Actor on 2023/10/18.
//

import SwiftUI

struct ColorView:View {
    var color:Color
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        Rectangle().fill(color)
            .overlay(content: {
                Text( color.description)
            })
//            .gridCellUnsizedAxes(.vertical)
    }
}


struct ColorsGridView: View {
    var body: some View {
        
//        LazyHGrid
//        LazyVGrid
        
        VStack {
            Grid{
                GridRow {
                    ColorView(color: .pink).gridCellColumns(2)
                    
                    Grid{
                        ColorView(color: .blue)
                        ColorView(color: .purple)
                        ColorView(color: .brown)
                    }
                }
                Grid {
                    GridRow {
                        ColorView(color: .indigo)
                        ColorView(color: .orange)
                        Grid {
                            GridRow {
                                ColorView(color: .cyan)
                                ColorView(color: .yellow)
                            }
                            ColorView(color: .mint)
                            ColorView(color: .green)
                        }.gridCellColumns(2)
                    }
                }
            }
        }
    }
}
    
    struct ColorsGridView_Previews: PreviewProvider {
        static var previews: some View {
            ColorsGridView()
        }
    }
