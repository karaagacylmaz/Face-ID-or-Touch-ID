//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Yılmaz Karaağaç on 1/28/22.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SignInClicked(_ sender: Any) {
        let authContext = LAContext()
        var error: NSError?
        //deviceOwnerAuthentication => passcode
        //deviceOwnerAuthenticationWithBiometrics => touchid or faceid // For faceid, you have to add permission to info.plist
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Cause you should other segue with identification") { isSuccess, err in
                DispatchQueue.main.async {
                    if isSuccess {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    } else {
                       // self.myLabel.text = err?.localizedDescription
                        print(err?.localizedDescription.description)
                    }
                }
                
            }
        }
    }
    
}

