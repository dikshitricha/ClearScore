//
//  LoadingView.swift
//  ClearScore
//
//  Created by Vinsier on 28/02/2018.
//  Copyright © 2018 Dikshit, Richa. All rights reserved.
//

import UIKit
import Foundation

class LoadingOverlay: UIView {

    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var loadingTextLabel = UILabel()
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    public func showOverlay(view: UIView!) {
        overlayView = UIView(frame: UIScreen.main.bounds)
        overlayView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicator.center = overlayView.center
        overlayView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        loadingTextLabel.text = NSLocalizedString("Fetching your credit score", comment: "Fetching user credit score")
        loadingTextLabel.textColor = .white
        loadingTextLabel.sizeToFit()
        loadingTextLabel.center = CGPoint(x: activityIndicator.center.x, y: activityIndicator.center.y + 30)
        overlayView.addSubview(loadingTextLabel)
        view.addSubview(overlayView)
    }
    
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }

}
