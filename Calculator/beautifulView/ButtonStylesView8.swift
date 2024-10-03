//
//  ButtonStylesView8.swift
//  Calculator
//
//  Created by JZ P on 2024/7/28.
//

import SwiftUI

struct ButtonStylesView8: View {
    // 定义按钮的标题和位置
    let buttons: [(title: String, x: CGFloat, y: CGFloat)] = [
        ("1", 0, 0), ("2", 1, 0), ("3", 2, 0), ("4", 3, 0), ("5", 4, 0), ("6", 5, 0),
        ("7", 0, 1), ("8", 1, 1), ("9", 2, 1), ("0", 3, 1), ("+", 4, 1), ("-", 5, 1),
        ("*", 0, 2), ("/", 1, 2), ("=", 2, 2), ("C", 3, 2), (".", 4, 2), ("%", 5, 2)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(buttons.indices, id: \.self) { index in
                    let button = buttons[index]
                    CalculatorButton8(title: button.title, style: index / 6 + 1)
                        .frame(width: 50, height: 50)
                        .position(
                            x: button.x * 60 + 30,
                            y: button.y * 60 + 30
                        )
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct CalculatorButton8: View {
    let title: String
    let style: Int
    
    var body: some View {
        switch style {
        case 1:
            Text(title)
                .font(.title)
                .frame(width: 50, height: 50)
                .background(Color.gray.opacity(0.5))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.2), radius: 5, x: 2, y: 2)
        case 2:
            Text(title)
                .font(.title)
                .frame(width: 50, height: 50)
                .background(LinearGradient(gradient: Gradient(colors: [.gray, .black]), startPoint: .top, endPoint: .bottom))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: -2, y: -2)
        case 3:
            Text(title)
                .font(.title)
                .frame(width: 50, height: 50)
                .background(Color.black.opacity(0.8))
                .foregroundColor(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .shadow(color: .white.opacity(0.2), radius: 5, x: 3, y: 3)
        default:
            Text(title)
                .font(.title)
                .frame(width: 50, height: 50)
                .background(Color.gray.opacity(0.5))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.2), radius: 5, x: 2, y: 2)
        }
    }
}


#Preview {
    ButtonStylesView8()
}
