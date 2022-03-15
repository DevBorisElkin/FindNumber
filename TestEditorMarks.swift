//
//  TestEditorMarks.swift
//  FindNumber
//
//  Created by macuser on 3/15/22.
//

import Foundation

class TestEditorMarks{
    // MARK: Properties
    var a = 5
    var b = 20
    // MARK: -
    var c:Double = 22.5
    //MARK: -
    var d:Bool = false
    var e = 3
    //MARK: - Properties
    var g = 2
    
    // MARK: Functions
    func ActionFunc(){
        TestFunc_2()
        TestFunc_3()
        
    }
    
    // FIXME: need to fix this
    func coolFunc(){
        #warning("Fix me ASAP")
        print("Hello")
        //#error("It won't be builded")
    }
    
    // TODO: learn Swift every day
    
    /**
     Does some cool things
     - parameter x: Amount of people
     - parameter z: Does the crowd is multicultural
     - returns:  Sum of people
     
     - # First Discussion Header
        Some text text text text and so on
        and on and on...
        and some **bold description**
     - # Second Discussion Header
        Discussion header explanation
     - # Third discussion header without explanation
     
      More space for text.
     Here is description and a web link [google](https://google.com)
     */
    func TestFunc(x: Int, y: Int, z: Bool) -> Int{
        return 0
    }
    
    func TestFunc_4(x: Int, y: Int, z: Bool) -> Int{
        return 0
    }
    
    func TestFunc_2() -> Int{
        TestFunc(x: 1, y: 2, z: true)
        return 5
    }
    
    @discardableResult func TestFunc_3() -> Int{
        return 6
    }
}
