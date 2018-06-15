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
        
        //let date = Date()
        
        let schoolSubject1 = SchoolSubject()
        schoolSubject1.subjectName = "Математика"
        schoolSubject1.amountOfTime = 10
        
        let schoolSubject2 = SchoolSubject()
        schoolSubject2.subjectName = "Биология"
        schoolSubject2.amountOfTime = 15
        
        let schoolSubject3 = SchoolSubject()
        schoolSubject3.subjectName = "География"
        schoolSubject3.amountOfTime = 13
        
        let schoolKid1 = Schoolkid()
        schoolKid1.name = "Коля"
        schoolKid1.dateOfLastVisit = 1525132800 //1 мая
        schoolKid1.owner = schoolSubject1
        
        let schoolKid2 = Schoolkid()
        schoolKid2.name = "Вова"
        schoolKid2.dateOfLastVisit = 1528761600 // 14 июня
        schoolKid2.owner = schoolSubject2
        
        let schoolKid3 = Schoolkid()
        schoolKid3.name = "Евгений"
        schoolKid3.dateOfLastVisit = 1528588800 // 10 июня
        schoolKid3.owner = schoolSubject2
        
        schoolSubject1.schoolKid.append(objectsIn: [schoolKid1,schoolKid2,schoolKid3])
        schoolSubject2.schoolKid.append(objectsIn: [schoolKid1,schoolKid2,schoolKid3])
        schoolSubject3.schoolKid.append(objectsIn: [schoolKid1,schoolKid2])
        
        
        let realm = try! Realm()
        //try! realm.write {
            //realm.deleteAll()
            //realm.add([schoolSubject1,schoolSubject2,schoolSubject3])
            
            
            
            //Работает!
            //let thirdTask = realm.objects(Schoolkid.self).filter("name = 'Евгений'")
            //realm.delete(thirdTask)
            
       // }
        

    
        let firstTask = realm.objects(SchoolSubject.self).filter("dateOfLastVisit >= '1528588700' AND owner.@count > '1'")
        print(firstTask)
        let secondTask = realm.objects(Schoolkid.self).filter("ownre max")
        print(secondTask)
        
        
        
    }
}
