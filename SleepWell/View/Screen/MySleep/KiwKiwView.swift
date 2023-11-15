//
//  KiwKiwView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 10/11/23.
//

import SwiftUI

struct KiwKiwView: View {
    @State private var selectedTab = 0
    @GestureState private var gestureOffset: CGFloat = 0
    @Namespace var topID
    @Namespace var bottomID

    var body: some View {
        ScrollViewReader{ proxy in
            ScrollView{
                Button("Scroll to Bottom") {
                               withAnimation {
                                   proxy.scrollTo(bottomID)
                               }
                           }
                           .id(topID)
                VStack(spacing: 0) {
                    ForEach(0..<100) { i in
                        color(fraction: Double(i) / 100)
                            .frame(height: 32)
                    }
                }
                Button("Top") {
                    withAnimation {
                        proxy.scrollTo(topID)
                    }
                }
                .id(bottomID)
            }
            
        }
    }
    
    func color(fraction: Double) -> Color {
        Color(red: fraction, green: 1 - fraction, blue: 0.5)
    }
}


#Preview {
    KiwKiwView()
}
