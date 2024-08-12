//
//  AddNicknameView.swift
//  XcodeTips
//
//  Created by Moon Jongseek on 8/10/24.
//

import SwiftUI

struct AddNicknameView: View {
    var model: CardModel
    @State var isShowAlert: Bool = false
    @State var isPresented: Bool = false
    @State var nickname: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text(Title.addNickname.value)
                .font(.title)
                .padding(.top)
            
            // 카드
            CardView(model: model) {
                Group {
                    TextField(
                        "닉네임",
                        text: $nickname,
                        prompt: Text("닉네임").foregroundColor(.gray),
                        axis: .horizontal
                    )
                    .font(.title)
                    .foregroundColor(model.mode == .light ? .black : .white)
                    .multilineTextAlignment(.center)
                    .padding(5)
                    .frame(height: 40)
                    .clipped()
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color(red: 200/255, green: 200/255, blue: 200/255))
                    }
                    Spacer()
                }
            }
            
            Spacer()
            // Next Button
            Button {
                if nickname.isEmpty {
                    isShowAlert.toggle()
                } else {
                    isPresented.toggle()
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5, style: .circular)
                        .fill(Color.blue)
                    Text("Next")
                        .foregroundStyle(Color.white)
                }
            }
            .navigationDestination(isPresented: $isPresented) {
                AddMemojiView(
                    model: CardModel(
                        mode: model.mode,
                        name: nickname
                    )
                )
            }
            .frame(height: 44)
            .padding(.bottom, 40)
        }
        .padding([.horizontal], 50)
        .ignoresSafeArea(.keyboard)
        // 주석 단축키 ⌘(command) + /
//        .alert(
//            "닉네임을 입력해주세요.",
//            isPresented: $isShowAlert
//        ) {
//            Button("확인") {
//                isShowAlert.toggle()
//            }
//        }
    }
}

#Preview {
    AddNicknameView(model: .init(mode: .dark))
}
