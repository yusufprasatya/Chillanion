//
//  Screen8View.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 18/10/23.
//

import SwiftUI

struct Screen8View: View {
    @State private var selectedOption = 0
    @State private var isSelected = false
    @State private var isHover: Bool = false
    @State private var isOption1Selected: Bool = false
    
    let options = ["Option 1", "Option 2", "Option 3"]
    
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            VStack (alignment: .leading) {
                HStack{
                    Spacer()
                    Image("koala")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 178, height: 128)
                        .border(.red)
                    Spacer()
                }
                .padding(.top, 5)
                
                Text("Now, choose your sleep time!")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .border(.red)
                
                Text("Cool! Now, if you want to wake up at that time, it’ll be better if you can sleep at these time")
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.top, 24)
                    .border(.red)
                
                // make 3 rectangle that works like picker
                VStack{
                    RoundedPicker(
                        title1: "6-hour sleep",
                        title2: "00.00",
                        action: {
                            isOption1Selected.toggle()
                        }, 
                        backgroundColor: isOption1Selected ? .softYellow : .clear,
                        foregroundColor: isOption1Selected ? .black : .white,
                        cornerRadius: 15,
                        isSelected: $isOption1Selected)
                    
                    RoundedPicker(
                        title1: "7,5 hour sleep",
                        title2: "00.00",
                        action: {
                            isOption1Selected.toggle()
                        }, 
                        backgroundColor: .lightCyan,
                        foregroundColor: .black,
                        cornerRadius: 15,
                        isSelected: $isOption1Selected)
                    
                    RoundedPicker(
                        title1: "9 hour sleep",
                        title2: "00.00",
                        action: {
                            isOption1Selected.toggle()
                        },
                        backgroundColor: .lightCyan,
                        foregroundColor: .black,
                        cornerRadius: 15,
                        isSelected: $isOption1Selected)
                }
                
                
                
                Spacer()
                Spacer()
                RoundedButton(title: "What’s next?",
                              action: {},
                              backgroundColor: .paleLavender,
                              foregroundColor: .black,
                              cornerRadius: 15)
                Spacer()
            }
            .border(.red)
            .padding()
            .padding(.horizontal)
            .border(.red)
        }
    }
}

#Preview {
    Screen8View()
}
