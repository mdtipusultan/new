//
//  historyViewController.swift
//  data pass
//
//  Created by User on 9/2/22.
//

import UIKit
import RealmSwift
import WatchConnectivity

class ToDoListItem: Object {
    @objc dynamic var item: String = ""
    @objc dynamic var date = Date()
    
}


class historyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,WCSessionDelegate{
    
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        //
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        //
    }
    
    

    public var completionHandler: (() -> Void)?
    @IBOutlet weak var tableview: UITableView!
    
    private let realm = try! Realm()
    private var data = [ToDoListItem]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("history te asche")
                if WCSession.isSupported() {
                    WCSession.default.delegate = self
                    WCSession.default.activate()
                    print("WCSession.default activated on iPhone")
                }
        
    let nib = UINib(nibName: "customTableViewCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "customTableViewCell")
        
        data = realm.objects(ToDoListItem.self).map({ $0 })
        
                
                tableview.delegate = self
                tableview.dataSource = self
    
        
    }
    
   // func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        //print("did recieve e dhuklo of history")
        //let labelText = message["message"] as? String
        //print(labelText as Any)
        //label1.text = labelText
   // }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            //fetch_data()
          // reload at this point
        //tableview.reloadData()
     refresh()

        }

    //MARK: TABLE
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(data.count)
        return data.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as! customTableViewCell
        
        
        //cell.lable.text = data[indexPath.row].item
        let date = data[indexPath.row].date
        let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss"
            let stringDate = formatter.string(from: date)
        
        cell.label1.text = stringDate
        cell.lable2.text = data[indexPath.row].item
        
        
        //print(data)
        
        return cell
    }
    
        
    func refresh() {
            data = realm.objects(ToDoListItem.self).map({ $0 })
            tableview.reloadData()
        }
    
   
}

