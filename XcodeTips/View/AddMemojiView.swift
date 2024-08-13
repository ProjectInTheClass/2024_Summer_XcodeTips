//
//  AddMemojiView.swift
//  XcodeTips
//
//  Created by Moon Jongseek on 8/10/24.
//

import SwiftUI

struct AddMemojiView: View {
    var model: CardModel
    @State var image: UIImage = UIImage()
    @State var isShowAlert: Bool = false
    @State var isPresented: Bool = false
    @State var isVaildImage: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text(Title.addMemojiSticker.value)
                .font(.title)
                .padding(.top)
            
            // 카드
            CardView(model: model) {
                Group {
                    Text(model.name)
                        .font(.title)
                        .foregroundColor(model.mode == .light ? .black : .white)
                        .multilineTextAlignment(.center)
                        .frame(height: 40)
                    // ⌘(command) + 키워드 클릭: 소스 선언부로 이동
                    MemojiTextView(
                        mode: model.mode,
                        isVaildImage: $isVaildImage,
                        emojiSticker: $image
                    )
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(20)
                    .clipped()
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 1)
                            .foregroundColor(
                                Color.gray
                            )
                    }
                    Spacer()
                }
            }
            
            Text("미모티콘 스티커를 추가하세요.\n스티커는 이모티콘 키보드의 가장 왼쪽에 있습니다.\n미모티콘 스티커 외에는 입력이 불가능합니다.")
                .font(.footnote)
            
            Spacer()
            // Next Button
            Button {
                if isVaildImage {
                    isPresented.toggle()
                } else {
                    isShowAlert.toggle()
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
                MemojiCardView(
                    modle: CardModel(
                        mode: model.mode,
                        name: model.name,
                        image: image
                    )
                )
            }
            .frame(height: 44)
            .padding(.bottom, 40)
            
        }
        .padding([.horizontal], 50)
        .ignoresSafeArea(.keyboard)
        .alert(
            "미모지 스티커를 추가해주세요.",
            isPresented: $isShowAlert
        ) {
            Button("확인") {
                isShowAlert.toggle()
            }
        }
    }
}

#Preview {
    AddMemojiView(model: .init(mode: .dark))
}
