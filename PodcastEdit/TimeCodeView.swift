//
//  TimeCodeView.swift
//  PodcastEdit
//
//  Created by Илья Егоров on 16.09.2020.
//  Copyright © 2020 Илья Егоров. All rights reserved.
//

import UIKit

struct TimeCode {
    var name: String
    var time: Int = 0
}

final class TimeCodeView: UIView {

    @IBOutlet private weak var removeTimeCodeButton: UIButton!
    @IBOutlet private weak var nameTextView: UITextView!
    @IBOutlet private weak var timeTextView: UITextView!
    
    @IBAction private func didTapDelete(_ sender: UIButton) {
        endEditing(true)
        removeFromSuperview()
    }
    
    var timeCode: TimeCode? {
        if currentText.isEmpty || currentTime < 0 {
            return nil
        }
        return TimeCode(name: currentText, time: currentTime)
    }
    
    private let namePlaceholder = "Название таймкода"
    private let timePlaceholder = "00:00"
    
    private var currentText = ""
    private var currentTime = -1
}

extension TimeCodeView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == nameTextView {
            if currentText.isEmpty {
                textView.text = nil
                textView.textColor = .black
            }
            return
        }
        if textView == timeTextView {
            if currentTime < 0 {
                textView.text = nil
                textView.textColor = .black
            }
            return
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == nameTextView {
            if currentText.isEmpty {
                textView.text = namePlaceholder
                textView.textColor = .lightGrayCaptionColor
            }
            return
        }
        if textView == timeTextView {
            if currentTime < 0 {
                textView.text = timePlaceholder
                textView.textColor = .lightGrayCaptionColor
            }
            return
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        currentText = textView.text
//        onDidChangeText?(currentText.isEmpty ? nil : currentText)
    }
}
