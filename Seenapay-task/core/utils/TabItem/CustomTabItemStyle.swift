//
//  CustomTabBarItem.swift
//  Seenapay-task
//
//  Created by Mrwan on 16/04/2025.
//

import SwiftUICore
import SwiftUI

struct TabBarItem: View {
    var iconSelected: String
    var iconUnSelected: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 4) {
            Button(action: action) {
                Image(isSelected ? iconSelected : iconUnSelected)
                    .font(.system(size: 24))
                    .foregroundColor(isSelected ? .red : .gray)
            }
            Rectangle()
                .frame(height: 2)
                .foregroundColor(isSelected ? .red : .clear)
                .padding(.top, 4)
        }
        .frame(maxWidth: .infinity)
    }
}
