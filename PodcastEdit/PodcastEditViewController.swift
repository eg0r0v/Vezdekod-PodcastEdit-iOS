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
    
    private var timeCodes = [Int]()
    
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapAddTimecode(_ sender: UIButton) {
        guard let index = stackView.arrangedSubviews.firstIndex(of: sender) else { return }
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
