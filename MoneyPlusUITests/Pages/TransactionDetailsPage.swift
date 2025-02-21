import Foundation
import XCTest

class TransactionDetailsPage: BasePage {
    private struct Constants {
        static let activityDetailsTitleLabel = "activity_details_title_label"
        static let activityDetailsDateLabel = "activity_details_date_label"
        static let activityDetailsLocationLabel = "activity_details_location_label"
        static let activityDetailsCostLabel = "activity_details_cost_label"
        static let activityDetailsDetailLabel = "activity_details_detail_label"
        static let activityDetailsDescriptionLabel = "activity_details_description_label"
    }
    
    override var initialViews: [XCUIElement] {
        return [
            app.staticTexts[Constants.activityDetailsTitleLabel],
            app.staticTexts[Constants.activityDetailsDateLabel],
            app.staticTexts[Constants.activityDetailsCostLabel],
            app.staticTexts[Constants.activityDetailsDetailLabel]
        ]
    }
}
