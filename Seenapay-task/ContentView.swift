//
//  ContentView.swift
//  Seenapay-task
//
//  Created by Mrwan on 16/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            TopAppBar()
              Group {
                  switch selectedTab {
                  case 0: HomeView()
                  case 1: Text("Discover")
                  case 2: Text("")
                  case 3: Text("Offers")
                  case 4: Text("Profile")
                  default: HomeView()
                  }
              }
              .frame(maxWidth: .infinity, maxHeight: .infinity)

              CustomTabBar(selectedTab: $selectedTab)
          }
       
          .edgesIgnoringSafeArea(.bottom)
      }
}

#Preview {
    ContentView()
}

