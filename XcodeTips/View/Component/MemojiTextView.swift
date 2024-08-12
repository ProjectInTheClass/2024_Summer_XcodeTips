//
//  MemojiTextView.swift
//  XcodeTips
//
//  Created by Moon Jongseek on 8/10/24.
//

import SwiftUI

// ⌥(option) + 키워드 클릭: 공식 문서 Overview표시 및 이동
// ⌘(command) + 키워드 클릭: 소스 선언부로 이동
struct MemojiTextView: UIViewRepresentable {
    var mode: Theme = .light
    @Binding var isVaildImage: Bool
    @Binding var emojiSticker: UIImage
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.centerVerticalText()
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        textView.textContentType = .none
        textView.allowsEditingTextAttributes = true
        textView.returnKeyType = .done
        textView.delegate = context.coordinator
        textView.centerVerticalText()
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        textView.centerVerticalText()
    }
    
    func makeCoordinator() -> TextViewCoordinator {
        TextViewCoordinator(textView: self)
    }
}

class TextViewCoordinator: NSObject, UITextViewDelegate {
    var textView: MemojiTextView
    init(textView: MemojiTextView) {
        self.textView = textView
    }
    
    func resizingImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio,
                             height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,
                             height: size.height * widthRatio)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if let character = text.first, character.isNewline {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textView.centerVerticalText()
        var nsTextAttachmentCount: [NSTextAttachment] = []
        textView.attributedText.enumerateAttribute(NSAttributedString.Key.attachment, in: NSRange(location: 0, length: textView.attributedText.length)) { value, range, _ in
            if value is NSTextAttachment {
                if let attachment = (value as? NSTextAttachment) {
                    nsTextAttachmentCount.append(attachment)
                }
            } else {
                textView.attributedText = NSAttributedString(string: "")
            }
        }
        if nsTextAttachmentCount.count > 0 {
            if let attachment = nsTextAttachmentCount.last {
                if let image = attachment.image {
                    self.textView.emojiSticker = image
                    self.textView.isVaildImage = true
                    let newImage = self.resizingImage(image: image, targetSize: textView.frame.size)
                    textView.attributedText = NSAttributedString(attachment: NSTextAttachment(image: newImage))
                }
                textView.endEditing(true)
            }
        } else {
            self.textView.isVaildImage = false
            self.textView.emojiSticker = UIImage()
        }
    }
}
