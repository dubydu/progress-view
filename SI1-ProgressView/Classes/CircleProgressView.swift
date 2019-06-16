//
//  CircleProgressView
//  SI1-ProgressView
//
//  Created by SI-Du on 06/16/2019.
//  Copyright (c) 2019 SI-Du. All rights reserved.
//

import UIKit

public class CircleProgressView: UIView {
    
    // MARK: Enumeration
    public enum CircleProgressType {
        case chart
        case countdown
    }

    // MARK: - Properties
    private var contentView: UIView!
    private var countLabel: UILabel!
    private var circleShape = CAShapeLayer()
    private let circleStrokeShape = CAShapeLayer()
    private var countdownTimer = ProgressTimer()
    private var countdown: Countdown?
    
    public var circleStrokePathColor: UIColor = .lightGray
    public var circleProgressType: CircleProgressType = .chart
    public var circleProgressPathColor: UIColor = .blue {
        didSet {
            circleShape.strokeColor = circleProgressPathColor.cgColor
            layoutIfNeeded()
        }
    }
    
    public var progressPathWidth: CGFloat = 0.25 {
        didSet {
            configurationCircleProgressView()
        }
    }
    
    public var duration: CFTimeInterval = 1 {
        didSet {
            configurationCircleProgressView()
            timerCalculator(seconds: Int(duration-1))
        }
    }
    
    public var progressValue: CGFloat = 100 {
        didSet {
            configurationCircleProgressView()
        }
    }
    
    public var countLabelFontSize: CGFloat = 15 {
        didSet {
            configurationCountLabelFontSize()
        }
    }

    // MARK: - Initialization Method
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        configurationCircleProgressView()
    }
    
    private func initView() {
        countLabel = UILabel()
        contentView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        
        addSubview(contentView)
        contentView.addSubview(countLabel)
        
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        countLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        countLabel.textAlignment = .center
        
        layoutIfNeeded()
    }
    
    // MARK: - Private Method
    private func drawCirclePath(startAngle: CGFloat, endAngle: CGFloat) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: contentView.center, radius: contentView.frame.height * progressPathWidth, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        return path
    }
    
    private func configurationCircleProgressView() {
        let backgroundPath = drawCirclePath(startAngle: (3 * CGFloat.pi) / 2, endAngle: (7 * CGFloat.pi) / 2)
        let circularPath = drawCirclePath(startAngle: (3 * CGFloat.pi) / 2, endAngle: ((3 * CGFloat.pi) / 2) + ((progressValue * (2 * .pi))/100))
        
        circleStrokeShape.strokeColor = circleStrokePathColor.cgColor
        circleStrokeShape.path = backgroundPath.cgPath
        circleStrokeShape.fillColor = UIColor.clear.cgColor
        circleStrokeShape.lineWidth = contentView.frame.height*0.18
        circleStrokeShape.lineCap = .butt
        contentView.layer.addSublayer(circleStrokeShape)
        
        circleShape.strokeColor = circleProgressPathColor.cgColor
        circleShape.path = circularPath.cgPath
        circleShape.fillColor = UIColor.clear.cgColor
        circleShape.lineWidth = contentView.frame.height*0.18
        circleShape.lineCap = .butt
        // circleShape.strokeEnd = 0
        
        contentView.layer.addSublayer(circleShape)
        circleProgressType == .chart ? transformProgressView(duration: 1): transformProgressView(duration: duration)
        transformProgressLabel()
    }
    
    private func transformProgressView(duration: TimeInterval) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.fromValue = 0
        basicAnimation.toValue = 1
        basicAnimation.duration = duration
        basicAnimation.speed = 1
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        circleShape.add(basicAnimation, forKey: "")
    }
    
    private func transformProgressLabel() {
        configurationCountLabelFontSize()
        if circleProgressType == .chart {
            self.countLabel.text = "\(Int(progressValue))%"
        } else {
            let timer = "\(countdown?.hour?.stringWithLeadingZero ?? "00"):\(countdown?.minute?.stringWithLeadingZero ?? "00"):\(countdown?.second?.stringWithLeadingZero ?? "00")"
            self.countLabel.text = timer
        }
    }
    
    private func configurationCountLabelFontSize() {
        self.countLabel.font = UIFont(name: "Avenir-BlackOblique", size: countLabelFontSize)
    }
    
    private func timerCalculator(seconds: Int) {
        countdownTimer.start(seconds: seconds)
        countdownTimer.countdownChanged = { countdown, ends in
            if !ends {
                self.countdown = countdown
                self.transformProgressLabel()
            }
        }
    }
}
// Extension Int
extension Int {
    var stringWithLeadingZero: String {
        return String(format: "%02d", self)
    }
}
