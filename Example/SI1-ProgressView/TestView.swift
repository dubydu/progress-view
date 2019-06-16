//
//  TestView.swift
//  SI1-ProgressView_Example
//
//  Created by DU on 6/16/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class TestView: UIView {

    // MARK: - Properties
    private var contentView: UIView!
    private var countLabel: UILabel!
    
    // MARK: - Initialization Method
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    public func initView() {
        contentView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        contentView.backgroundColor = .red
        addSubview(contentView)
        layoutIfNeeded()
    }

}
