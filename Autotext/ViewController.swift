//
//  ViewController.swift
//  Autotext
//
//  Created by Andy  Zhou on 6/19/19.
//  Copyright © 2019 Andy  Zhou. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var messageOneButton: UIButton!
    @IBOutlet weak var messageTwoButton: UIButton!
    @IBOutlet weak var messageThreeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func useFirstMessage(_ sender: UIButton) {
        self.sendMessage(messageOneButton)
    }
    
    @IBAction func useSecondMessage(_ sender: UIButton) {
        self.sendMessage(messageTwoButton)
    }
    
    @IBAction func useThirdMessage(_ sender: UIButton) {
        self.sendMessage(messageThreeButton)
    }
    
    @IBAction func sendMessage(_ sender: UIButton) {
        if MFMessageComposeViewController.canSendText() {
            let messageController = MFMessageComposeViewController()
            messageController.messageComposeDelegate = self
            messageController.recipients = ["4087864220"]
            messageController.body = sender.currentTitle
            present(messageController, animated: false, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
        messageTextField.text = ""
    }
    
}

