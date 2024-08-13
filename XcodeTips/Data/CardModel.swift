//
//  CardModel.swift
//  XcodeTips
//
//  Created by Moon Jongseek on 8/10/24.
//

import UIKit

// 코드 정렬: ⌃(control) + i
// 전체 블록 선택: ⌘(command) + a
struct CardModel {
    var mode: Theme
    var name: String = ""
    var image: UIImage = UIImage()
    
    var usgImageName: String {
        return mode == .light ? "USG.logo.white" : "USG.logo.black"
    }
    
    var codershighImageName: String {
        return mode == .light ? "codershigh.logo.white" : "codershigh.logo.black"
    }
}
