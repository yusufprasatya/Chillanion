
import SwiftUI

struct OnboardingView: View {
    var body: some View {
        WalkthroughView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
struct WalkthroughView: View {
    @State private var currentPage = 0
    @State private var showSkipButton = false // Added state for showing/hiding "Skip" button

    let walkthroughData: [WalkthroughScreenData] = [
        WalkthroughScreenData(title: "Hey there, yes.. you!", description: "Do you experience lack of regular sleep routine? Irregular sleep schedule, perhaps? ", imageName: "welcome_image"),
        WalkthroughScreenData(title: "Maybe? C'mon, be serious!", description: "Do you know that lack of a regular sleep routine is hurting our health?", imageName: "welcome_image"),
        WalkthroughScreenData(title: "We understand..", description: "That's why we offer someone to accompany on your journey!", imageName: "welcome_image")
    ]

    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(0..<walkthroughData.count, id: \.self) { index in
                WalkthroughScreen(walkthroughData: walkthroughData[index])
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
                        }
                    }) {
                        Text("umm.. maybe?")
                            .padding(.horizontal, 104.5)
                            .padding(.vertical, 15)
                            .background(Color.lightpurple)
                            .fontWeight(.bold)
                            .foregroundColor(.purpleBg)
                            .cornerRadius(10)
                    }
                } else if currentPage == 1 {
                    Button(action: {
                        withAnimation {
                            currentPage += 1
                        }
                    }) {
                        Text("I know. But it's hard :(")
                            .padding(.horizontal, 76)
                            .padding(.vertical, 15)
                            .background(Color.lightpurple)
                            .fontWeight(.bold)
                            .foregroundColor(.purpleBg)
                            .cornerRadius(10)
                    }
                } else {
                    Button(action: {
                        // Handle the action for "Get Started"
                    }) {
                        Text("I CAN DO IT ALONE.")
                            .padding(.horizontal, 84)
                            .padding(.vertical, 15)
                            .background(Color.lightpurple)
                            .fontWeight(.bold)
                            .foregroundColor(.purpleBg)
                            .cornerRadius(10)
                    }
                }
                PageControl(numberOfPages: walkthroughData.count, currentPage: $currentPage)
                    .padding(.bottom, 20)

            }
        )
        .overlay(
            // Skip Button
            Button(action: {
                // Handle the action for "Skip"
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


struct WalkthroughScreenData {
    let title: String
    let description: String
    let imageName: String
}

struct WalkthroughScreen: View {
    var walkthroughData: WalkthroughScreenData

    var body: some View {
        ZStack {
            // Your existing content for the walkthrough screen
            VStack(spacing: 80) {
                Spacer()
                Image(walkthroughData.imageName)
                    .resizable()
                    .frame(maxWidth: 245, maxHeight: 234)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 40)

                VStack(alignment: .leading, spacing: 30) {
                    Text(walkthroughData.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(.leading, 10) // Adjust the leading padding

                    Text(walkthroughData.description)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color.white)
                        .padding(.leading, 10) // Adjust the leading padding
                    
                }
                Spacer()
                Spacer()
            }
        }
        .padding(.trailing, 10) // Add this line to ensure consistent trailing alignment
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
                    
                        .fill(index == currentPage ? Color.white : Color.gray)
                        .frame(width: 8, height: 8)
                    
                }
             
            }
            .padding(.top, 20)
        }
    }
}
