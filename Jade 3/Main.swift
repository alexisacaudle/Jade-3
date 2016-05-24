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

//var totalTally = Int()

class questions: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setLightTallySum(taps:Int){
        
        
        lightTally += 1
        print("\(lightTally)")
        
        defaults.setInteger(taps, forKey: "lightTaps")
    }
    
    func setDarkTallySum(taps:Int){
        
        
        darkTally += 1
        print("\(darkTally)")
        
        defaults.setInteger(taps, forKey: "darkTaps")
    }
    
    func getLightTallySum()-> Int{


        
        return defaults.integerForKey("lightTaps")
    }
    
    func getDarkTallySum()-> Int{
        
        
        
        return defaults.integerForKey("darkTaps")
    }
    

    @IBAction func light(sender: UIButton) {
        let newLightTallySum = getLightTallySum() + 1
        setLightTallySum(newLightTallySum)
        print("light:", newLightTallySum)
        
        performSegueWithIdentifier("segue", sender: sender)
    }
    
    @IBAction func dark(sender: UIButton) {
        let newDarkTallySum = getDarkTallySum() + 1
        setDarkTallySum(newDarkTallySum)
        print("dark:", newDarkTallySum)
        performSegueWithIdentifier("segue", sender: sender)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//            let explanationVC : results = segue.destinationViewController as! results
//            explanationVC.myLabel.text = "\(getLightTallySum())"
//    }
//}



// MARK: Explanation class

//class explanation: UIViewController {
//     var heldResults = String()
//
//    @IBOutlet weak var resultsHolder: UIButton!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        print(heldResults)
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
}

// MARK: Results class

class results: UIViewController {
    
    
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        if (darkTally > lightTally){
                resultPhrase = "You have a preference for darker-skinned people."
        } else if (darkTally < lightTally){
       resultPhrase = "You have a preference for lighter-skinned people."
        
        } else if (darkTally == lightTally){

            resultPhrase = "You do not have a particular preference for skin tone."

            
        }else {
            resultPhrase = "hey "
        }
        
        
    myLabel.text = resultPhrase
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    func recordData(userSelection: Int){
        
    }
    
}


