//
//  Router.swift
//  AppTest
//
//  Created by Tuan Anh on 10/27/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

protocol Router: class {
    
    associatedtype Context
    func execute(in context: Context)
    
}

