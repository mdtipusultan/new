//
//  customTableViewCell.swift
//  data pass
//
//  Created by User on 9/2/22.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var lable2: UILabel!
    
    let sendValue = historyViewController();
    public var completionHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        completionHandler = { [weak self] in
            self!.sendValue.refresh()
                }
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
}
