//
//  SettingsViewController.swift
//  Big Bellies
//
//  Created by Nazar Dremach on 1/7/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var ZeroButton: UIButton!
    
    @IBOutlet weak var todaySalaryLabel: UILabel!
    
    @IBOutlet weak var totalSalaryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateSalaries()
    }
    
    
    func updateSalaries() {
        todaySalaryLabel.text =
        """
        Выручка сегодня:
        \(BarManager.sharedInstance.todaySalary)€
        """
        
        totalSalaryLabel.text =
        """
        Выручка всего:
        \(BarManager.sharedInstance.totalSalary)€
        """
    }
    
    @IBAction func NewStuffAction(_ sender: Any) {
        BarManager.sharedInstance.newDay()
        updateSalaries()
        
    }
    
    @IBAction func becomeNewConstitution(_ sender: Any) {
        
        BarManager.sharedInstance.resetAll()
        updateSalaries()
    }
}
