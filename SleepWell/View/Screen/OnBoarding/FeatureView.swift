//
//  FeatureView.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 31/10/23.
//

import SwiftUI

struct FeatureView: View {
    @Binding var screen: Int
    @State private var currentPage = 0
    @State private var showSkipButton = false // Added state for showing/hiding "Skip" button
    
    let featuresData: [FeatureScreenData] = [
        FeatureScreenData(title: "Imagine....", description: "if you can have a friend who can", imageName: ""),
        FeatureScreenData(title: "Plan", description: "Help you to schedule your bed time, slowly, but consistently.", imageName: "PlanImage"),
        FeatureScreenData(title: "Track", description: "Help you to track your progress in improving your sleep schedule.", imageName: "TrackImage"),
        FeatureScreenData(title: "Remind", description: "Remind you about what habit you can improve to have a better sleeping schedule.", imageName: "RemindImage")
    ]
    
    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(0..<featuresData.count, id: \.self) { index in
                FeaturesScreenView(featureScreenData: featuresData[index])
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(
            Image("OnboardingImage")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        )
        .overlay(
            VStack {
                Spacer()
                if currentPage == 0 {
                    Button(action: {
                        withAnimation {
                            currentPage += 1
                            print("click")
                        }
                    }, label: {
                        HStack {
                            Image(systemName: "chevron.right")
                                .font(.title)
                                .frame(width: 43, height: 41)
                                .foregroundColor(.white)
                                .background(Color.primaryButton)
                                .cornerRadius(15)
                        }
                    })
                } else if currentPage == 1 {
                    HStack(spacing: 80) {
                        Button(action: {
                            withAnimation {
                                currentPage -= 1
                                print("cluck")
                            }
                        }, label: {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .font(.title)
                                    .frame(width: 43, height: 41)
                                    .foregroundColor(.white)
                                    .background(Color.primaryButton)
                                    .cornerRadius(15)
                            }
                        })
                        
                        Button(action: {
                            withAnimation {
                                currentPage += 1
                                print("cleck")
                            }
                        }, label: {
                            HStack {
                                Image(systemName: "chevron.right")
                                    .font(.title)
                                    .frame(width: 43, height: 41)
                                    .foregroundColor(.white)
                                    .background(Color.primaryButton)
                                    .cornerRadius(15)
                            }
                        })
                    }
                }else if currentPage == 2 {
                    HStack(spacing: 80) {
                        Button(action: {
                            withAnimation {
                                currentPage -= 1
                                print("cluck")
                            }
                        }, label: {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .font(.title)
                                    .frame(width: 43, height: 41)
                                    .foregroundColor(.white)
                                    .background(Color.primaryButton)
                                    .cornerRadius(15)
                            }
                        })
                        
                        Button(action: {
                            withAnimation {
                                currentPage += 1
                                print("cleck")
                            }
                        }, label: {
                            HStack {
                                Image(systemName: "chevron.right")
                                    .font(.title)
                                    .frame(width: 43, height: 41)
                                    .foregroundColor(.white)
                                    .background(Color.primaryButton)
                                    .cornerRadius(15)
                            }
                        })
                    }
                }
                else {
                    HStack(spacing: 80) {
                        Button(action: {
                            withAnimation {
                                currentPage -= 1
                            }
                        }, label: {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .font(.title)
                                    .frame(width: 43, height: 41)
                                    .foregroundColor(.white)
                                    .background(Color.primaryButton)
                                    .cornerRadius(15)
                            }
                        })
                        
                        Button(action: {
                            withAnimation {
                                screen += 1
                            }
                        }, label: {
                            HStack {
                                Image(systemName: "chevron.right")
                                    .font(.title)
                                    .frame(width: 43, height: 41)
                                    .foregroundColor(.white)
                                    .background(Color.primaryButton)
                                    .cornerRadius(15)
                            }
                        })
                    }
                }
                PageControl(numberOfPages: featuresData.count, currentPage: $currentPage)
                    .padding(.bottom, 20)
                
            }
        )
        .overlay(
            // Skip Button
            Button(action: {
                // Handle the action for "Skip"
                withAnimation {
                    screen += 1
                }
            }) {
                Text("Skip")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .foregroundColor(.lightpurple)
                    .cornerRadius(10)
            }
                .padding(.top, 20) // Adjust the spacing from the top edge
                .padding(.trailing, 20) // Adjust the spacing from the right edge
            , alignment: .topTrailing
        )
    }
}


struct FeatureScreenData {
    let title: String
    let description: String
    let imageName: String
}

struct FeaturesScreenView: View {
    var featureScreenData: FeatureScreenData
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                Spacer()
                Group {
                    Text(featureScreenData.title)
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    Text(featureScreenData.description)
                        .font(.system(size: 17, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.bottom, 50)
                }
                Spacer()
                HStack {
                    Spacer()
                    Image(featureScreenData.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 241, height: 221)
                    Spacer()
                }
                Spacer(minLength: 250)
            }
            .padding()
            .padding(.top, -20)
            .padding(.horizontal)
        }
    }
}

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        VStack{
            HStack {
                ForEach(0..<numberOfPages) { index in
                    Circle()
                        .fill(index == currentPage ? Color.white : Color.primaryButton)
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.top, 20)
        }
    }
}
#Preview {
    FeatureView(screen: .constant(1))
}
