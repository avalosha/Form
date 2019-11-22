//
//  DBManager.swift
//  Exercise
//
//  Created by Álvaro Ávalos Hernández on 21/11/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import UIKit
import CoreData

/// Class in charge of saving and charges data from the form with Core Data.
final class DBManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveUser(name: String, last: String, motherOfLast: String, email: String, telephone: String) {
        
        let newUser = User(context: context)
        newUser.name = name
        newUser.lastName = last
        newUser.motherLastName = motherOfLast
        newUser.email = email
        newUser.telephone = telephone
        
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
    }
    
    func loadUser(name: String, last: String, motherOfLast: String, email: String, telephone: String) -> Bool {
        let request: NSFetchRequest<User> = User.fetchRequest()
        let predicate = NSPredicate(format: "name == %@ && lastName == %@ && motherLastName == %@ && email == %@ && telephone == %@", name, last, motherOfLast, email.lowercased(), telephone)
        request.predicate = predicate
        do {
            let result = try self.context.fetch(request)
            if result.count > 0 {
                return true
            }
        } catch {
            print("Error fetching data from context \(error)")
        }
        return false
    }
}
