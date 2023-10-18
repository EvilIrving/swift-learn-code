//
//  UnsizedAxesView.swift
//  myResume
//
//  Created by Actor on 2023/10/18.
//

import SwiftUI

struct UnsizedAxesView: View {
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    Color.yellow
                        .gridCellUnsizedAxes(.vertical)
                        .gridCellUnsizedAxes(.horizontal)
                    
                    Image("iu3").resizable().aspectRatio(contentMode: .fit)
                }
                
                GridRow{
                   
                    Image("iu2").resizable().aspectRatio(contentMode: .fit)
                        .gridCellUnsizedAxes(.vertical)
                    Image("iu").resizable().aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

struct UnsizedAxesView_Previews: PreviewProvider {
    static var previews: some View {
        UnsizedAxesView()
    }
}
