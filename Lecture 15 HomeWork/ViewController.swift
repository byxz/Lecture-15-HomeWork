//
//  ViewController.swift
//  Lecture 15 HomeWork
//
//  Created by Mac on 06.06.2018.
//  Copyright © 2018 testOrg. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let schoolSubject1 = SchoolSubject()
        schoolSubject1.subjectName = "Mathematics"
        schoolSubject1.amountOfTime = 10
        
        let schoolSubject2 = SchoolSubject()
        schoolSubject2.subjectName = "Biology"
        schoolSubject2.amountOfTime = 15
        
        
        let schoolKid1 = Schoolkid()
        schoolKid1.name = "Jasse"
        schoolKid1.dateOfLastVisit = "2018.10.01"
        schoolKid1.owner = schoolSubject1
        
        let schoolKid2 = Schoolkid()
        schoolKid2.name = "Steve"
        schoolKid1.dateOfLastVisit = "2018.10.01"
        schoolKid1.owner = schoolSubject2
        
        let schoolKid3 = Schoolkid()
        schoolKid3.name = "Alfred"
        schoolKid3.dateOfLastVisit = "2018.10.01"
        schoolKid3.owner = schoolSubject2
        
        schoolSubject1.schoolKid.append(objectsIn: [schoolKid1,schoolKid3,schoolKid3])
        schoolSubject2.schoolKid.append(objectsIn: [schoolKid1,schoolKid3,schoolKid3])
        
        
        let realm = try! Realm()
        try! realm.write {
            //realm.deleteAll()
            realm.add(schoolSubject2)
            
        }
    }
    
}
