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
    }
    
    @IBAction func greenSliderMoved() {
    }
    
    @IBAction func blueSliderMoved() {
    }
}

