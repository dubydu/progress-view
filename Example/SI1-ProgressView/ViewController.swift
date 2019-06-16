//
//  ViewController.swift
//  SI1-ProgressView
//
//  Created by SI-Du on 06/16/2019.
//  Copyright (c) 2019 SI-Du. All rights reserved.
//

import UIKit
import SI1_ProgressView

class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var containProgressView: UIView!
    
    // MARK: - Properties
    private var circleProgressView: CircleProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationView()
    }
    
    private func configurationView() {
        circleProgressView = CircleProgressView(frame: CGRect(x: 0, y: 0, width: containProgressView.frame.width, height: containProgressView.frame.height))
        containProgressView.addSubview(circleProgressView)
        
        circleProgressView.circleProgressType = .countdown
        circleProgressView.progressPathWidth = 0.4
        circleProgressView.countLabelFontSize = 20
        circleProgressView.duration = 50
        circleProgressView.circleProgressPathColor = .brown
    }
}

