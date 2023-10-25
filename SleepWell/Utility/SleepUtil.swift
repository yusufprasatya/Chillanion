//
//  SleepUtil.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 25/10/23.
//

import Foundation

final class SleepUtil {
    static func getSleepCycle(param: Int) -> String {
        if param == 4 {
            return "4-cycle sleep ((4 x 90 mins))"
        }else if param == 5 {
            return "5-cycle sleep ((5 x 90 mins))"
        }
        else if param == 6 {
            return "6-cycle sleep ((6 x 90 mins))"
        }
        else {
            return "Invalid sleep cycle"
        }
    }
}
