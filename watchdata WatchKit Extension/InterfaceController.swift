//
//  InterfaceController.swift
//  watchdata WatchKit Extension
//
//  Created by User on 12/2/22.
//

import WatchKit
import Foundation
import WatchConnectivity
//import RealmSwift


class InterfaceController: WKInterfaceController,WCSessionDelegate {
    
    
    @IBOutlet weak var watchlable: WKInterfaceLabel!
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("WCSession activated on watch")
    }
    
    
    var session:WCSession!
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        if WCSession.isSupported() {
                    WCSession.default.delegate = self
                    WCSession.default.activate()
            
                }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    @IBAction func buttonTapped() {
        
        /*
        print("yeap watch button tapped response")
        if WCSession.default.isReachable {
                    let message = ["message": "Test"]
                    WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { (err) in
                        debugPrint(err)
                    })
            print("meassage nise")
                }
        */
        
        let session = WCSession.default
        print("Session is reachable: \(session.isReachable)") // this is false
                let msg = ["message": "tipu"]
                session.sendMessage(msg, replyHandler: { reply in
                    print("Got reply: \(reply)")
                }, errorHandler: { error in
                    print("error: \(error)")
                })
        
        //appbutton().homeViewController
        //let date = Date()
        
        
        //realm.beginWrite()
        //let newItem = ToDoListItem()
        
       // newItem.date = date
       // newItem.item = "a"
        
       // realm.add(newItem)
        //try! realm.commitWrite()

          //  completionHandler?()
        //navigationController?.popToRootViewController(animated: true)
        
        
    }
    
}
