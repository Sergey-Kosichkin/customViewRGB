//
//  ViewController.swift
//  customViewRGB
//
//  Created by Сергей Косичкин on 27.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbView.layer.cornerRadius = 20
    }
    
   
    @IBAction func redSliderMoved() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        changeViewColor()
    }
    
    @IBAction func greenSliderMoved() {
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        changeViewColor()
    }
    
    @IBAction func blueSliderMoved() {
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        changeViewColor()
    }
    
}

extension ViewController {
    func changeViewColor() {
        rgbView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
}

