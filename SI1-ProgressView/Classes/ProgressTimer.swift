//
//  ProgressTimer
//  SI1-ProgressView
//
//  Created by SI-Du on 06/16/2019.
//  Copyright (c) 2019 SI-Du. All rights reserved.
//

import UIKit

struct Countdown {
    var second: Int?
    var minute: Int?
    var hour: Int?
}

public class ProgressTimer {
    
    // MARK: - Properties
    private var timer: Timer?
    private var seconds: Int = 0
    private var countdown = Countdown()
    var countdownChanged: ((_ value: Countdown, _ finished: Bool) -> Void)?
    
    // MARK: - Public Method
    func start(seconds: Int) {
        self.seconds = seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    // MARK: - Private Method
    private func updateCountdown() {
        let secondValue = seconds % 60
        let minuteValue = seconds / 60 % 60
        let hourValue = seconds / 3600
        countdown = Countdown(second: secondValue, minute: minuteValue, hour: hourValue)
    }
    
    private func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    // MARK: - Target
    @objc private func update() {
        updateCountdown()
        countdownChanged?(countdown, seconds < 0)
        if seconds <= 0 {
            stop()
        } else {
            seconds -= 1
        }
    }
}
