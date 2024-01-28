//
//  NumberDisplayView.swift
//  myResume
//
//  Created by Actor on 2023/10/18.
//

import SwiftUI

struct TextButton: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Button(action: {}, label: {
            Text(text).frame(maxWidth: .infinity)
        }).buttonStyle(.bordered)
    }
}

struct ZeroDisplayView: View {
    var body: some View {
        Text("0")
            .font(.title2.bold())
            .padding()
            .frame(maxWidth: .infinity, alignment: .trailing)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.cyan.opacity(0.5)))
        //            .padding()
    }
}

struct NumberDisplayView: View {
    let calculatorInputs = [
        ["AC", "+/-", "%", "/"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="],
    ]
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Grid排版").font(.title.bold()).frame(maxWidth: .infinity)

                Grid {
                    ZeroDisplayView()
                    ForEach(calculatorInputs.dropLast(1), id: \.self) { row in
                        GridRow {
                            ForEach(row.dropLast(1), id: \.self) { cell in
                                TextButton(cell)
                            }
                            TextButton(row.last!).gridCellColumns(2)
                        }
                    }

                    GridRow {
                        TextButton("0").gridCellColumns(2)
                        TextButton(".")
                        TextButton("=").gridCellColumns(2)
                    }
                }

                Text("V/H Stack排版").font(.title.bold()).frame(maxWidth: .infinity)

                VStack {
                    ZeroDisplayView()
                    ForEach(calculatorInputs, id: \.self) { row in
                        HStack {
                            ForEach(row, id: \.self) { cell in
                                TextButton(cell)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct NumberDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        NumberDisplayView().padding()
    }
}
