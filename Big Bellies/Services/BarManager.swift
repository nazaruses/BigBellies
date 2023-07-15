//
//  BarManager.swift
//  Big Bellies
//
//  Created by Nazar Dremach on 14/7/23.
//

import Foundation
import UIKit

public class BarManager {
   
   public static var sharedInstance = BarManager()
    
    private init() { }
    
   private let initialBeers = [
        Beer(name: "Budweiser",
             country: "🇨🇿",
             type: .light,
             prices: (Decimal(1), Decimal(1.4), Decimal(2)),
             volume: 100,
             image: UIImage(named:"budweiser")!),
        Beer(name: "Alhambra",
             country: "🇪🇸",
             type: .light,
             prices: (Decimal(1.3), Decimal(1.7), Decimal(2.2)),
             volume: 100,
             image: UIImage(named:"Alhambra")!),
        Beer(name: "Estrella Galicia",
             country: "🇪🇸",
             type: .light,
             prices: (Decimal(1.8), Decimal(2.3), Decimal(2.7)),
             volume: 100,
             image: UIImage(named:"Estrella")!),
        Beer(name: "Heineken",
             country: "🇳🇱",
             type: .light,
             prices: (Decimal(1), Decimal(1.3), Decimal(1.8)),
             volume: 100,
             image: UIImage(named:"Heineken")!),
        Beer(name: "Corona Extra",
             country: "🇲🇽",
             type: .light,
             prices: (Decimal(1), Decimal(1.5), Decimal(2.2)),
             volume: 100,
             image: UIImage(named:"Corona")!),
        Beer(name: "Paulaner",
             country: "🇩🇪",
             type: .light,
             prices: (Decimal(1.5), Decimal(2), Decimal(2.5)),
             volume: 100,
             image: UIImage(named:"Paulaner")!),
        Beer(name: "Guinness",
             country: "🇮🇪",
             type: .dark,
             prices: (Decimal(1.5), Decimal(2.4), Decimal(3)),
             volume: 100,
             image: UIImage(named:"Guiness")!),
        Beer(name: "Kozel",
             country: "🇨🇿",
             type: .light,
             prices: (Decimal(1), Decimal(1.5), Decimal(2)),
             volume: 100,
             image: UIImage(named:"Kozel")!),
        Beer(name: "1664 Blanc",
             country: "🇫🇷",
             type: .light,
             prices: (Decimal(1.5), Decimal(2.2), Decimal(2.5)),
             volume: 100,
             image: UIImage(named:"blanc")!),
        Beer(name: "1664 Rosé",
             country: "🇫🇷",
             type: .light,
             prices: (Decimal(1.6), Decimal(2.4), Decimal(2.8)),
             volume: 100,
             image: UIImage(named:"rose")!),
        Beer(name: "Carlsberg",
             country: "🇩🇰",
             type: .light,
             prices: (Decimal(1), Decimal(1.4), Decimal(1.8)),
             volume: 100,
             image: UIImage(named:"Carl")!),
        Beer(name: "Аливария Богемское",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(1.2), Decimal(1.6), Decimal(2)),
             volume: 100,
             image: UIImage(named:"Alivaria")!),
        Beer(name: "ЛІДСКАЕ PILSNER",
             country: "🇧🇾",
             type: .light,
             prices: (Decimal(1), Decimal(1.2), Decimal(1.7)),
             volume: 100,
             image: UIImage(named:"Lidsk")!),
        Beer(name: "Stella Artois",
             country: "🇧🇪",
             type: .light,
             prices: (Decimal(1), Decimal(1.4), Decimal(2)),
             volume: 100,
             image: UIImage(named:"Stella")!),
        Beer(name: "Pabst Blue Ribbon",
             country: "🇺🇸",
             type: .light,
             prices: (Decimal(1.6), Decimal(2), Decimal(2.4)),
             volume: 100,
             image: UIImage(named:"Pabst")!),
    ]
    @IBOutlet weak var a: UIImageView!
    
    var beers: [Beer] = []
    
    var totalSalary: Decimal = 0.0
    var todaySalary: Decimal = 0.0
    
    
    func pricesForBeer(with index: Int) -> (Decimal, Decimal, Decimal) { beers[index].prices }
    
    func buyBeer(with index: Int, volume: Decimal) {
        beers[index].volume -= volume
        
        switch volume {
        case 0.33:
            todaySalary += beers[index].prices.0
        case 0.5:
            todaySalary += beers[index].prices.1
        case 1.0:
            todaySalary += beers[index].prices.2
        default:
            return
        }
    }
    
    func newDay() {
        totalSalary += todaySalary
        todaySalary = 0
    }
    
    func resetAll() {
        totalSalary = 0
        todaySalary = 0
        beers = initialBeers
    }
}
//