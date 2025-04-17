//
//  TopAppBar 2.swift
//  Seenapay-task
//
//  Created by Mrwan on 17/04/2025.
//

import SwiftUI

 struct TopAppBar: View {
        var body: some View {
            HStack {
                
                Image("logo")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("Hello, Seena Pay")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
                
                
                ZStack(alignment: .topTrailing) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "bell")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.gray.opacity(0.8), lineWidth: 1)
                            )
                    }
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 10, height: 10)
                        .offset(x: 4, y: -4)
                }
            }
            .padding(.horizontal)
            
        }
    }
