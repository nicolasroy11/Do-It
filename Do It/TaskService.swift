//
//  TaskService.swift
//  Do It
//
//  Created by Nicolas Roy on 1/29/17.
//  Copyright © 2017 Nick's Basement. All rights reserved.
//

import Foundation
import UIKit

class TaskService {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    
    func Get() -> [Task] {
        var tasks: [Task] = [];
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task];
        }
        catch {
            print("There was an error fetching");
        }
        return tasks;
    }
    
    func Save(task: Task){
        let TaskEditingContext = context;
        TaskEditingContext.name = task.name;
        (UIApplication.shared.delegate as! AppDelegate).saveContext();
    }
}
