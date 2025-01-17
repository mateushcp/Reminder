//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 12/08/24.
//

import Foundation
import UIKit

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeRecipesViewController() -> NewReceiptViewController {
        let viewController = NewReceiptViewController()
        return viewController
    }

    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
        let contentView = SplashView()
        let viewController = SplashViewController(contentView: contentView,
                                                  flowDelegate: flowDelegate)
        return viewController
    }

    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController {
        let contentView = LoginBottomSheetView()
        let viewController = LoginBottomSheetViewController(contentView: contentView,
                                                            flowDelegate: flowDelegate)
        return viewController
    }

    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController {
        let contentView = HomeView()
        let viewController = HomeViewController(contentView: contentView,
                                                flowDelegate: flowDelegate)

        return viewController
    }

    func makeMyReceiptsViewController(flowDelegate: MyReceiptsFlowDelegate) -> MyReceiptsViewController {
        let contentView = MyReceiptsView()
        let viewController = MyReceiptsViewController(contentView: contentView,
                                                      flowDelegate: flowDelegate)

        return viewController
    }
}
