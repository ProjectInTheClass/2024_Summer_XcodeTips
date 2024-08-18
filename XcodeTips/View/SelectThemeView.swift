//
//  SelectThemeView.swift
//  XcodeTips
//
//  Created by Moon Jongseek on 8/10/24.
//

import SwiftUI

// 커서 이동 단축키
// - ⌥(option) + 좌우 화살표: 단어 혹은 키워드 단위 이동
// - ⌘(command) + 좌우 화살표: 줄 맨 끝으로 이동
struct SelectThemeView: View {
    // MARK: - Properties
    @State var mode: Theme = .light
    
    // MARK: - Life Cycles
    var body: some View {
        VStack(spacing: 20) {
            Text(Title.selectTheme.value)
                .font(.title)
                .padding(.top)
            
            // 카드
            CardView(model: .init(mode: mode)) {
                Spacer()
            }
            
            // SegmentedControl
            Picker("Select Theme", selection: $mode) {
                ForEach(Theme.allCases, id: \.self) { mode in
                    Text("\(mode.rawValue)")
                }
            }
            .pickerStyle(.segmented)
            
            Spacer()
            // Next Button
            NavigationLink{
                AddNicknameView(
                    model: CardModel(
                        mode: mode
                    )
                )
            } label: {
                ZStack {
                    RoundedRectangle(
                        cornerRadius: 5,
                        style: .circular
                    )
                    .fill(Color.blue)
                    Text("Next")
                        .foregroundStyle(Color.white)
                }
            }
            .frame(height: 44)
            .padding(.bottom, 40)
            
        }
        .padding([.horizontal], 50)
    }
}

#Preview {
    SelectThemeView()
}
