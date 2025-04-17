//
//  HomeView.swift
//  Seenapay-task
//
//  Created by Mrwan on 16/04/2025.
//

import SwiftUI


struct HomeView: View {
    
    let easyRecipes = [
        Recipe(name: "Scrambled Egg", rating: "4.8", reviews: "Six Reviews", chef: "Gordon Ramsay",image: "scScrambledEggImg"),
        Recipe(name: "Grilled Cheese Sandwich", rating: "4.9", reviews: "4K Reviews", chef: "Alain Ducasse",image: "grilledCheeseSandwichImg"),
        Recipe(name: "Pasta with Garland Olive Oil", rating: "4.8", reviews: "3.5K Reviews", chef: "Yannick Alfano",image: "pastaWithImg")
    ]
    
    let egyptianFood = [
        Recipe(name: "Nasi Goreng Rendang", rating: "5", reviews: "7K Reviews", chef: "William Wongie",image: "nasiImg"),
        Recipe(name: "Coto Makassar", rating: "4.9", reviews: "1K Reviews", chef: "Arnold Poememo",image: "cotoMakassarImg"),
        Recipe(name: "Ayam Betutu", rating: "4.9", reviews: "2K Reviews", chef: "Juna Rotimpanzey",image: "ayamBetutuImg")
    ]
    
    let categories: [Category] = [
         Category(iconName: "breakfast", title: "Breakfast"),
         Category(iconName: "lunch", title: "Lunch"),
         Category(iconName: "dinner", title: "Dinner"),
         Category(iconName: "dessert", title: "Dessert"),
         Category(iconName: "western", title: "Western"),
         Category(iconName: "asian", title: "Asian"),
         Category(iconName: "drinks", title: "Drinks"),
         Category(iconName: "meat", title: "Meat")
     ]
     
     let columns = [
         GridItem(.flexible()),
         GridItem(.flexible()),
         GridItem(.flexible()),
         GridItem(.flexible())
     ]
    
    var body: some View {
        VStack {
           
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    
                    
                    featuredRecipeCard
                    
                    categorySection
                        .offset(y:-30)
                    
                    
                    recipeSection(title: "Easy & Simple Recipe", recipes: easyRecipes, showSeeMore: true)
                    
                    Divider()
                        .frame( height: 2)
                        .background(Color.gray)
                    
                    
                    recipeSection(title: "Egyptian Food", recipes: egyptianFood, showSeeMore: true)
                }
                .padding(.bottom)
            }
            
        }
        
    }
    
    var categorySection: some View {
        
        VStack(spacing: 20) {
                 Capsule()
                     .frame(width: 40, height: 4)
                     .foregroundColor(.gray.opacity(0.5))
                     .padding(.top, 10)

                 LazyVGrid(columns: columns, spacing: 20) {
                     ForEach(categories) { category in
                         VStack {
                             Circle()
                                 .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                 .frame(width: 60, height: 60)
                                 .overlay(
                                     Image( category.iconName)
                                         .foregroundColor(.red)
                                         .font(.system(size: 24))
                                 )
                             Text(category.title)
                                 .font(.footnote)
                                 .foregroundColor(.black)
                         }
                     }
                 }
           
             }

    }
    
    func categoryButton(title: String,  icon: String) -> some View {
        
        VStack {
            Image(icon)
                .resizable()
                .frame(width: 30, height: 30)
                .padding()
                .background(Color.white)
                .cornerRadius(30)
                .overlay(
                    Circle()
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            Text(title)
                .font(.caption)
        }
        
    }
    
    func recipeSection(title: String, recipes: [Recipe], showSeeMore: Bool) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                if showSeeMore {
                    Spacer()
                    
                    Button("See More") {}
                        .font(.subheadline)
                        .foregroundColor(Color(hex: "#DB1414"))
                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(recipes) { recipe in
                        recipeCard(recipe: recipe)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    func recipeCard(recipe: Recipe) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 150, height: 150)
                
                // Placeholder for image
                Image(recipe.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
            .cornerRadius(10, corners: [.allCorners])
            
            
            
            Text(recipe.name)
                .font(.headline)
                .lineLimit(1)
            
            
            VStack (alignment: .leading){
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("\(recipe.rating) | \(recipe.reviews)")
                        .font(.caption)
                }
                
                
                
                HStack(spacing: 4) {
                    Image("varifiedChief")
                        .resizable()
                        .frame(width: 15,height: 15)
                    
                    
                    Text(recipe.chef)
                        .font(.caption)
                        .underline()
                        .foregroundColor(.gray)
                }
            }
            
            
            
        }
        .frame(width: 150)
    }
    
    var featuredRecipeCard: some View {
        
            ZStack(alignment: .topLeading) {
                
                Image("dailyRecipeImg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                    .clipped()
                
                HStack {
                    Text("Daily Recipe")
                        .font(.caption)
                        .bold()
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color(hex: "#DB1414"))
                    
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "bookmark")
                            .foregroundColor(.black)
                            .padding(8)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                }
                .padding(12)
                .padding(.top,35)
                
                VStack {
                    
                    
                    VStack {
                        HStack {
                            Spacer()
                            HStack(spacing: 4) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.red)
                                    .font(.caption)
                                Text("4.9")
                                    .foregroundColor(.black)
                                    .font(.caption)
                                    .bold()
                            }
                            .padding(6)
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                    }
                    .padding(.top, 150)
                    .padding(.horizontal, 12)
                    
                    
                    VStack {
                        Spacer()
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Pasta Primavera")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text("by Nadine Hettinger")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Text("Italian")
                                .font(.caption)
                                .bold()
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.white)
                                .foregroundColor(Color(hex: "#DB1414"))
                            
                                .cornerRadius(16)
                        }
                        .padding()
                        .background(Color(hex: "#DB1414"))
                        .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                    }
                    
                    
                }
            }
            .offset(y:-45)
        }
    }
    
 
