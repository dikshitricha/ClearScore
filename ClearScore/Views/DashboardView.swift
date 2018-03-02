//
//  DashboardView.swift
//  ClearScore
//
//  Created by Dikshit, Richa.
//  Copyright © 2018 Dikshit, Richa. All rights reserved.
//

import UIKit
class DashboardView: UIView {
  
    @IBOutlet weak var yourscoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var maxScoreLabel: UILabel!
    @IBOutlet weak var donutView: UIView!
    var viewModel: DashboardViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(for viewModel: DashboardViewModel) {
        scoreLabel.isHidden = false
        maxScoreLabel.isHidden = false
        yourscoreLabel.isHidden = false
        self.donutView.isHidden = false
        
        scoreLabel.text = NSLocalizedString("\(viewModel.score ?? 0)", comment: "User Credit Score")
        maxScoreLabel.text = NSLocalizedString("out of \(viewModel.maxScore ?? 0)", comment: "Max score label text")
        
        scoreLabel.textColor = viewModel.scoreColor
        
        let donutView = DonutView(creditScore: CGFloat(viewModel.score ?? 0), maxCreditScore: CGFloat(viewModel.maxScore ?? 0), frame: self.donutView.bounds, scoreColor:viewModel.scoreColor)
        self.donutView.addSubview(donutView)
    }

}
