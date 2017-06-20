//
//  SlideOutViewController.swift
//  slidetest
//
//  Created by Dol2oMo on 6/7/2560 BE.
//
//


let iphoneSildeRight:CGFloat = 280


import UIKit

protocol SlideOutDelegate{
    func ViewslideRight(sender:Bool)
    func ViewslideLeft(sender:Bool)
}

class SlideOutViewController: UIViewController {
    
    var slideShow:Bool = false
    var slideleft:Bool = false
    var slideRight:Bool = false
    
    
    
    var LeftViewcontroller :UIViewController? {
        willSet{
            if LeftViewcontroller != nil {
                if LeftViewcontroller?.view != nil {
                    LeftViewcontroller?.view .removeFromSuperview()
                }
                
                LeftViewcontroller?.removeFromParentViewController()
            }
        }
        
        didSet{
            
            LeftViewcontroller!.view.frame = CGRect(x: 0, y: 0, width:self.view.frame.size.width - (self.view.frame.size.width - iphoneSildeRight), height: self.view.frame.size.height)

            
            self.view .addSubview(LeftViewcontroller!.view)
            self.addChildViewController(LeftViewcontroller!)
        }
    }
    
    
    var MiddleViewcontroller :UIViewController?{
        
        willSet{
            if MiddleViewcontroller != nil {
                if MiddleViewcontroller?.view != nil {
                    
                MiddleViewcontroller!.view .removeFromSuperview()
                    
                }
                
                MiddleViewcontroller! .removeFromParentViewController()
            }
        }
        
        didSet{
            self.view.addSubview(MiddleViewcontroller!.view)
            self.addChildViewController(MiddleViewcontroller!)
        }
    }
    
    var RightViewcontroller :UIViewController?{
        
        willSet{
            if RightViewcontroller != nil {
                if RightViewcontroller?.view != nil {
                    
                    RightViewcontroller!.view .removeFromSuperview()
                    
                }
                
                RightViewcontroller! .removeFromParentViewController()
            }
        }
        
        didSet{

            RightViewcontroller!.view.frame = CGRect(x: self.view.frame.size.width  - (self.view.frame.origin.x + iphoneSildeRight), y: 0, width: self.view.frame.size.width - (self.view.frame.size.width - iphoneSildeRight), height: self.view.frame.size.height)
            
            
            self.view.addSubview(RightViewcontroller!.view)
            self.addChildViewController(RightViewcontroller!)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        let mainNavigationController = storyboard!.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        
        let menuViewController = storyboard!.instantiateViewController(withIdentifier: "MenuViewController")as! MenuViewController
        
        let Settingviewright = storyboard!.instantiateViewController(withIdentifier: "SettingRightViewController") as! SettingRightViewController
        
        self.LeftViewcontroller = menuViewController
        self.RightViewcontroller = Settingviewright
        self.MiddleViewcontroller = mainNavigationController
        
//        var test = checktype.ShouldslideLelt
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //can use method slide other class -->let nameclass = class() ; button .addTarget(parameterclass, action: #selector(parameterclass.SwitfRight(_:)), for: .touchUpInside)
    @IBAction func SwitfRight(_ sender: UISwipeGestureRecognizer){
        
        if slideRight == false && slideleft == false {
            self.ViewslideRight(sender: true)
            slideRight = true
            slideleft = false
        }
        else if slideRight == true && slideleft == false {
            self.ViewslideRight(sender: false)
            slideRight = false
            slideleft = false
        }
        else if slideRight == false && slideleft == true{
            ViewslideLeft(sender: false)
            slideRight = false
            slideleft = false
        }
        else{
            ViewslideLeft(sender: false)
            slideRight = false
            slideleft = false
        }
        
        
    }
    
    //can use method slide other class -->let parameterclass = class() ; button .addTarget(parameterclass, action: #selector(parameterclass.swipeLeft(_:)), for: .touchUpInside)
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        
        if slideRight == true && slideleft == false {
            self.ViewslideRight(sender: false)
            slideRight = false
            slideleft = false
        }
        else if slideRight == false && slideleft == true{
            ViewslideLeft(sender: false)
            slideRight = false
            slideleft = false
        }
        else if slideRight == false && slideleft == false{
            ViewslideLeft(sender: true)
            slideRight = false
            slideleft = true
        }
        else{
            ViewslideLeft(sender: false)
            slideRight = false
            slideleft = false
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SlideOutViewController:SlideOutDelegate
{
    func ViewslideLeft(sender: Bool) {
        if sender == true {
            if sender == slideShow {
                HidenSlideView()
            }
            else{
                ShowSlideLeft()
            }
        }
        else{
            HidenSlideView()
            
        }
    }

    func ViewslideRight(sender: Bool) {
        if sender == true {
            if sender == slideShow {
                HidenSlideView()
            }
            else{
                ShowSlideRight()
            }
        }
        else{
            HidenSlideView()

        }
    }
    
    
    func ShowSlideRight() {
        
        self.RightViewcontroller!.view.frame = CGRect(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width - (self.view.frame.size.width - iphoneSildeRight), height: self.view.frame.size.height)
        
        UIView.animate(withDuration: 0.7, animations: {self.MiddleViewcontroller!.view.frame = CGRect(x: self.view.frame.origin.x + iphoneSildeRight, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height)}, completion: { (Bool) -> Void in
            self.slideShow = true
        })
    }
    
    func HidenSlideView() {
        
        
        UIView.animate(withDuration: 0.7, animations: {self.MiddleViewcontroller!.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height)} , completion: { (Bool) -> Void in
            self.slideShow = false
            
            self.RightViewcontroller!.view.frame = CGRect(x: self.view.frame.size.width  - (self.view.frame.origin.x + iphoneSildeRight), y: 0, width: self.view.frame.size.width - (self.view.frame.size.width - iphoneSildeRight), height: self.view.frame.size.height)

        })
    }
    
    func ShowSlideLeft(){
        
        
        UIView.animate(withDuration: 0.7, animations: {self.MiddleViewcontroller!.view.frame = CGRect(x: self.view.frame.origin.x - iphoneSildeRight, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height)}, completion: { (Bool) -> Void in
            self.slideShow = true
        })
    }

    
}
