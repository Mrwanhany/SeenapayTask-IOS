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

import SwiftUI

struct tete: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color(.red) // Optional background

            VStack(spacing: 0) {
                DailyRecipeCard()
                    .zIndex(1) // Keep it visually behind the Categories

                Spacer()
            }

            CategoryGrid()
                .offset(y: 425) // Adjust to overlap over the bottom of the image
                .zIndex(2)
        }
        .edgesIgnoringSafeArea(.top)
    }
}
struct DailyRecipeCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .topTrailing) {
                Image("pasta") // Your image name
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()

                Button(action: {}) {
                    Image(systemName: "bookmark")
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .padding()
            }

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("Daily Recipe")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(Color.red)
                        .clipShape(Capsule())

                    Spacer()

                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                        Text("4.9")
                            .foregroundColor(.white)
                    }
                    .padding(6)
                    .background(Color.black.opacity(0.6))
                    .clipShape(Capsule())
                }

                Text("Pasta Primavera")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)

                Text("by Nadine Hettinger")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))

                HStack {
                    Spacer()
                    Text("Italian")
                        .font(.caption)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            .background(Color.red)
        }
        .cornerRadius(20)
        .padding()
    }
}
struct CategoryGrid: View {
    let categories = [
        ("Breakfast", "baguette.fill"),
        ("Lunch", "takeoutbag.and.cup.and.straw.fill"),
        ("Dinner", "drumstick.fill"),
        ("Dessert", "icecream"),
        ("Western", "pizza.fill"),
        ("Asian", "bowl.rice.fill"),
        ("Drinks", "martini"),
        ("Meat", "steak")
    ]

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack(spacing: 20) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(categories, id: \.0) { category in
                    VStack {
                        Image(systemName: category.1)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .foregroundColor(.red)

                        Text(category.0)
                            .font(.footnote)
                            .foregroundColor(.black)
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 30)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: -5)
        )
    }
}
