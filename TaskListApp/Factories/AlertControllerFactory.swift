//
//  FilledButtonFactory.swift
//  TaskListApp
//
//  Created by nik on 15.02.2024.
//

import UIKit

final class AlertControllerFactory {
    let userAction: String
    let taskTitle: String?
    
    init(userAction: String, taskTitle: String?) {
        self.userAction = userAction
        self.taskTitle = taskTitle
    }
    
    func createAlert(completion: @escaping (String) -> Void) -> UIAlertController {
        let alertController = UIAlertController(
            title: userAction,
            message: "What do you what to do?",
            preferredStyle: .alert
        )
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let task = alertController.textFields?.first?.text else { return }
            guard !task.isEmpty else { return }
            completion(task)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alertController.addTextField { [unowned self] textField in
            textField.placeholder = "Task"
            textField.text = taskTitle
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        return alertController
    }
}
