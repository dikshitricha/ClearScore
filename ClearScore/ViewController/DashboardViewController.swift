//
//  DashboardViewController.swift
//  ClearScore
//
//  Created by Dikshit, Richa.
//  Copyright © 2018 Dikshit, Richa. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var dataManager = DataManager()
    var donutView: DonutView?
    //MARK: - computed variables
    var castedView : DashboardView {
        return self.view as! DashboardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        let view = castedView
        LoadingOverlay.shared.showOverlay(view: view)
        dataManager.fetchCreditScore(success: {[weak self] response in
            DispatchQueue.main.async {
                LoadingOverlay.shared.hideOverlayView()
                if let creditScore = response as? CreditScore {
                    let dashboardViewModel = DashboardViewModel(creditScore: creditScore)
                    self?.castedView.setup(for: dashboardViewModel)
                } else {
                    LoadingOverlay.shared.hideOverlayView()
                    self?.showError(error: .unknownError)
                }
                
            }
            }, failure: { [weak self] error in
                LoadingOverlay.shared.hideOverlayView()
                guard let error = error  else {
                    self?.showError(error: .unknownError)
                    return
                }
                self?.showError(error: error)
        })
    }
    func showError(error: APIError) {
        let alertController = UIAlertController(title: NSLocalizedString("Error", comment: "Error title"), message:error.errorString() , preferredStyle: UIAlertControllerStyle.alert)
        present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

