//
//  DashboardViewControllerTests.swift
//  ClearScoreTests
//
//  Created by Dikshit, Richa.
//  Copyright © 2018 Dikshit, Richa. All rights reserved.
//

import XCTest
@testable import ClearScore

class DashboardViewControllerTests: XCTestCase {
    
    var dashboardViewController: DashboardViewController?
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        self.dashboardViewController = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController
        self.dashboardViewController?.loadView()
        
        XCTAssertNotNil(dashboardViewController, "dashboardViewController should not be nil")
    }
    
    func testDashboardViewControllerIsNotNil() {
        XCTAssertNotNil(self.dashboardViewController, "DonutViewController instance should not be nil")
    }
   
    func testLoadingViewIsShown() {
        dashboardViewController?.dataManager = MockAPI()
        dashboardViewController?.fetchData()
        let loadingView = LoadingOverlay.shared
        loadingView.showOverlay(view: dashboardViewController?.view)
        XCTAssertTrue(loadingView.activityIndicator.isAnimating, "activity indicator is animating")
        XCTAssertNotNil(loadingView.overlayView, "loading overlay view should not be nil")
    }
    func testLoadingViewIsHidden() {
        dashboardViewController?.dataManager = MockAPI()
        dashboardViewController?.fetchData()
        let loadingView = LoadingOverlay.shared
        loadingView.hideOverlayView()
        XCTAssertFalse(loadingView.activityIndicator.isAnimating, "activity indicator stops animating")
        XCTAssertFalse(loadingView.subviews.contains(loadingView.overlayView))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
