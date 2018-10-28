//
//  ReportViewController.swift
//  AppTest
//
//  Created by Tuan Anh on 10/20/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit
import Presentr
import Social

class ReportViewController: UIViewController {
    
    static let iddentifer = "ReportViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    let presenter: Presentr = {
        let width = ModalSize.full
        let height = ModalSize.fluid(percentage: 0.20)
        let center = ModalCenterPosition.customOrigin(origin: CGPoint(x: 0, y: 0))
        let customType = PresentationType.custom(width: width, height: height, center: center)
        
        let customPresenter = Presentr(presentationType: customType)
        customPresenter.transitionType = .coverVerticalFromTop
        customPresenter.dismissTransitionType = .crossDissolve
        customPresenter.roundCorners = false
        customPresenter.backgroundColor = .green
        customPresenter.backgroundOpacity = 0.5
        customPresenter.dismissOnSwipe = true
        customPresenter.dismissOnSwipeDirection = .top
        return customPresenter
    }()

    @IBAction func buttonTap(_ sender: Any) {
//        let controller = SelectReportViewController()
//        customPresentViewController(presenter, viewController: controller, animated: true, completion: nil)
        if let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: SelectReportViewController.iddentifer) {
            presentedViewController.providesPresentationContextTransitionStyle = true
            presentedViewController.definesPresentationContext = true
            presentedViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
            presentedViewController.view.backgroundColor = UIColor.init(white: 0.2 , alpha: 0.8)
            self.present(presentedViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func shareFacebook(_ sender: UIButton) {
        let selectSeviceAlert = UIAlertController(title: "Select Serive", message: "Select serive", preferredStyle: .actionSheet)

        let facebookActionButton = UIAlertAction(title: "Facebook", style: .default) { (action) in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
                // create poss view
                let facebookPostView = SLComposeViewController(forServiceType: SLServiceTypeFacebook)

                facebookPostView?.setInitialText("This post was written by my app")

                // display post view
                self.present(facebookPostView!, animated: true, completion: nil)
            } else {
                self.attemp(serviceType: "Facebook")
            }
        }

        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        selectSeviceAlert.addAction(facebookActionButton)
        selectSeviceAlert.addAction(cancelActionButton)

        self.present(selectSeviceAlert, animated: true, completion: nil)
//        let activityController = UIActivityViewController(activityItems: ["hom nay vui"], applicationActivities: nil)
//        present(activityController, animated: true, completion: nil)
        
    }
    
    func attemp(serviceType: String){
        let errorAlert = UIAlertController(title: "Unavailabel", message: "Your device is not connected to\(serviceType)", preferredStyle: .alert)
        // create the action
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        // display
        self.present(errorAlert, animated: true, completion: nil)
    }
    @IBAction func buttonClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
