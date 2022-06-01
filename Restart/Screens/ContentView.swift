//
//  ContentView.swift
//  Restart
//
//  Created by Breno Henrique on 10/05/22.
//

import SwiftUI

struct ContentView: View
{
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View
    {
        ZStack
        {
            if isOnboardingViewActive //== true
            {
                OnboardingView()
            }
            
            else
            {
                HomeView()
            }
        } //: ZStack
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
