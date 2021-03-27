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
    
    // MARK: Slider methods
    @IBAction func redSliderMoved() {
        redLabel.text = roundToString(redSlider.value)
        changeViewColor()
    }
    
    @IBAction func greenSliderMoved() {
        greenLabel.text = roundToString(greenSlider.value)
        changeViewColor()
    }
    
    @IBAction func blueSliderMoved() {
        blueLabel.text = roundToString(blueSlider.value)
        changeViewColor()
    }
    
}


// MARK: Extensions
extension ViewController {
    private func changeViewColor() {
        rgbView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
}

extension ViewController {
    private func roundToString(_ number: Float) -> String{
        String(format: "%.2f", number)
    }
}

