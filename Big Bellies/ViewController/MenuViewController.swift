//
//  MenuViewController.swift
//  Big Bellies
//
//  Created by Nazar Dremach on 20/6/23.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet var beerButtons: [UIButton]!
    
    @IBOutlet var beerNames: [UILabel]!
    
    @IBOutlet var beerVolumes: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Big Bellies"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        completeBeers()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        guard let sender = sender as? UIButton,
              let destinationController = segue.destination as? BeerDetailsViewController else {
            return }
        
        let beerIndex = sender.tag
        
        destinationController.beerIndex = beerIndex
        
    }
    
    func completeBeers() {
       
        for index in 0..<beerNames.count {
            
            beerNames[index].text = "\(BarManager.sharedInstance.beers[index].country) \(BarManager.sharedInstance.beers[index].name)"
            
            beerVolumes[index].text = "Остаток: \(BarManager.sharedInstance.beers[index].volume) л."
        }
        
    }
    
    @IBAction func goToDetails(sender: UIButton) {
        guard let destinationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BeerDetailsViewController") as? BeerDetailsViewController else { return }
        
        let beerIndex = sender.tag
        
        destinationController.beerIndex = beerIndex
        
        navigationController?.pushViewController(destinationController, animated: true)
    }
}
    
    

