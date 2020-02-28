//
//  ContentView.swift
//  SwiftUI-Dict
//
//  Created by Eric Dolecki on 2/28/20.
//  Copyright © 2020 Eric Dolecki. All rights reserved.
//

import SwiftUI

struct ContentView: View
{
    let dict: [(key: String, value: Int)] = ["Eric Dolecki": 30, "J.R.R. Tolkien": 45, "Neil Peart": 10].sorted{$0.key < $1.key}
    
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View
    {
        NavigationView
        {
            List
            {
                ForEach(dict, id: \.0) { index, item in
                    Section(header:
                        
                        Text(index)
                            .font(.headline)
                            .foregroundColor(.white)
                            .modifier(sectionHeader(backgroundColor: Color(hex: 0x7B8CB4), foregroundColor: Color(.white)))
                    ) {
                        HStack {
                            Text(item.description)
                                .font(.title)
                            Spacer()
                            Text(index)
                                .font(.caption)
                        }
                        
                    }
                }
            }
            .navigationBarTitle("Match Score List")
        }
    }
}

public struct sectionHeader: ViewModifier{
    var backgroundColor:Color
    var foregroundColor:Color
    public func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: UIScreen.main.bounds.width, height: 40, alignment: .leading)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}
