//
//  ViewController.swift
//  countryPicker
//
//  Created by Engin KUK on 22.03.2021.
//

import UIKit

class ViewController: UIViewController, CountryCodePickerDelegate {
    
    func countryCodePickerViewControllerDidPickCountry(_ country: CountryCodePickerViewController.Country) {
        print(country.name)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pickerDidPressed(_ sender: Any) {
        let vc = CountryCodePickerViewController()
        vc.delegate = self
        if let nav = containingViewController?.navigationController  {
            nav.pushViewController(vc, animated: true)
        } else {
            let nav = UINavigationController(rootViewController: vc)
            containingViewController?.present(nav, animated: true)
        }
    }
    
    /// containingViewController looks at the responder chain to find the view controller nearest to itself
    var containingViewController: UIViewController? {
        var responder: UIResponder? = self
        while !(responder is UIViewController) && responder != nil {
            responder = responder?.next
        }
        return (responder as? UIViewController)
    }
}

