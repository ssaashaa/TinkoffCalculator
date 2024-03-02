//
//  CommonTest.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 07.02.2024.
//

import iOSSnapshotTestCase

class CommonTest: FBSnapshotTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        recordMode = false
        
        fileNameOptions = [
            .OS,
            .device
        ]
        
        continueAfterFailure = false
        app.launch()
    }
    
    func verifyView(identifier: String, perPixelTolerance: CGFloat = 0.0, overallTolerance: CGFloat = 0.05 ) {
        
        guard let screenshotWithoutStatusBar = app.screenshot().image.removingStatusBar else {
            return XCTFail("An error occurred while cropping the screenshot", file: #file, line: #line)
        }
        
        FBSnapshotVerifyView(
            UIImageView(image: screenshotWithoutStatusBar),
            identifier: identifier,
            perPixelTolerance: perPixelTolerance,
            overallTolerance: overallTolerance
        )
    }
    
    func verifyElement(element: XCUIElement,
                       identifier: String,
                       perPixelTolerance: CGFloat = 0.0,
                       overallTolerance: CGFloat = 0.05 ) {
        
        FBSnapshotVerifyView(UIImageView(image: element.screenshot().image),
                             identifier: identifier,
                             perPixelTolerance: perPixelTolerance,
                             overallTolerance: overallTolerance)
    }
}
