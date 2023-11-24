//
//  ListItem.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 20/11/23.
//

import SwiftUI

struct ListItem: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Text(icon)
                .font(.largeTitle)
            Text(title)
                .font(.subheadline)
                .fontDesign(.rounded)
                .fontWeight(.regular)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ListItem(icon: "", title: "")
}
