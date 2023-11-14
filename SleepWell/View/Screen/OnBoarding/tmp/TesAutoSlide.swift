//
//  TesAutoSlide.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 30/10/23.
//

import SwiftUI

struct TesAutoSlide: View {
    @State private var offset: CGFloat = 0
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<3) { index in
                        Text("Item \(index + 1)")
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .font(.title)
                    }
                }
            }
            .content.offset(x: offset)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .onReceive(timer) { _ in
                withAnimation {
                    offset -= geometry.size.width
                    if offset < -2 * geometry.size.width {
                        offset = 0
                    }
                }
            }
        }
    }
}

struct TabViewAutoSlide: View {
    @State private var selectedTab = 0
    let tabs = ["Tab 1", "Tab 2", "Tab 3"] // Replace with your tab names
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(0..<tabs.count, id: \.self) { index in
                Text(tabs[index])
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .onReceive(timer) { _ in
            withAnimation {
                selectedTab = (selectedTab + 1) % tabs.count
            }
        }
    }
}

#Preview {
    TesAutoSlide()
}
