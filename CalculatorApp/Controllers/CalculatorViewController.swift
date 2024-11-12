//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 이명지 on 11/12/24.
//

import UIKit

class CalculatorViewController: UIViewController {
    private let calculatorView = CalculatorView()
    
    override func loadView() {
        view = calculatorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

