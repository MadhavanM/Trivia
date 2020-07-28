//
//  HistoryTableViewCell.swift
//  Trivia
//
//  Created by Madhavan on 27/07/20.
//  Copyright © 2020 myApp. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_datetime: UILabel!
    @IBOutlet weak var lbl_Name: UILabel!
    @IBOutlet weak var lbl_Ques1: UILabel!
    @IBOutlet weak var lbl_Ans1: UILabel!
    @IBOutlet weak var lbl_Ques2: UILabel!
    @IBOutlet weak var lbl_Ans2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
