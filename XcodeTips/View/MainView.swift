//
//  MainView.swift
//  XcodeTips
//
//  Created by Moon Jongseek on 8/9/24.
//

import SwiftUI

// MARK: 마크

// MARK: - 라인 마크

// !!!: 구현 시 주의사항

// TODO: 구현 및 수정 등 해야할 일

// FIXME: 고쳐주세요

// ???: 코드에 대한 의문점

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 10) {
                Text("Memoji Card Marker")
                    .font(.title)
                NavigationLink{
                    SelectThemeView()
                } label: {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 5,
                            style: .circular
                        )
                        .fill(Color.blue)
                        Text("Get Start!")
                            .foregroundStyle(Color.white)
                    }
                    .frame(height: 44)
                    .padding(10)
                }
            }
            .padding(20)
        }
    }
}

// Preview 단축키 : ⌥(option) + ⌘(command) + ⏎(return)
#Preview {
    MainView()
}
