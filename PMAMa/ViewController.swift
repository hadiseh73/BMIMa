//
//  ViewController.swift
//  PMAMa
//
//  Created by HadisehSafaei on 4/17/1402 AP.
//

import UIKit

class ViewController: UIViewController {
    
    let randomImage = ["12","14","16","18","20","22","24","26","28","30","32","34","36","38","40","42","44","46","48"]
    
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var labelsEffectView: UIVisualEffectView!
    @IBOutlet weak var lblMinWeight: UILabel!
    @IBOutlet weak var lblCurrentWeight: UILabel!
    @IBOutlet weak var lblMaxWeight: UILabel!
    @IBOutlet weak var lblMinHeight: UILabel!
    @IBOutlet weak var lblCurrentHeight: UILabel!
    @IBOutlet weak var lblMaxHeight: UILabel!
    @IBOutlet weak var lblBMI: UILabel!
    @IBOutlet weak var lblBMIDesc: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var effectView: UIVisualEffectView!
    @IBOutlet weak var genderSwitch: UISwitch!
    
    var height : Float = 0
    var weight : Float = 0
    var BMI : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupUI()
        self.setSliderThumbTintColor(slider: self.weightSlider, AppColor.primary01)
        self.setSliderThumbTintColor(slider: self.heightSlider, AppColor.primary01)
        
        self.effectView.layer.cornerRadius = 16
        self.effectView.layer.masksToBounds = true
    }
    
    @IBAction func weightValueChange(_ sender: Any) {
        self.setupBMI()
    }
    
    @IBAction func heightValueChange(_ sender: Any) {
        self.setupBMI()
    }
    
    @IBAction func btnShare(_ sender: Any) {
        let bounds = UIScreen.main.bounds
            UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        self.view.drawHierarchy(in: bounds, afterScreenUpdates: false)
            let img = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        let activityViewController = UIActivityViewController(activityItems: [img ?? ""], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    private func setupUI() {
        self.lblMinHeight.text = "120 cm"
        self.lblMaxHeight.text = "220 cm"
        self.lblMinWeight.text = "40 kg"
        self.lblMaxWeight.text = "200 kg"
        
        self.backgroundImage.image = UIImage(named: randomImage.randomElement() ?? "12")
        
        /*For on state*/
        self.genderSwitch.onTintColor = AppColor.primary02
        
        /*For off state*/
        self.genderSwitch.tintColor = AppColor.primary04
        self.genderSwitch.layer.cornerRadius = self.genderSwitch.frame.height / 2.0
        self.genderSwitch.backgroundColor = AppColor.primary04
        self.genderSwitch.clipsToBounds = true
        
        self.lblBMI.text = "Your BMI is :  0  kg/m2"
        self.lblBMIDesc.text = "Your BMI is Under Weight"
    }
    
    private func setupBMI() {
        
        self.height = self.heightSlider.value
        self.weight = self.weightSlider.value
        self.BMI = (self.weight*10000) / (self.height * self.height)
        self.lblBMI.text = "Your BMI is :  \(String(format: "%.2f", self.BMI))  kg/m2"
        self.lblCurrentHeight.text = "\(Int(self.height)) cm"
        self.lblCurrentWeight.text = "\(Int(self.weight)) kg"
        
        
        if self.genderSwitch.isOn {
            
            if self.BMI < 18.5 {
                self.lblBMIDesc.text = "Your BMI is Under Weight"
            }
            else if  self.BMI < 25.0 {
                self.lblBMIDesc.text = "Your BMI is Normal Weight"
            }
            else if  self.BMI < 29.9 {
                self.lblBMIDesc.text = "Your BMI is Over Weight"
            }
            else if  self.BMI < 34.9 {
                self.lblBMIDesc.text = "Your BMI is Class I Obesity"
            }
            else if  self.BMI < 39.9 {
                self.lblBMIDesc.text = "Your BMI is Class II Obesity"
                
            } else {
                self.lblBMIDesc.text = "Your BMI is Class III Obesity"
            }
            
        } else {
            
            if self.BMI < 19.5 {
                self.lblBMIDesc.text = "Your BMI is Under Weight"
            }
            else if  self.BMI < 26.0 {
                self.lblBMIDesc.text = "Your BMI is Normal Weight"
            }
            else if  self.BMI < 30.9 {
                self.lblBMIDesc.text = "Your BMI is Over Weight"
            }
            else if  self.BMI < 35.9 {
                self.lblBMIDesc.text = "Your BMI is Class I Obesity"
            }
            else if  self.BMI < 40.9 {
                self.lblBMIDesc.text = "Your BMI is Class II Obesity"
                
            } else {
                self.lblBMIDesc.text = "Your BMI is Class III Obesity"
            }
        }
    }
    
    fileprivate func makeCircleWith(size: CGSize, backgroundColor: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(backgroundColor.cgColor)
        context?.setStrokeColor(UIColor.clear.cgColor)
        let bounds = CGRect(origin: .zero, size: size)
        context?.addEllipse(in: bounds)
        context?.drawPath(using: .fill)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func setSliderThumbTintColor(slider: UISlider,_ color: UIColor) {
        let circleImage = makeCircleWith(size: CGSize(width: 30, height: 30),
                       backgroundColor: color)
        slider.setThumbImage(circleImage, for: .normal)
        slider.setThumbImage(circleImage, for: .highlighted)
    }
}

