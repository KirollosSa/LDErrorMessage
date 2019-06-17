//
//  KMPopUp.swift
//  KMPopUp
//
//  Created by Kirollos Maged Youssef Sawerous on 1/23/18.
//

import Foundation
import UIKit

public class LDErrorMessage: NSObject {
    
    public static let shared = LDErrorMessage()
    var tempVC : UIViewController?
    
    private var messageText              : String!
    private var internetErrorMessage     : String!
    private var generalErrorImage        : UIImage!
    private var internetErrorImage       : UIImage!
    private var btnText                  : String!
    private var messageTextColor         : UIColor!
    private var btnTextColor             : UIColor!
    private var btnBackgroundColor       : UIColor!
    private var btnBorderColor           : UIColor!
    private var buttonCornerRadios       : CGFloat!
    private var textFont                 : UIFont!
    private var actionBTNFont            : UIFont!
    private var _error                   : Error!
    
    public override init() { }
    
    init(messageText: String,
         internetErrorMessage: String,
         btnText:String,
         generalErrorImage: UIImage,
         internetErrorImage: UIImage,
         messageTextColor:UIColor       = UIColor.blue,
         btnTextColor:UIColor           = UIColor.white,
         btnBackgroundColor:UIColor     = UIColor.blue,
         btnBorderColor:UIColor         = UIColor.clear,
         textFont:UIFont                = UIFont.systemFont(ofSize: 17.0),
         actionBTNFont:UIFont           = UIFont.systemFont(ofSize: 17.0),
         actionBTNCornerRadios:CGFloat  = 12.0) {
        
        self.messageText            = messageText
        self.internetErrorMessage   = internetErrorMessage
        self.generalErrorImage      = generalErrorImage
        self.internetErrorImage     = internetErrorImage
        self.btnText                = btnText
        self.messageTextColor       = messageTextColor
        self.textFont               = textFont
        self.btnTextColor           = btnTextColor
        self.btnBackgroundColor     = btnBackgroundColor
        self.actionBTNFont          = actionBTNFont
        self.btnBorderColor         = btnBorderColor
        self.buttonCornerRadios     = actionBTNCornerRadios
    }
    
    public func setDefauls(messageText:String,
                    internetErrorMessage:String,
                    generalErrorImage: UIImage      = UIImage(),
                    internetErrorImage: UIImage     = UIImage(),
                    btnText:String                  = "",
                    messageTextColor:UIColor        = UIColor.blue,
                    btnTextColor:UIColor            = UIColor.white,
                    btnBackgroundColor:UIColor      = UIColor.blue,
                    btnBorderColor:UIColor          = UIColor.clear,
                    textFont:UIFont                 = UIFont.systemFont(ofSize: 17.0),
                    actionBTNFont:UIFont            = UIFont.systemFont(ofSize: 17.0),
                    actionBTNCornerRadios:CGFloat   = 12.0) {
        
        self.messageText                = messageText
        self.internetErrorMessage       = internetErrorMessage
        self.generalErrorImage          = generalErrorImage
        self.internetErrorImage         = internetErrorImage
        self.btnText                    = btnText
        self.messageTextColor           = messageTextColor
        self.textFont                   = textFont
        self.btnTextColor               = btnTextColor
        self.btnBackgroundColor         = btnBackgroundColor
        self.actionBTNFont              = actionBTNFont
        self.btnBorderColor             = btnBorderColor
        self.buttonCornerRadios         = actionBTNCornerRadios
    }
    
    public func showMessagePopup(_ delegate : UIViewController,view: UIView ,handler: (() -> Void)? = nil) {
        // use defaults

        let bundle = Bundle(for: LDErrorMessageVC.self)
        let popUpVC = LDErrorMessageVC(nibName: "LDErrorMessageVC", bundle: bundle)
        popUpVC.messageText                 = self.messageText
        popUpVC.generalErrorImage           = self.generalErrorImage
        popUpVC.messageTextColor            = self.messageTextColor
        popUpVC.actionBTNTextColor          = self.btnTextColor
        popUpVC.btnBorderColor              = self.btnBorderColor
        popUpVC.btnCornerRadios             = self.buttonCornerRadios
        popUpVC.btnBackgroundColor          = self.btnBackgroundColor
        popUpVC.btnText                     = self.btnText
        delegate.addChildViewController(popUpVC)
        popUpVC.didMove(toParentViewController: delegate)
        popUpVC.view.frame = CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: (view.frame.size.height))
        popUpVC.view.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height/2)
            view.addSubview(popUpVC.view)
        if handler != nil {
            popUpVC.handler = handler
        }
    }
    
    public func showMessagePopup(_ delegate : UIViewController,
                                 view: UIView,
                                 internetErrorMessage:String,
                                 generalErrorImage: UIImage     = UIImage(),
                                 internetErrorImage: UIImage    = UIImage(),
                                 messageText:String              = "",
                                 btnText:String                  = "",
                                 messageTextColor:UIColor        = UIColor.blue,
                                 btnTextColor:UIColor            = UIColor.white,
                                 btnBackgroundColor:UIColor      = UIColor.blue,
                                 btnBorderColor:UIColor          = UIColor.clear,
                                 textFont:UIFont                 = UIFont.systemFont(ofSize: 17.0),
                                 actionBTNFont:UIFont            = UIFont.systemFont(ofSize: 17.0),
                                 buttonCornerRadios:CGFloat   = 12.0,
                                 handler: (() -> Void)? = nil) {

        let bundle = Bundle(for: LDErrorMessageVC.self)
        let popUpVC = LDErrorMessageVC(nibName: "LDErrorMessageVC", bundle: bundle)
        popUpVC.messageText                 = messageText
        popUpVC.generalErrorImage           = generalErrorImage
        popUpVC.messageTextColor            = messageTextColor
        popUpVC.actionBTNTextColor          = btnTextColor
        popUpVC.btnBorderColor              = btnBorderColor
        popUpVC.btnCornerRadios             = buttonCornerRadios
        popUpVC.btnBackgroundColor          = btnBackgroundColor
        popUpVC.btnText                     = btnText
        delegate.addChildViewController(popUpVC)
        popUpVC.didMove(toParentViewController: delegate)
        popUpVC.view.frame = CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: (view.frame.size.height))
        popUpVC.view.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height/2)
        view.addSubview(popUpVC.view)
        if handler != nil {
            popUpVC.handler = handler
        }
    }
    
    
}
