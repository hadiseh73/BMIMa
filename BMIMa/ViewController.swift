//
//  ViewController.swift
//  BMIMa
//
//  Created by HadisehSafaei on 4/17/1402 AP.
//

import UIKit

class ViewController: UIViewController {
    
    let randomImage = [ "12","16","18","22"]


    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var lblMinWeight: UILabel!
    @IBOutlet weak var lblCurrentWeight: UILabel!
    @IBOutlet weak var lblMaxWeight: UILabel!
    @IBOutlet weak var lblMinHeight: UILabel!
    @IBOutlet weak var lblCurrentHeight: UILabel!
    @IBOutlet weak var lblMaxHeight: UILabel!
    @IBOutlet weak var lblBMI: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var height : Float = 0
    var weight : Float = 0
    var BMI : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupUI()
    }

    @IBAction func weightValueChange(_ sender: Any) {
        self.setupBMI()
    }
    
    @IBAction func heightValueChange(_ sender: Any) {
        self.setupBMI()
    }
    
    private func setupUI() {
        self.lblMinHeight.text = "10 cm"
        self.lblMaxHeight.text = "300 cm"
        self.lblMinWeight.text = "0 kg"
        self.lblMaxWeight.text = "200 kg"
        
        self.backgroundImage.image = UIImage(named: randomImage.randomElement() ?? "12")
    }
    
    private func setupBMI() {
        
        self.height = self.heightSlider.value
        self.weight = self.weightSlider.value
        self.BMI = self.weight / ((self.height * self.height)/10000)
        self.lblBMI.text = "Your BMI is :  \(self.BMI)  kg/m2"
        self.lblCurrentHeight.text = "\(Int(self.height)) cm"
        self.lblCurrentWeight.text = "\(Int(self.weight)) kg"
    }
    
}

