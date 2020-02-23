//
//  AlertView.swift
//  CustomAlert
//
//  Created by SHUBHAM AGARWAL on 31/12/18.
//  Copyright © 2018 SHUBHAM AGARWAL. All rights reserved.
//

import Foundation
import UIKit

class AlertView: UIView {
    
    static let shared = AlertView()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    var onComplete: ((_ result: String)->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        self.alpha = 0.5;
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        img.layer.cornerRadius = 30
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.borderWidth = 2
        alertView.layer.cornerRadius = 10
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    enum AlertType {
        case success
        case failure
        case warning
        case suggetion
    }
    
    func showAlert(title: String, message: String, alertType: AlertType) {
        
        self.titleLbl.text = title
        self.messageLbl.text = message
        
        switch alertType {
        case .success:
            img.image = UIImage(named: "verified")
            doneBtn.backgroundColor = UIColor.success
            
        case .failure:
            img.image = UIImage(named: "warning")
            doneBtn.backgroundColor = UIColor.failed
            
        case .warning:
            img.image = UIImage(named: "warning")
            doneBtn.backgroundColor = UIColor.Warning
            
        case .suggetion:
            img.image = UIImage(named: "warning")
            doneBtn.backgroundColor = UIColor.Warning
            
        }
        
        UIApplication.shared.keyWindow?.addSubview(parentView)
        
    }
    
    @IBAction func onClickDone(_ sender: Any) {
        
        parentView.removeFromSuperview()
        onComplete?("true") // add completion Handler here that we do things after click on this button
        
    }
    
}
extension UIColor{
    
    static let success = UIColor(red: 55.0/255.0, green: 227.0/255.0, blue: 74.0/255.0, alpha: 1.0)
    static let failed = UIColor(red: 250.0/255.0, green: 17.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    static let Warning = UIColor(red: 55.0/255.0, green: 227.0/255.0, blue: 74.0/255.0, alpha: 1.0)
    
}

