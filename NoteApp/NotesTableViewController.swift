//
//  NotesTableViewController.swift
//  NoteApp
//
//  Created by Kate Grebenyuk on 3/1/15.
//  Copyright (c) 2015 Kate Grebenyuk. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController, AddNoteViewControllerDelegate {
    
    var notes:NSArray
    required init(coder aDecoder: NSCoder) {
        notes = ["Sample Note"]
        super.init(coder: aDecoder)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell") as UITableViewCell

        cell.textLabel?.text = notes[indexPath.row] as NSString
        
        return cell
    }
    
    func saveNote(controller: AddNoteViewController, noteText: String) {
        println("This is the line that was entered in AddNoteViewController: \(noteText)")
        
        dismissViewControllerAnimated(true, completion: nil)
        
        var mutableNotes:NSMutableArray = NSMutableArray(array: notes)
        mutableNotes.addObject(noteText)
        notes = NSArray(array: mutableNotes)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowAddNote") {
            let addNoteViewControler = segue.destinationViewController as AddNoteViewController
            addNoteViewControler.delegate = self
        }
    }
}
