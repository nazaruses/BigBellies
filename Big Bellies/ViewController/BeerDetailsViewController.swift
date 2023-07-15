//
//  BeerDetailsViewController.swift
//  Big Bellies
//
//  Created by Nazar Dremach on 8/7/23.
//

import UIKit

class BeerDetailsViewController: UIViewController {
    
    @IBOutlet weak var beerTypeLabel: UILabel!
    
    @IBOutlet weak var volumeLabel: UILabel!
    
    @IBOutlet weak var volumeSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var beerImg: UIImageView!
    
    var beerIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillDefaultValues()
    }
    
    private func fillDefaultValues() {
        let currentBeer = BarManager.sharedInstance.beers[beerIndex]
        
        title = "\(currentBeer.country) \(currentBeer.name)"
        beerImg.image = currentBeer.image
        switch currentBeer.type {
        case .dark:
            beerTypeLabel.text = "Темное"
        case .light:
            beerTypeLabel.text = "Светлое"
        }
        
        changeVolume(volumeSegmentControl)
        
        updateVolume()
    }
    private func updateVolume() {
        volumeLabel.text = "Остаток: \(BarManager.sharedInstance.beers[beerIndex].volume) л."
        checkVolume()
    }
    
    private func checkVolume() {
         
         buyButton.isEnabled = getCurrentVolume() <= BarManager.sharedInstance.beers[beerIndex].volume
         
     }
    private func getCurrentVolume() -> Decimal {
         switch
         volumeSegmentControl.selectedSegmentIndex {
         case 0:
             return 0.33
         case 1:
             return 0.5
         case 2:
             return 1.0
         default:
             return 0
         }
         
     }
    
    
    @IBAction func changeVolume(_ sender: UISegmentedControl) {
        
        let prices = BarManager.sharedInstance.pricesForBeer(with: beerIndex)
        
        switch sender.selectedSegmentIndex {
        case 0:
            priceLabel.text = "Стоимость: \(prices.0) €"
        case 1:
            priceLabel.text = "Стоимость: \(prices.1) €"
        case 2:
            priceLabel.text = "Стоимость: \(prices.2) €"
        default:
            return
            
        }
        
        updateVolume()
    }
    
    @IBAction func buyBeer(_ sender: Any) {
            
        BarManager.sharedInstance.buyBeer(with: beerIndex, volume: getCurrentVolume())
        
        
        updateVolume()
        }
 
    }

