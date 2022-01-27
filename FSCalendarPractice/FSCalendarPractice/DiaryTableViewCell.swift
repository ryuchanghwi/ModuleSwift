//
//  DiaryTableViewCell.swift
//  FSCalendarPractice
//
//  Created by 류창휘 on 2022/01/26.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    @IBOutlet weak var myDiaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
