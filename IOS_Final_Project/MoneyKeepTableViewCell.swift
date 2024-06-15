//
//  MoneyKeepTableViewCell.swift
//  IOS_Final_Project
//
//  Created by Hwang on 2024/06/15.
//

import Foundation
import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var uiType: UILabel!
    @IBOutlet weak var uiMemo: UILabel!
    @IBOutlet weak var uiPrice: UILabel!
    @IBOutlet weak var uiDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
