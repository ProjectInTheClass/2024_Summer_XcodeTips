//
//  MemojiCardView.swift
//  XcodeTips
//
//  Created by Moon Jongseek on 8/11/24.
//

import SwiftUI

struct MemojiCardView: View {
    var modl: CardModel
    @State var viewSize: CGSize = .zero
    
    var cardView: some View {
        CardView(model: modl) {
            Group {
                Text(modl.name)
                    .font(.title)
                    .foregroundColor(modl.mode == .light ? .black : .white)
                    .multilineTextAlignment(.center)
                    .frame(height: 40)
                Image(uiImage: modl.image)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(20)
                Spacer()
            }
        }
    }
    
    func convertViewUIImage<V: View>(from view: V, size: CGSize) {
        let controller = UIHostingController(
            rootView: cardView
                .padding(.vertical, 3)
                .padding(.leading, -27.5)
                .ignoresSafeArea()
        )
        guard let view = controller.view else {
            return
        }
        
        var contentSize = viewSize
        contentSize.width += 5
        view.bounds = CGRect(origin: .zero, size: contentSize)
        view.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: contentSize)
        let uiImage = renderer.image { _ in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        
        // FIXME: 권한이 없는 경우, 안내창 표시하기
        UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(Title.saveMemojiCard.value)
                .font(.title)
                .padding(.top)
            
            // 카드
            cardView
                .background {
                    GeometryReader { reader in
                        Color.clear
                            .onAppear {
                                print(#function, reader.size)
                                viewSize = reader.size
                            }
                            .onChange(of: reader.size) {
                                print(#function, reader.size)
                                viewSize = $1
                            }
                    }
                }
                .contextMenu {
                    Button{
                        convertViewUIImage(from: cardView, size: viewSize)
                    } label: {
                        Label("사진으로 저장하기", systemImage: "camera")
                    }
                }
            
            
            Text("카드를 길게 터치하여 저장하세요.")
                .font(.footnote)
            
            Spacer()
            
            // TODO: 처음 화면으로 돌아가는 기능 구현하기
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5, style: .circular)
                        .fill(Color.blue)
                    Text("처음으로")
                        .foregroundStyle(Color.white)
                }
            }
            .frame(height: 44)
            .padding(.bottom, 40)
        }
        .padding([.horizontal], 50)
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    MemojiCardView(modl: .init(mode: .dark))
}

