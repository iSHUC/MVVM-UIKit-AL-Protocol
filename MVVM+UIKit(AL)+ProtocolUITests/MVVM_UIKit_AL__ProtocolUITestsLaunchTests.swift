//
//  MVVM_UIKit_AL__ProtocolUITestsLaunchTests.swift
//  MVVM+UIKit(AL)+ProtocolUITests
//
//  Created by Ishwar on 12/03/22.
//

import XCTest

class MVVM_UIKit_AL__ProtocolUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
