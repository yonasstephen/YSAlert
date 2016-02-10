//
//  YSAlert.swift
//  ParseStarterProject-Swift
//
//  Created by Mac Mini on 27/1/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class YSAlert: UIView {

    // Private vars
    private var backdrop: UIView!
    private var alert: UIView!
    private var alertTitle: UILabel!
    private var alertContent: UILabel!
    private var okButton: UIButton!
    private var cancelButton: UIButton!
    private var closeButton: UIButton!
    
    // Public vars
    
    // Show/Hide button
    var showOKButton: Bool = true
    var showCancelButton: Bool = true
    var showCloseButton: Bool = true
    var dismissableBackdropTap = true
    
    var titleText: String = "Hi There!" {
        didSet {
            alertTitle.text = titleText
        }
    }
    var contentText: String = "This the alert content, you can put any message here." {
        didSet {
            alertContent.text = contentText
        }
    }
    
    var okButtonCompletion: ((UIButton!) -> Void)?
    var cancelButtonCompletion: ((UIButton!) -> Void)?
    
    init() {
        let frame = UIScreen.mainScreen().bounds
        
        super.init(frame: frame)
        
        // Init backdrop
        backdrop = UIView(frame: frame)
        backdrop.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        backdrop.alpha = CGFloat(0)
        
        let backdropTap = UITapGestureRecognizer(target: self, action: "dismissAlert")
        backdropTap.numberOfTapsRequired = 1
        backdrop.addGestureRecognizer(backdropTap)
        
        self.addSubview(backdrop)
        
        
        // Init alert dialog
        alert = UIView(frame: CGRectMake(0, 0, 300, 300))
        alert.center = CGPointMake(frame.width / 2.0, (frame.height / 2.0) - frame.height)
        alert.backgroundColor = UIColor(red: 61 / 255, green: 132 / 255, blue: 168 / 255, alpha: 1.0)
        
        closeButton = UIButton(frame: CGRectMake(alert.frame.width - 50, 0, 50, 50))
        closeButton.titleLabel?.font = UIFont.systemFontOfSize(25)
        closeButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        closeButton.setTitle("×", forState: .Normal)
        closeButton.addTarget(self, action: "dismissAlert", forControlEvents: .TouchUpInside)
        alert.addSubview(closeButton)
        
        alertTitle = UILabel(frame: CGRectMake(50, 0, alert.frame.width - 100, 50))
        alertTitle.text = titleText
        alertTitle.font = UIFont.systemFontOfSize(15)
        alertTitle.textColor = UIColor.whiteColor()
        alertTitle.textAlignment = .Center
        alert.addSubview(alertTitle)
        
        alertContent = UILabel(frame: CGRectMake(15, 60, alert.frame.width - 30, alert.frame.height - 60 - 50))
        alertContent.text = contentText
        alertContent.font = UIFont.systemFontOfSize(15)
        alertContent.textColor = UIColor.whiteColor()
        alertContent.numberOfLines = 0
        alert.addSubview(alertContent)
        
        okButton = UIButton(frame: CGRectMake(alert.frame.width - 70, alert.frame.height - 50, 70, 50))
        okButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        okButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        okButton.setTitle("OK", forState: .Normal)
        okButton.addTarget(self, action: "okButtonPressed:", forControlEvents: .TouchUpInside)
        alert.addSubview(okButton)
        
        cancelButton = UIButton(frame: CGRectMake(alert.frame.width - 140, alert.frame.height - 50, 70, 50))
        cancelButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        cancelButton.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        cancelButton.setTitle("Cancel", forState: .Normal)
        cancelButton.addTarget(self, action: "cancelButtonPressed:", forControlEvents: .TouchUpInside)
        alert.addSubview(cancelButton)
        
        self.addSubview(alert)
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    func show() {
        applySetting()
        showAlert()
    }
    
    
    func show(title: String, content: String) {
        self.alertTitle.text = title
        self.alertContent.text = content
        
        applySetting()
        showAlert()
    }
    
    func show(title: String, content: String, okButtonCompletion:((UIButton!) -> Void)?, cancelButtonCompletion: ((UIButton!) -> Void)?) {
        self.alertTitle.text = title
        self.alertContent.text = content
        self.okButtonCompletion = okButtonCompletion
        self.cancelButtonCompletion = cancelButtonCompletion
        
        applySetting()
        showAlert()
    }
    
    func cancelButtonPressed(sender: UIButton!) {
        if let _handler = cancelButtonCompletion {
            _handler(sender)
        } else {
            dismissAlert()
        }
    }
    
    func okButtonPressed(sender: UIButton!) {
        if let _handler = okButtonCompletion {
            _handler(sender)
        } else {
            dismissAlert()
        }
    }
    
    private func applySetting() {
        if (!showOKButton) {
            okButton.removeFromSuperview()
        }
        
        if (!showCancelButton) {
            cancelButton.removeFromSuperview()
        }
        
        if (!showCloseButton) {
            closeButton.removeFromSuperview()
        }
        
        if (!dismissableBackdropTap) {
            for gr in backdrop.gestureRecognizers ?? [] {
                backdrop.removeGestureRecognizer(gr)
            }
        }
    }
    
    private func showAlert() {
        let rv = UIApplication.sharedApplication().keyWindow! as UIWindow
        
        rv.addSubview(self)
        
        UIView.animateWithDuration(NSTimeInterval(0.5), delay: NSTimeInterval(0), options: .CurveEaseInOut, animations: {
            
            self.backdrop.alpha = CGFloat(1)
            
            }, completion: nil)
        
        UIView.animateWithDuration(NSTimeInterval(0.5), delay: NSTimeInterval(0), usingSpringWithDamping: CGFloat(1), initialSpringVelocity: CGFloat(1), options: .CurveEaseInOut, animations: {
            
            self.alert.center = CGPointMake(self.alert.center.x, self.alert.center.y + self.frame.height)
            
            }, completion: nil)
    }
    
    func dismissAlert() {
        UIView.animateWithDuration(NSTimeInterval(0.5), delay: NSTimeInterval(0), options: .CurveEaseInOut, animations: {
            
                self.backdrop.alpha = CGFloat(0)
            
            }, completion: nil)
        
        UIView.animateWithDuration(NSTimeInterval(0.5), delay: NSTimeInterval(0), usingSpringWithDamping: CGFloat(1), initialSpringVelocity: CGFloat(1), options: .CurveEaseInOut, animations: {
            
                self.alert.center = CGPointMake(self.alert.center.x, self.alert.center.y + self.frame.height)
            
            }, completion: {
                (isFinished) in
                
                if (isFinished) {
                    
                    self.removeFromSuperview()
                    
                }
        })
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
}
