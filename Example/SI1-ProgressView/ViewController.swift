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
    @IBOutlet private weak var containChartProgressView: UIView!
    @IBOutlet private weak var containCountdownProgressView: UIView!
    
    // MARK: - Properties
    private var chartProgressView: CircleProgressView!
    private var countdownProgressView: CircleProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationView()
    }
    
    private func configurationView() {
        countdownProgressView = CircleProgressView(frame: CGRect(x: 0, y: 0, width: containCountdownProgressView.frame.width, height: containCountdownProgressView.frame.height))
        containCountdownProgressView.addSubview(countdownProgressView)

        countdownProgressView.circleProgressType = .countdown
        countdownProgressView.progressPathWidth = 0.4
        countdownProgressView.countLabelFontSize = 25
        countdownProgressView.duration = 50
        countdownProgressView.circleProgressPathColor = .brown
        
        chartProgressView = CircleProgressView(frame: CGRect(x: 0, y: 0, width: containChartProgressView.frame.width, height: containChartProgressView.frame.height))
        containChartProgressView.addSubview(chartProgressView)
        
        chartProgressView.circleProgressType = .chart
        chartProgressView.progressPathWidth = 0.4
        chartProgressView.countLabelFontSize = 40
        chartProgressView.progressValue = 69
        chartProgressView.circleProgressPathColor = .cyan
    }
}
