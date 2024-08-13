//
//  Title.swift
//  XcodeTips
//
//  Created by Moon Jongseek on 8/12/24.
//

import Foundation

enum Title {
    case selectTheme
    case addNickname
    case addMemojiSticker
    case saveMemojiCard
    
    // 멀티 커서: ⌃(control) + ⇧(shift) + 원하는 위치 클릭
    var value: String {
        switch self {
        case .selectTheme:
            return "테마 선택하기"
        case .addNickname:
            return "닉네임 작성하기"
        case .addMemojiSticker:
            return "미모지 추가하기"
        case .saveMemojiCard:
            return "카드 저장하기"
        }
    }
}
