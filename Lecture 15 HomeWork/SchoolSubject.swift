//
//  SchoolSubject.swift
//  Lecture 15 HomeWork
//
//  Created by Mac on 06.06.2018.
//  Copyright © 2018 testOrg. All rights reserved.
//

import RealmSwift

class SchoolSubject: Object {
    
    @objc dynamic var subjectName: String = ""
    @objc dynamic var amountOfTime: Int = 0
    
    var schoolKid: List<Schoolkid> = List<Schoolkid>()
    
}
