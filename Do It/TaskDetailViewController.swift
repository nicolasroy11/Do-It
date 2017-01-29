//
//  TaskDetailViewController.swift
//  Do It
//
//  Created by Nicolas Roy on 1/28/17.
//  Copyright © 2017 Nick's Basement. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    var TaskEditingContext = Task();
    var IsEditable = false;
    var PreviousVC = TaskSearchViewController();
    
    @IBOutlet weak var AddButtonLabel: UIButton!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var TaskName: UITextField!
    @IBOutlet weak var IsImportant: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(TaskEditingContext.Description);
        TaskName.text = TaskEditingContext.Name;
        IsImportant.isOn = TaskEditingContext.IsImportant;
        
    }

    @IBAction func IsImportantToggled(_ sender: AnyObject) {
        TaskEditingContext.IsImportant = !TaskEditingContext.IsImportant;
    }
    
    @IBAction func OnSave(_ sender: AnyObject) {
        TaskEditingContext.Name = TaskName.text!;
        if TaskEditingContext.Id == 0 {
            TaskEditingContext.Id = PreviousVC.Tasks.count + 1;
            PreviousVC.Tasks.append(TaskEditingContext);
        }
        else {
            PreviousVC.Tasks[TaskEditingContext.Id - 1] = TaskEditingContext;
        }
        PreviousVC.TableView.reloadData();
        navigationController!.popViewController(animated: true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
