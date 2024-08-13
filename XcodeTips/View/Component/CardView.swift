//
//  CardView.swift
//  XcodeTips
//
//  Created by Moon Jongseek on 8/10/24.
//

import SwiftUI

struct CardView<Content: View>: View where Content: View {
    var model: CardModel
    let childView: (() -> Content)?
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack(spacing: 15) {
                    Image(model.usgImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                    Rectangle()
                        .fill(model.mode == .light ? .black : .white)
                        .frame(width: 1, height: 35)
                    Image(model.codershighImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                }
                if let childView {
                    childView()
                }
            }
            .padding(30)
        }
        .frame(
            minWidth: 10, maxWidth: .infinity,
            minHeight: 10, maxHeight: .infinity
        )
        .aspectRatio(0.6182, contentMode: .fit)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(model.mode == .light ? .white : .black)
                .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 1)
        }
    }
    
    init(model: CardModel, _ view: (() -> Content)? = nil) {
        self.model = model
        self.childView = view
    }
}

#Preview {
    CardView<Spacer>(model: .init(mode: .light))
}
