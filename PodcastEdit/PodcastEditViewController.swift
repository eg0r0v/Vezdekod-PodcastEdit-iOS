//
//  PodcastEditViewController.swift
//  PodcastEdit
//
//  Created by Илья Егоров on 16.09.2020.
//  Copyright © 2020 Илья Егоров. All rights reserved.
//

import UIKit


final class PodcastEditViewController: UIViewController {
    
    @IBOutlet private weak var stackView: UIStackView!
//    @IBOutlet private weak var audioPlot: AKOutputWaveformPlot!
    
//    var viewa: AKplot

    
    private var isPlaying = false
    private var timeCodes = [Int]()
    
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapPlay(_ sender: UIButton) {
        view.endEditing(true)

        isPlaying.toggle()
        let image = isPlaying ? #imageLiteral(resourceName: "pause_48") : #imageLiteral(resourceName: "icon_play")
        sender.setImage(image, for: .normal)
    }
    
    @IBAction func didTapAddTimecode(_ sender: UIButton) {
        guard let index = stackView.arrangedSubviews.firstIndex(of: sender) else { return }
        
         guard let timeCodeView = Bundle.main
            .loadNibNamed(String(describing: TimeCodeView.self), owner: self, options: nil)?
            .compactMap({ $0 as? TimeCodeView })
            .first else { return }
        
        stackView.insertArrangedSubview(timeCodeView, at: index)
    }
    
    @IBAction func didTapNext(_ sender: Any) {
        view.endEditing(true)
    }
}

extension PodcastEditViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
