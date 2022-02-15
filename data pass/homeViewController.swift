//
//  homeViewController.swift
//  data pass
//
//  Created by User on 9/2/22.
//

import RealmSwift
import UIKit
import WatchConnectivity

class homeViewController: UIViewController,WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("iphone e aslo!")
    }
    
    
    @IBOutlet weak var label1: UILabel!
    
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive on iPhone")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate on iPhone")
    }
    
    
   // @IBOutlet weak var tableview: UITableView!
    
    var session: WCSession!
    //let sendValue = historyViewController();
    
    private let realm = try! Realm()
    public var completionHandler: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        print("home e asche")
                if WCSession.isSupported() {
                    WCSession.default.delegate = self
                    WCSession.default.activate()
                    print("WCSession.default activated on iPhone")
                }
    }
    
    /*func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("did recieve e dhuklo")
            let labelText = message["message"] as? String
        //debugPrint(labelText as Any)
            label1.text = labelText
        //appbutton((Any).self)
        //label1.text = "xoxo"

        }
     */
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("did recieve e dhuklo")
        DispatchQueue.main.sync{
        let labelText = message["message"] as? String
        //print(labelText as Any)
        self.label1.text = labelText
        self.appbuttonforuse()
        }
    }
     /*.
    private func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
            let msg = message["message"] as! String
            print("Got message! \(msg)")
        label1.text = msg
        }
      */
    
    func appbuttonforuse(){
        
        print("they take me")
        let date = Date()
        
        realm.beginWrite()
        let newItem = ToDoListItem()
        
        newItem.date = date
        newItem.item = "c"
        
        realm.add(newItem)
        try! realm.commitWrite()

            completionHandler?()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func appbutton(_ sender: Any) {
        
        print("tapped")
        
        /*button e tap hoitese tai new date and item asbe tar jonno, reload korte hobe tableview.and old ta completion dara save kroe nite hobe.
        1).kintu show hoitese kon jaiga theke ?
        2).custome or reuse? i guess resuse so oikhane dataload drkr.
         */
        //let text = lable2.text
        

        let date = Date()
        
        realm.beginWrite()
        let newItem = ToDoListItem()
        
        newItem.date = date
        newItem.item = "a"
        
        realm.add(newItem)
        try! realm.commitWrite()

            completionHandler?()
        navigationController?.popToRootViewController(animated: true)
        
        //print(date)
        }
    
}
