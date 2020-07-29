//
//  feedTVC.swift
//  QuantsAppTest
//
//  Created by EPIC CHANNEL on 29/07/20.
//  Copyright © 2020 QuantsApp. All rights reserved.
//

import UIKit
import SDWebImage

class feedTVC: UITableViewCell {
    
    @IBOutlet weak var imgbg: UIImageView!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateFeed(_ data: Feed){
        lblName.text = data.name ?? ""
        lblStatus.text = data.status ?? ""
        if let profileImg = data.profilePic{
            imgProfilePic.sd_setImage(with: URL(string: profileImg), completed: nil)
        }
        if let image = data.image{
            imgbg.sd_setImage(with: URL(string: image), completed: nil)
        }
        if let timeStamp = data.timeStamp{
            lblTime.text = "\(timeStamp.secondsToDaysHoursMinutesSeconds().0) days ago"
        }
    }
    
}
