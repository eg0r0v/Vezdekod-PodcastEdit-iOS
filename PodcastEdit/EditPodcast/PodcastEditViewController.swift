//
//  PodcastEditViewController.swift
//  PodcastEdit
//
//  Created by Илья Егоров on 16.09.2020.
//  Copyright © 2020 Илья Егоров. All rights reserved.
//

import UIKit
import AVFoundation

final class PodcastEditViewController: UIViewController {
    
    static var identifier: String { String(describing: self) }
    
    @IBOutlet private weak var stackView: UIStackView!
    private var player: AVAudioPlayer?

    private var podcast: CreatePodcastSettings!
    
    private var isPlaying = false
    
    func configure(podcast: CreatePodcastSettings) {
        self.podcast = podcast
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapPlay(_ sender: UIButton) {
        view.endEditing(true)

        isPlaying.toggle()
        let image = isPlaying ? #imageLiteral(resourceName: "pause_48") : #imageLiteral(resourceName: "icon_play")
        sender.setImage(image, for: .normal)
        
        if isPlaying {
            
            guard let url = Bundle.main.url(forResource: "Rhododendron", withExtension: "mp3") else { return }
            if player == nil {
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    try AVAudioSession.sharedInstance().setActive(true)
                    
                    player = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                    
                } catch let error {
                    debugPrint(error.localizedDescription)
                }
            }
            player?.play()
        } else {
            player?.pause()
        }
    }
    
    @IBAction func didTapAddTimecode(_ sender: UIButton) {
        guard let index = stackView.arrangedSubviews.firstIndex(of: sender) else { return }
        
         guard let timeCodeView = Bundle.main
            .loadNibNamed(String(describing: AddTimeCodeView.self), owner: self, options: nil)?
            .compactMap({ $0 as? AddTimeCodeView })
            .first else { return }
        
        if let podcastTime = podcast.file?.time {
            timeCodeView.configure(maxLength: podcastTime)
        }
        stackView.insertArrangedSubview(timeCodeView, at: index)
    }
    
    @IBAction func didTapNext(_ sender: Any) {
        view.endEditing(true)
        
        let identifier = NewPodcastViewController.identifier
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(identifier: identifier) as? NewPodcastViewController else { return }
        
        let timeCodes = stackView.arrangedSubviews
            .compactMap({ ($0 as? AddTimeCodeView)?.timeCode })
        
        viewController.configure(podcast: podcast, timeCodes: timeCodes)
        
        show(viewController, sender: self)
    }
}

extension PodcastEditViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
