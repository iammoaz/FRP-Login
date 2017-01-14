//
//  ViewController.swift
//  FRP Login
//
//  Created by Muhammad Moaz on 1/9/17.
//  Copyright © 2017 Muhammad Moaz. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let validUsername = usernameField.reactive.continuousTextValues
            .skipNil()
            .map { $0.characters.count > 4 }
        
        let validPassword = passwordField.reactive.continuousTextValues
            .skipNil()
            .map { $0.characters.count > 7 }
        
        loginButton.reactive.isEnabled <~ Signal.combineLatest(validUsername, validPassword).map { $0 && $1 }
        
    }
}

