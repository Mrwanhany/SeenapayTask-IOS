//
//  CustomTabBar.swift
//  Seenapay-task
//
//  Created by Mrwan on 16/04/2025.
//

import SwiftUI
import SwiftUICore

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            TabBarItem(iconSelected: "homeSelected",iconUnSelected: "home", isSelected: selectedTab == 0) {
                selectedTab = 0
            }

            TabBarItem(iconSelected: "discoverSeleced",iconUnSelected: "discover", isSelected: selectedTab == 1) {
                selectedTab = 1
            }

            ZStack {
                Circle()
                    .fill(Color(hex: "#DB1414"))
                    .frame(width: 60, height: 60)
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
            }
            .offset(y: -5)

            TabBarItem(iconSelected: "offerSelected",iconUnSelected: "offer", isSelected: selectedTab == 3) {
                selectedTab = 3
            }

            TabBarItem(iconSelected: "profileSelected",iconUnSelected: "profile", isSelected: selectedTab == 4) {
                selectedTab = 4
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
        .background(Color.white.shadow(radius: 2))
    }
}
