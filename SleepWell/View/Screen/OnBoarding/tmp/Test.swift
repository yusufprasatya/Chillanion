//
//  Test.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 14/11/23.
//

import SwiftUI

struct Test: View {
    @State private var rectangleWidth: CGFloat = 58
    @State private var ofSetRectangle : CGFloat = -50
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ZStack{
            Button(action: {
                withAnimation{
                    rectangleWidth = 160
                    ofSetRectangle = 0
                }
            }, label: {
                ZStack{
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(Color.green)
                        .fill(.clear)
                        .frame(width: 160, height: 48)
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .fill(.blue)
                        .frame(width: rectangleWidth, height: 48)
                        .offset(x: ofSetRectangle)
                }
            })
        }
    }
}

#Preview {
    Test()
}
