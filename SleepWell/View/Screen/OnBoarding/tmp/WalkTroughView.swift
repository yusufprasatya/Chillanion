////
////  WalkTrough.swift
////  SleepWell
////
////  Created by Muhammad Yusuf on 27/10/23.
////
//
//import SwiftUI
//
//struct WalkthroughView: View {
//    @State private var currentPage = 0
//    @Binding var screen: Int
//    @State private var showSkipButton = false // Added state for showing/hiding "Skip" button
//    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
//
//    let walkthroughData: [WalkthroughScreenData] = [
//        WalkthroughScreenData(title: "Irregular Sleep Schedule, Huh?", description: "Do you know that lack of a regular sleep routine is hurting our health? \n\n A regular sleep time was defined in the study as less than 30 minutes difference, on average, across seven nights. ", imageName: "welcome_image"),
//        WalkthroughScreenData(title: "Sleep Schedule Improvement", description: "By trying to sleep in the same time every night, it will help us to have a consistent sleep schedule that will lead to a better overall well-being. \n\nBut, it is not easy to do it alone.", imageName: "welcome_image"),
//        WalkthroughScreenData(title: "We understand..", description: "The joy that comes from having someone accompany us on our journey of improvement! \n\nSo..", imageName: "KoalaHug1")
//    ]
//
//    var body: some View {
//        TabView(selection: $currentPage) {
//            ForEach(0..<walkthroughData.count, id: \.self) { index in
//                WalkthroughScreen(walkthroughData: walkthroughData[index])
//                    .tag(index)
//            }
//        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//        .onReceive(timer) { _ in
//            withAnimation {
//                currentPage = (currentPage + 1) % walkthroughData.count
//            }
//        }
//        .background(
//            Image("OnboardingImage")
//                .resizable()
//                .scaledToFill()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .edgesIgnoringSafeArea(.all)
//        )
//        .overlay(
//            VStack {
//                Spacer()
//                if currentPage == 0 {
//                    RoundedButton(
//                        title: "Next",
//                        action: {
//                            withAnimation {
//                                currentPage += 1
//                            }
//                        },
//                        backgroundColor: .primaryButton,
//                        foregroundColor: .white,
//                        cornerRadius: 15)
//                } else if currentPage == 1 {
//                    RoundedButton(
//                        title: "Next",
//                        action: {
//                            withAnimation {
//                                currentPage += 1
//                            }
//                        },
//                        backgroundColor: .primaryButton,
//                        foregroundColor: .white,
//                        cornerRadius: 15)
//                } else {
//                    RoundedButton(
//                        title: "Next",
//                        action: {
//                            withAnimation {
//                                screen += 1
//                            }
//                        },
//                        backgroundColor: .primaryButton,
//                        foregroundColor: .white,
//                        cornerRadius: 15)
//                }
//                PageControl(numberOfPages: walkthroughData.count, currentPage: $currentPage)
//                    .padding(.bottom, 20)
//
//            }
//        )
//        .overlay(
//            // Skip Button
//            Button(action: {
//                // Handle the action for "Skip"
//                withAnimation {
//                    screen += 1
//                }
//            }) {
//                Text("Skip")
//                    .padding(.horizontal, 20)
//                    .padding(.vertical, 10)
//                    .foregroundColor(.lightpurple)
//                    .cornerRadius(10)
//            }
//            .padding(.top, 20) // Adjust the spacing from the top edge
//            .padding(.trailing, 20) // Adjust the spacing from the right edge
//            , alignment: .topTrailing
//        )
//    }
//}
//
//
//struct WalkthroughScreenData {
//    let title: String
//    let description: String
//    let imageName: String
//}
//
//struct WalkthroughScreen: View {
//    var walkthroughData: WalkthroughScreenData
//
//    var body: some View {
//        ZStack {
//            // Your existing content for the walkthrough screen
//            VStack {
//                Spacer()
//                HStack{
//                    Spacer()
//                    Image(walkthroughData.imageName)
//                        .resizable()
//                        .frame(maxWidth: 245, maxHeight: 234)
//                        .aspectRatio(contentMode: .fit)
//                        .padding(.horizontal, 40)
//                    Spacer()
//                }
//                Spacer()
//                VStack(alignment: .leading, spacing: 30){
//                    Text(walkthroughData.title)
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .foregroundStyle(Color.white)
//                        .padding(.leading, 10) // Adjust the leading padding
//                    
//                    Text(walkthroughData.description)
//                        .multilineTextAlignment(.leading)
//                        .foregroundStyle(Color.white)
//                        .padding(.leading, 10) // Adjust the leading padding
//                }
//                Spacer()
//                Spacer()
//            }
//        }
//        .padding(.trailing, 10) // Add this line to ensure consistent trailing alignment
//    }
//}
//
//struct PageControl: View {
//    var numberOfPages: Int
//    @Binding var currentPage: Int
//
//    var body: some View {
//        VStack{
//            HStack {
//                ForEach(0..<numberOfPages) { index in
//                    Circle()
//                        .fill(index == currentPage ? Color.white : Color.gray)
//                        .frame(width: 8, height: 8)
//                }
//            }
//            .padding(.top, 20)
//        }
//    }
//}
//#Preview {
//    WalkthroughView(screen: .constant(1))
//}
