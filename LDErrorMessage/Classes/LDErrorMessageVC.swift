//
//  DoneViewController.swift
//  KMPopUp
//
//  Created by Kirollos Maged Youssef Sawerous on 1/23/18.
//

import UIKit

class LDErrorMessageVC: UIViewController {
    
    //MARK:- Properties
    weak var timer: Timer?
    var messageText: String         = "Some Text"
    var btnText: String             = ""
    var duration: Double            = 1.0
    var Alpha: CGFloat              = 0.8
    var generalErrorImage           = UIImage()
    var witImage : Bool             = false
    var btnCornerRadios          : CGFloat = 0.0
    var imageTintColor           : UIColor = .blue
    var messageTextColor         : UIColor = .blue
    var actionBTNTextColor       : UIColor = .white
    var btnBackgroundColor       : UIColor = .blue
    var btnBorderColor           : UIColor = .clear
    var handler                  : (() -> Void)? = nil
    
        
    @IBOutlet weak var errorMessageImage: UIImageView!
    @IBOutlet weak var errorMessageLable: UILabel!
    @IBOutlet weak var errorAction: UIButton!
    
    
    //MARK:- Viewcontroller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK:- Helper Methods
    func setupView() {
        lablelSetup()
        if btnText != "" {
            btnSetup()
        }
        else {
            errorAction.isHidden = true
        }

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        imageSetup()
        showAnimate()
    }
    
    func btnSetup() {
        errorAction.isHidden = false
        errorAction.setTitle(btnText, for: .normal)
        errorAction.setTitleColor(actionBTNTextColor, for: .normal)
        errorAction.backgroundColor = btnBackgroundColor
        errorAction.layer.cornerRadius = btnCornerRadios
        errorAction.layer.borderColor = btnBorderColor.cgColor
        errorAction.layer.borderWidth = 2
        errorAction.addTarget(self, action: #selector(onAction), for: .allEvents)
    }
    
    func lablelSetup() {
        errorMessageLable.text = messageText
        errorMessageLable.textColor = messageTextColor
    }
    
    func imageSetup() {
        errorMessageImage.image = generalErrorImage
        errorMessageImage.tintColor = imageTintColor
    }
    
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3 , y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    func removeAnimation() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3 , y: 1.3)
            self.view.alpha = 0.0;
        }) { (finished : Bool) in
            if finished {
                self.view.removeFromSuperview()
            }
        }
    }
   
    //MARK:- Actions
    @objc func onAction() {
        if let handler = handler?() {
            handler
        }
        removeAnimation()
    }
    
}
