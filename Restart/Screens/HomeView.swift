//
//  HomeView.swift
//  Restart
//
//  Created by Breno Henrique on 10/05/22.
//

import SwiftUI

struct HomeView: View
{
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View
    {
        VStack(spacing: 20)
        {
            //HEADER
            Spacer()
            
            ZStack
            {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation.easeInOut(duration: 4)
                            .repeatForever()
                        , value: isAnimating
                    )
            } //: ZStack
            
            //CENTER
            Text("O tempo que leva à maestria depende da intensidade do nosso foco.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            //FOOTER
            Spacer()
            
            Button(action:
            {
                withAnimation
                {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            })
            {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Reiniciar")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VStack
        .onAppear(perform:
            {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute:
                {
                     isAnimating = true
                })
            }
        )
    } //: body
}

struct HomeView_Previews: PreviewProvider
{
    static var previews: some View
    {
        HomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
