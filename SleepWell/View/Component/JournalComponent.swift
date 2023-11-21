//
//  JournComponent.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 12/11/23.
//
import SwiftUI
struct JournalComponent: View {
    let date: String
    let text: String
    var onEditTapped: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .fill(Color.circular1)
                    .frame(width: 15, height: 15)
                    .offset(x: 3)
                Text(date)
                    .fontWeight(.bold)
                    .foregroundColor(Color.circular1)
                    .font(.system(size: 22))
            }
            .padding(.leading, -10)
            
            HStack {
                Rectangle()
                    .fill(Color.circular1)
                    .frame(width: 2, height: 80)
                
                // Wrap the Rectangle in a Button
                Button(action: {
                    onEditTapped?()
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color.circular2)
                            .frame(width: 300, height: 80)
                            .cornerRadius(10)
                        
                        Text(text)
                            .font(Font.custom("Alegreya Sans", size: 15))
                            .foregroundColor(Color.black)
                            .padding(.top, 7.5)
                            .frame(width: 290, height: 74, alignment: .topLeading)
                    }
                }
                .onTapGesture {
                    onEditTapped?()
                }
            }
        }
        .padding(.horizontal)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        JournalComponent(date: "", text: "")
    }
}

