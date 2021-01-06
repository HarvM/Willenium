//
//  JournalTableViewCell.swift
//  Void
//
//  Created by Marc Harvey on 03/01/2021.
//

import UIKit

//Class that defines the cell that appears on the TableView
//Each cell will display the date, title, and details about each of the individual entries
class JournalTableViewCell: UITableViewCell {
    
    var journal: JournalEntry? {
        didSet {
            if let journal = journal {
                self.journalDate.text = journal.entryDate.toString(dateFormat: "dd MMM, YY")
                self.journalTitle.text = journal.title
                self.journalDetail.text = journal.entry
            }
        }
    }
    
    ///Outlets that define the appearance of the cell
    @IBOutlet weak var journalDate: UILabel!
    @IBOutlet weak var journalTitle: UILabel!
    @IBOutlet weak var journalDetail: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
