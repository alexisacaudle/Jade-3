//
//  Main.swift
//  Jade 3
//
//  Created by Alexis Caudle on 4/21/16.
//  Copyright © 2016 Alexis Caudle. All rights reserved.
//

import UIKit
let defaults = NSUserDefaults.standardUserDefaults()
var name = String()



class main: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        scrollView.setContentOffset(CGPointMake(0, 50), animated: true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == firstName{
            firstName.resignFirstResponder()
        }
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nextButton(sender: AnyObject) {
            defaults.setObject(firstName.text, forKey: "firstName")
            defaults.synchronize()
            print("\(firstName.text)")

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let identityVC : userGenderIdentityScreen = segue.destinationViewController as! userGenderIdentityScreen
        identityVC.userNameString = defaults.stringForKey("firstName")!
    }
}


// MARK: Gender identity class
class userGenderIdentityScreen: UIViewController {
    
    var userNameString = String()
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = "Hello \(userNameString)!"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let interestVC : userInterestScreen = segue.destinationViewController as! userInterestScreen
        interestVC.userNameString = defaults.stringForKey("firstName")!
    }
    
}


// MARK: Gender interest class

class userInterestScreen: UIViewController {
    var userNameString = String()
    
    @IBAction func backButton(sender: AnyObject) {
    }
    
    @IBOutlet weak var interestLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interestLabel.text = "\(userNameString), who are you interested in?"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



// MARK: Questions class

class questions: UIViewController {
    var darkTally = 0
    var lightTally = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func light(sender: UIButton) {
        lightButtonTapped(1)
        print("light: \(lightTally)")
        performSegueWithIdentifier("segue", sender: sender)
    }
    
    @IBAction func dark(sender: UIButton) {
        darkButtonTapped(1)
        print("dark: \(darkTally)")
        performSegueWithIdentifier("segue", sender: sender)
    }
    
    func darkButtonTapped(taps:Int){
        darkTally += 1
    }
    
    func lightButtonTapped(taps:Int){
        lightTally += 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


// MARK: Considerations class

class considerations: UIViewController {
    
    @IBAction func optionEndearing(sender: AnyObject) {
        self.performSegueWithIdentifier("segue", sender: sender)
            print("endearing")
    }
    
    @IBAction func optionUnappealing(sender: AnyObject) {
        self.performSegueWithIdentifier("segue", sender: sender)
            print("unappealing")
    }
    
    @IBAction func optionNeutral(sender: AnyObject) {
        self.performSegueWithIdentifier("segue", sender: sender)
            print("neutral")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

// MARK: Explanation class

class explanation: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

// MARK: Results class

class results: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


