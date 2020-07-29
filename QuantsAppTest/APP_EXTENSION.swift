//
//  APP_EXTENSION.swift
//  QuantsAppTest
//
//  Created by EPIC CHANNEL on 30/07/20.
//  Copyright © 2020 QuantsApp. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension String{
    
    func getNIB() -> UINib{
        return UINib.init(nibName: self, bundle: nil)
    }
    
    func secondsToDaysHoursMinutesSeconds () -> (Int,Int,Int, Int) {
      let seconds = Int(self)!
      return ((seconds % 3600) / 24,(seconds / 3600), (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
}
extension UIView{
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
extension UIViewController{
    
        func loadingView(flag : Bool){
            DispatchQueue.main.async(execute: {
                var inloading = false
                for vew in self.view.subviews {
                    if vew.tag == 999 {
                        inloading = true
                        break
                    }
                }
                if flag {
                    if !inloading {
                        let wd = UIScreen.main.bounds.width
                        let ht = UIScreen.main.bounds.height
                        let v = UIView(frame: CGRect(x: 0,y : 0,width : wd, height : ht))
                        v.tag = 999
                        v.backgroundColor = UIColor.black.withAlphaComponent(0.4)
                        let activityFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
                        let activityView = NVActivityIndicatorView(frame: activityFrame, type: .circleStrokeSpin, color: .white, padding: 20.0) //UIActivityIndicatorView(style: .whiteLarge)
                        activityView.center = v.center
                        activityView.startAnimating()
                        v.addSubview(activityView)
                        self.view.addSubview(v)
                    }
                }
                else {
                    if inloading {
                        for vew in self.view.subviews {
                            if vew.tag == 999 {
                                vew.removeFromSuperview()
                                break
                            }
                        }
                    }

                }
            })
        }

}

