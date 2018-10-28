//
//  ReportViewRouter.swift
//  AppTest
//
//  Created by Tuan Anh on 10/27/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit
import Presentr
import Foundation

class ReportViewRouter: Router {
    
    func execute(in context: UIViewController) {
        
        let controller: ReportViewController = ReportViewController.controller(from: "ReportViewController")
        let widthSreen = Float(UIScreen.main.bounds.size.width)
        let heigtScrren = Float(UIScreen.main.bounds.size.height)
        let present = Presentr(presentationType: .custom(width: ModalSize.custom(size: widthSreen),
                                                         height: ModalSize.custom(size: heigtScrren),
                                                         center: ModalCenterPosition.center))
        present.roundCorners = true
        present.keyboardTranslationType = .none
        context.customPresentViewController(present, viewController: controller, animated: true, completion: nil)
    }
    
}

