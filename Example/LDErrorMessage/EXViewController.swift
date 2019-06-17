//
//  ViewController.swift
//  LDErrorMessage
//
//  Created by kirollosSa on 06/17/2019.
//  Copyright (c) 2019 kirollosSa. All rights reserved.
//

import UIKit
import LDErrorMessage

class EXViewController: UIViewController {

    var kmObj: LDErrorMessage?
    @IBOutlet weak var LViewPod: UIView!
    @IBOutlet weak var RViewPod: UIView!
    @IBOutlet weak var DViewPod: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func testMessagePod(_ sender: Any) {
        LDErrorMessage.shared.showMessagePopup(self, view: self.view) {
            self.reloadData()
        }
        
    }
    
    @IBAction func customActionPod(_ sender: Any) {
        LDErrorMessage().showMessagePopup(self,view: self.view,internetErrorMessage: "test internet", generalErrorImage: #imageLiteral(resourceName: "no-wifi"), internetErrorImage: #imageLiteral(resourceName: "no-wifi"), messageText: "custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom testcustom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test", btnText: "Ok", messageTextColor: .blue, btnBackgroundColor: .blue, btnBorderColor: .clear, buttonCornerRadios: 12)
    }
    
    
    @IBAction func showInLeftviewPod(_ sender: Any) {
        LDErrorMessage().showMessagePopup(self, view: self.LViewPod, internetErrorMessage: "test internet", generalErrorImage: #imageLiteral(resourceName: "warning"), messageText: "custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test custom test", messageTextColor: .black, btnBackgroundColor: .black, btnBorderColor: .clear, buttonCornerRadios: 12)
    }
    
    @IBAction func showInRightviewPod(_ sender: Any) {
        LDErrorMessage().showMessagePopup(self, view: self.RViewPod, internetErrorMessage: "test internet", generalErrorImage: #imageLiteral(resourceName: "no-wifi"), internetErrorImage: #imageLiteral(resourceName: "warning"), messageText: "custom test", btnText: "Done", messageTextColor: .black, btnBackgroundColor: .black, btnBorderColor: .clear, buttonCornerRadios: 12)
        LDErrorMessage().showMessagePopup(self, view: self.DViewPod, internetErrorMessage: "test internet", generalErrorImage: #imageLiteral(resourceName: "no-wifi"), internetErrorImage: #imageLiteral(resourceName: "warning"), messageText: "custom test", btnText: "Done", messageTextColor: .black, btnBackgroundColor: .black, btnBorderColor: .clear, buttonCornerRadios: 12)
    }
    
    
    func reloadData() {
        print("Here we can meke request again")
    }

}

