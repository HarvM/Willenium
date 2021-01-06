//
//  EntryCollectionViewController.swift
//  Void
//
//  Created by Marc Harvey on 02/01/2021.
//

import UIKit
import Firebase
import FirebaseFirestore

//Class that handles the JournalView
class JournalViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var journalEntries: [JournalEntry] = []
    var dataBase: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ///Call of the function to populate the TablelView
        self.dummyData()
    }
    
    //MARK: Define and create a reference to the database
//    var ref: DatabaseReference!
//    ref = Database.database().reference()
    
    func dummyData() {
        let data = JournalEntry.init(entry: "New", entryDate: Date(), title: "Test", userId: "Test1")
        let data2 = JournalEntry.init(entry: "New2", entryDate: Date(), title: "Test2", userId: "Test2")
        let data3 = JournalEntry.init(entry: "New3", entryDate: Date(), title: "Test3", userId: "Test3")
        let data4 = JournalEntry.init(entry: "New4", entryDate: Date(), title: "Test4", userId: "Test4")
        
        journalEntries.append(data)
        journalEntries.append(data2)
        journalEntries.append(data3)
        journalEntries.append(data4)
    }
}

extension JournalViewController: UIWebViewDelegate, UITableViewDataSource {
    
    ///Number of cells desired on the TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalEntries.count
    }
    ///Defining the cell that appears on the Table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! JournalTableViewCell ///weirdly showing as en error here but runs fine
        cell.journal = journalEntries[indexPath.row]
        return cell
    }
}
