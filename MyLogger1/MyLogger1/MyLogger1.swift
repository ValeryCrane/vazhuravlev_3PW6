//
//  MyLogger1.swift
//  MyLogger1
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import Foundation

public struct MyLogger1 {
    public static func log(_ s: String) {
        print("MyLogger1 from framework (\(Date())): \(s)")
    }
}
