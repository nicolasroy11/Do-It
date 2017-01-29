//
//  TaskDetailViewController.swift
//  Do It
//
//  Created by Nicolas Roy on 1/28/17.
//  Copyright © 2017 Nick's Basement. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    var IsEditable = false;
    var TaskEditingContext: Task = Task(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext);
    
    @IBOutlet weak var AddButtonLabel: UIButton!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var TaskName: UITextField!
    @IBOutlet weak var IsImportant: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        TaskName.text = TaskEditingContext.name;
        IsImportant.isOn = TaskEditingContext.isImportant;
    }

    @IBAction func IsImportantToggled(_ sender: AnyObject) {
        TaskEditingContext.isImportant = IsImportant.isOn;
    }
    
    @IBAction func OnSave(_ sender: AnyObject) {
        let ts = TaskService();
        TaskEditingContext.name = TaskName.text!;
        ts.Save(task: TaskEditingContext);
        navigationController!.popViewController(animated: true);
    }

}
