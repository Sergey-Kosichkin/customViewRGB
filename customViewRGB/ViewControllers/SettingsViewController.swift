//
//  ViewController.swift
//  customViewRGB
//
//  Created by Сергей Косичкин on 27.03.2021.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var color: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    private var red: CGFloat = 0
    private var green: CGFloat = 0
    private var blue: CGFloat = 0
    private var alpha: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rgbView.layer.cornerRadius = 20
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        changeViewColor()
        updateValues()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        addDoneButtonOnKeyboard(textField: redTextField)
        addDoneButtonOnKeyboard(textField: greenTextField)
        addDoneButtonOnKeyboard(textField: blueTextField)
        
        rgbView.layer.shadowColor = UIColor.white.cgColor
        rgbView.layer.shadowOpacity = 5
        rgbView.layer.shadowOffset = .zero
        rgbView.layer.shadowRadius = 15
        
        setGradientBackground()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
     changeValues()
        changeViewColor()
    }
    
    // MARK: Slider methods
    @IBAction func redSliderMoved() {
        changeViewColor()
        updateValues()
    }
    
    @IBAction func greenSliderMoved() {
        changeViewColor()
        updateValues()
    }
    
    @IBAction func blueSliderMoved() {
        changeViewColor()
        updateValues()
    }
    
    @IBAction func doneButtonPressed() {
       delegate.setUIColor(red: CGFloat(redSlider.value),
                            green: CGFloat(greenSlider.value),
                            blue: CGFloat(blueSlider.value),
                            alpha: alpha)
        dismiss(animated: true)
    }
}


// MARK: Extensions
extension SettingsViewController {
    private func changeViewColor() {
        rgbView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
    
    private func roundToString(_ number: Float) -> String{
        String(format: "%.2f", number)
    }
    
    private func updateValues() {
        redLabel.text = roundToString(redSlider.value)
        redTextField.text = redLabel.text
        
        greenLabel.text = roundToString(greenSlider.value)
        greenTextField.text = greenLabel.text
        
        blueLabel.text = roundToString(blueSlider.value)
        blueTextField.text = blueLabel.text
    }
    
    private func changeValues() {
        if let redNumber = Float(redTextField.text ?? "0") {
            let redValue = checkNumberBiggerThanOne(redNumber)
            redTextField.text = roundToString(redValue)
            redLabel.text = roundToString(redValue)
            redSlider.setValue(redValue, animated: true)
       }
        if let greenNumber = Float(greenTextField.text ?? "0") {
            let greenValue = checkNumberBiggerThanOne(greenNumber)
            greenTextField.text = roundToString(greenValue)
            greenLabel.text = roundToString(greenValue)
            greenSlider.setValue(greenValue, animated: true)
        }
        if let blueNumber = Float(blueTextField.text ?? "0") {
            let blueValue = checkNumberBiggerThanOne(blueNumber)
            blueTextField.text = roundToString(blueValue)
            blueLabel.text = roundToString(blueValue)
            blueSlider.setValue(blueValue, animated: true)
        }
    }
    
    private func checkNumberBiggerThanOne(_ number: Float) -> Float {
        var checkedNumber: Float = 0
        if number > 1 {
            checkedNumber = 1
        } else {
            checkedNumber = number
        }
        return checkedNumber
    }
    
    private func setGradientBackground() {
        
        let colorBottom =  UIColor(red: red/1.0,
                                   green: green/1.0,
                                   blue: blue/1.0,
                                   alpha: 0.6).cgColor
        let colorTop = UIColor(red: (red * 0.1)/1.0,
                               green: (green * 0.1)/1.0,
                               blue: blue * 0.1/1.0,
                               alpha: 0.1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
        
    }
    
    private func addDoneButtonOnKeyboard(textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        keyboardToolbar.items = [flexibleSpace, doneButton]
        textField.inputAccessoryView = keyboardToolbar
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}

