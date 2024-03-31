//
//  Globals.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import Foundation

let BASE_URL = "http://000.000.0.000:01/api/"



struct Globals {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
}

public func runOnMainThread(block: @escaping () -> ()) {
    
    DispatchQueue.main.async {
        block()
    }
}

/**
 Runs a block in background
 */
public func runInBackground(block: @escaping () -> ()) {
    
    DispatchQueue.global(qos: .background).async {
        block()
    }
}

public func runInBackgroundWithSync(block: @escaping () -> ()) {
    
    DispatchQueue.global(qos: .background).sync{
        block()
    }
}

public func runAfterTime(time: Double ,block : @escaping() -> ()){
    
    DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            block()
    }
}


public let UD_USER_DETAILS = "userLoginDetails"
let SOMETHING_WRONG = "Something Went wrong, Please try again"
public let USER_ISLOGGED_IN = "isUserLoggedIn"
