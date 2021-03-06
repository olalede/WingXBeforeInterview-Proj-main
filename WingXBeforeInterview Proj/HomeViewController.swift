//
//  ViewController.swift
//  WingXBeforeInterview Proj
//
//  Created by Damilare Olaleye on 12/30/20.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {

    @IBOutlet weak var signUpButton: WingXButton!
    @IBOutlet weak var showDate: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var greetingsLabel: UILabel!
    
    var greeting = ""
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(scrollView)
        
        // Display Date and time
        showDate.text = Date().localizedDescription
        
        // Show greetings depending on time interval
        greetings()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       
       AppUtility.lockOrientation(.portrait)
        
       // To rotate and lock
       // AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
       
   }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Reset when view is being removed
        AppUtility.lockOrientation(.all)
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
    }
    
    override func viewWillLayoutSubviews(){
    super.viewWillLayoutSubviews()
        
    // ScrollView  for buttons
    scrollView.contentSize = CGSize(width: 375, height: 800)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // greetings for time interval for greetings label
    
    func greetings() {
        let date = NSDate()
        let calendar = NSCalendar.current
        let currentHour = calendar.component(.hour, from: date as Date)
        let hourInt = Int(currentHour.description)!

        if hourInt >= 12 && hourInt <= 16 {
            greeting = "Good Afternoon, "
        }
        else if hourInt >= 0 && hourInt <= 12 {
            greeting = "Good Morning, "
        }
        else if hourInt >= 16 && hourInt <= 20 {
            greeting = "Good Evening, "
        }
        else if hourInt >= 20 && hourInt <= 24 {
            greeting = "GoodNight, "
        }
       
        greetingsLabel.text = greeting
    }

}



