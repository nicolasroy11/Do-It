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
        performSegue(withIdentifier: "MainToDetail", sender: Task());
    }
    
    var Tasks: [Task] = [];
    var SelectedRow: Any = {};
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self;
        TableView.dataSource = self;
        Tasks = MakeTasks();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tasks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i = indexPath.row;
        let cell = UITableViewCell();
        cell.textLabel?.text = Tasks[i].IsImportant ? "❗️ \(Tasks[i].Name)" : Tasks[i].Name;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectedRow = Tasks[indexPath.row];
        performSegue(withIdentifier: "MainToDetail", sender: SelectedRow);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToDetail" {
            let detailVC = segue.destination as! TaskDetailViewController;
            detailVC.PreviousVC = self;
            detailVC.TaskEditingContext = sender as! Task;
        }
        else {
            let a = 9;
        }
        
    }
    
    func MakeTasks() -> [Task] {
        var tasks: [Task] = [];
        for i in (0...4) {
            let newRow = Task();
            newRow.Id = i + 1;
            newRow.Name = "Task \(i)";
            newRow.Description = "Description for \(i)";
            newRow.IsImportant = i % 2 > 0;
            tasks.append(newRow);
        }
        return tasks;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

