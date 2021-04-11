//
//  MainViewController.swift
//  customViewRGB
//
//  Created by Сергей Косичкин on 11.04.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setUIColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
}

class MainViewController: UIViewController {
    private var color: UIColor!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = view.backgroundColor
        settingsVC.delegate = self
    }

}


extension MainViewController: SettingsViewControllerDelegate {
    func setUIColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        view.backgroundColor = UIColor(red: red,
                                       green: green,
                                       blue: blue,
                                       alpha: alpha)
    }
}
