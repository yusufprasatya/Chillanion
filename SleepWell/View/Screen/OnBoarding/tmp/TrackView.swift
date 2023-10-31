//
//  TrackView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 24/10/23.
//

import SwiftUI

struct TrackView: View {
    @Binding var screen: Int
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            VStack (alignment: .leading) {
                Group {
                    Text("Track")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    Text("Help you to track your progress in improving your sleep schedule.")
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.bottom, 50)
                }
                HStack {
                    Spacer()
                    Image("TrackImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 241, height: 221)
                    Spacer()
                }
                RoundedButton(
                    title: "Next",
                    action: {
                        withAnimation{
                            screen += 1
                        }
                    },
                    backgroundColor: Color.primaryButton,
                    foregroundColor: .white,
                    cornerRadius: 15)
                .padding(.top, 150)
            }
            .padding()
            .padding(.top, -20)
            .padding(.horizontal)
        }
        .transition(.move(edge: .trailing))
    }
}

#Preview {
    TrackView(screen: .constant(1))
}
