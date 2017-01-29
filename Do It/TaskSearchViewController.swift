//
//  TaskSearchViewController.swift
//  Do It
//
//  Created by Nicolas Roy on 1/27/17.
//  Copyright © 2017 Nick's Basement. All rights reserved.
//

import UIKit

class TaskSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableView: UITableView!
    
    @IBAction func OnPlusTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "MainToDetail", sender: nil);
    }
    
    var Tasks: [Task] = [];
    var SelectedRowId: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self;
        TableView.dataSource = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        GetTasks();
        TableView.reloadData()
    }
    
    func GetTasks() {
        let ts = TaskService();
        Tasks = ts.Get();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tasks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i = indexPath.row;
        let cell = UITableViewCell();
        cell.textLabel?.text = Tasks[i].isImportant ? "❗️ \(Tasks[i].name!)" : Tasks[i].name!;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // SelectedRowId = Int(Tasks[indexPath.row].objectID);
        performSegue(withIdentifier: "MainToDetail", sender: nil);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToDetail" {
            let detailVC = segue.destination as! TaskDetailViewController;
            //detailVC.TaskId = sender as! Int;
        }
        else {
            let a = 9;
        }
    }
    
}

