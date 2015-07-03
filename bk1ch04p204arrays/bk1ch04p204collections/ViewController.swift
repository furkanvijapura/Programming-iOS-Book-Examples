

import UIKit

protocol Flier {
}
struct Bird : Flier {
    var name = "Tweety"
}
struct Insect : Flier {
}
class Dog {
}
class NoisyDog : Dog {
}

// *** marks big changes in iOS 9 / Swift 2.0


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            var arr = [Int]()
            _ = arr
            arr = []
        }
        
        do {
            var arr : [Int] = []
            _ = arr
            arr = []
        }
        
        do {
            let dogs = [Dog(), NoisyDog()]
            let objs = [1, "howdy"]
            // let arrr = [Insect(), Bird()] // compile error
            let arr : [Flier] = [Insect(), Bird()]
            let rs = Array(1...3)
            print(rs)
            let chars = Array("howdy".characters)
            print(chars)
            let kvs = Array(["hey":"ho", "nonny":"nonny no"])
            print(kvs)
            let strings : [String?] = Array(count:100, repeatedValue:nil)
            _ = arr
            _ = strings
            _ = dogs
            _ = objs
        }
        
        do {
            let arr : [Int?] = [1,2,3]
            print(arr) // [Optional(1), Optional(2), Optional(3)]
        }
        
        do {
            let dog1 : Dog = NoisyDog()
            let dog2 : Dog = NoisyDog()
            let arr = [dog1, dog2]
            if arr is [NoisyDog] {
                print("yep") // meaning it can be cast down
            }
            let arr2 = arr as! [NoisyDog]
            _ = arr2
        }
        
        do {
            let dog1 : Dog = NoisyDog()
            let dog2 : Dog = NoisyDog()
            let dog3 : Dog = Dog()
            let arr = [dog1, dog2]
            let arr2 = arr as? [NoisyDog] // Optional wrapping an array of NoisyDog
            let arr3 = [dog2, dog3]
            let arr4 = arr3 as? [NoisyDog] // nil
            _ = arr2
            _ = arr4
        }
        
        do {
            let i1 = 1
            let i2 = 2
            let i3 = 3
            if [1,2,3] == [i1,i2,i3] { // they are equal!
                print("equal")
            }
            
            let nd1 = NoisyDog()
            let d1 = nd1 as Dog
            let nd2 = NoisyDog()
            let d2 = nd2 as Dog
            if [d1,d2] == [nd1,nd2] { // they are equal!
                print("equal")
            }
        }
        
        do {
            var arr = [1,2,3]
            arr[1] = 4 // arr is now [1,4,3]
            arr[1..<2] = [7,8] // arr is now [1,7,8,3]
            arr[1..<2] = [] // arr is now [1,8,3]
            
            let slice = arr[1..<2]
            _ = slice
        }
        
        do {
            var arr = [[1,2,3], [4,5,6], [7,8,9]]
            let i = arr[1][1] // 5
            arr[1][1] = 100
            _ = i
        }
        
        do {
            let arr = [1,2,3]
            print(arr.first)
            print(arr.last)
            let arr2 = arr[arr.count-2...arr.count-1] // [2,3]
            let arr3 = suffix(arr,2) // [2,3]
            let arr4 = suffix(arr,10) // [1,2,3] with no penalty
            print(arr4)
            
            // let arr5 = arr[0..<10]
            
            var r = arr.indices
            r.startIndex = r.endIndex-2
            print(arr[r])
            
            _ = arr2
            _ = arr3
        }
        
        do {
            let arr : [Int?] = [1,2,3]
            let i = arr.last // a double-wrapped Optional
            _ = i
        }
        
        do {
            let arr = [1,2,3]
            let ok = arr.contains(2) // ***
            let okk = arr.contains {$0 > 3} // false
            let ix = arr.indexOf(2) // *** Optional wrapping 1
            
            let aviary = [Bird(name:"Tweety"), Bird(name:"Flappy"), Bird(name:"Lady")]
            let ix2 = aviary.indexOf {$0.name.characters.count < 5}
            print(ix2)
            
            let ok2 = arr.startsWith([1,2]) {$0 == $1} // ***
            let ok3 = arr.startsWith([1,2], isEquivalent:==) // ***
            let ok4 = arr.startsWith([1,2])
            let ok5 = arr.startsWith(1...2)
            _ = ok
            _ = okk
            _ = ix
            _ = ok2
            _ = ok3
            _ = ok4
            _ = ok5
        }

        do {
            let arr = [3,1,-2]
            let min = arr.minElement() // *** -2
            print(min)
            let min2 = arr.minElement {abs($0)<abs($1)}
            print(min2)
        }
        
        do {
            var arr = [1,2,3]
            arr.append(4)
            arr.extend([5,6])
            arr.extend(7...8) // arr is now [1,2,3,4,5,6,7,8]
            
            let arr2 = arr + [4] // arr2 is now [1,2,3,4]
            var arr3 = [1,2,3]
            arr3 += [4] // arr3 is now [1,2,3,4]
            _ = arr2

        }
        
        do {
            var arr = [1,2,3]
            arr.insert(4, atIndex:1)
            let i = arr.removeAtIndex(3)
            let ii = arr.removeLast()
            print(arr)
            _ = i
            _ = ii
            let arr2 = dropFirst(arr)
            let arr3 = dropLast(arr)
            _ = arr2
            _ = arr3
        }
        
        do {
            let arr = [[1,2], [3,4], [5,6]]
            let arr2 = [10,11].join(arr) // [1, 2, 10, 11, 3, 4, 10, 11, 5, 6]
            let arr3 = [].join(arr) // [1, 2, 3, 4, 5, 6]
            let arr4 = arr.flatMap {$0} // new in Swift 1.2
            _ = arr2
            _ = arr3
            _ = arr4
        }
        
        do {
            var arr = [4,3,5,2,6,1]
            arr.sortInPlace()
            arr.sortInPlace {$0 > $1} // *** [1, 2, 3, 4, 5, 6]
            arr = [4,3,5,2,6,1]
            arr.sortInPlace(>) // *** [1, 2, 3, 4, 5, 6]
            
        }
        
        do {
            let arr = [1,2,3,4,5,6]
            let arr2 = split(arr) {$0 % 2 == 0} // split at evens: [[1], [3], [5]]
            print(arr2)
            _ = arr2
        }

        let pepboys = ["Manny", "Moe", "Jack"]
        for pepboy in pepboys {
            print(pepboy) // prints Manny, then Moe, then Jack
        }
        for (ix,pepboy) in pepboys.enumerate() { // ***
            print("Pep boy \(ix) is \(pepboy)") // Pep boy 0 is Manny, etc.
        }
        let arr = [1,2,3]
        let arr2 = arr.map {$0 * 2} // [2,4,6]
        let arr3 = arr.map {Double($0)} // [1.0, 2.0, 3.0]
        pepboys.map {print($0)} // prints Manny, then Moe, then Jack
        pepboys.map(print)
        let arr4 = pepboys.filter{$0.hasPrefix("M")} // [Manny, Moe]

        let arrr = [1, 4, 9, 13, 112]
        let sum = arrr.reduce(0) {$0 + $1} // 139
        let sum2 = arrr.reduce(0, combine:+)

        _ = arr2
        _ = arr3
        _ = arr4
        _ = sum
        _ = sum2

        
        do {
            let arr = [[1,2], [3,4], [5,6]]
            let flat = arr.reduce([], combine:+) // [1, 2, 3, 4, 5, 6]
            _ = flat
            
            let arr2 = [[1,2], [3,4], [5,6], 7]
            let arr3 = arr2.flatMap {$0}
            print(arr3) // I honestly don't understand this one

        }
        
        do {
            let arr = [["Manny", "Moe", "Jack"], ["Harpo", "Chico", "Groucho"]]
            let target = "m"
            let arr2 = arr.map {
                $0.filter {
                    let options = NSStringCompareOptions.CaseInsensitiveSearch
                    let found = $0.rangeOfString(target, options: options)
                    return (found != nil)
                }
                }.filter {$0.count > 0}
            print(arr2)
        }
        
        do {
            let arr = [UIBarButtonItem(), UIBarButtonItem()]
            self.navigationItem.leftBarButtonItems = arr
            self.navigationItem.setLeftBarButtonItems(arr, animated: true)
        }
        
        do {
            var arr = ["Manny", "Moe", "Jack"]
            // let ss = arr.componentsJoinedByString(", ") // compile error
            let s = (arr as NSArray).componentsJoinedByString(", ")
            let arr2 = NSMutableArray(array:arr)
            arr2.removeObject("Moe")
            arr = arr2 as NSArray as! [String]
            print(arr)
            
            _ = s
            
        }
        
        do {
            let arrCGPoints = [CGPoint]()
            // let arrr = arrCGPoints as NSArray // compiler stops you
            let arrNSValues = arrCGPoints.map { NSValue(CGPoint:$0) }
            let arr = arrNSValues as NSArray
            _ = arrNSValues
            _ = arr
        }
        
        do {
            let arr = [String?]()
            // let arr2 = arr.map{if $0 == nil {return NSNull()} else {return $0!}} // compile error
            // let arr2 = arr.map{s -> AnyObject in if s == nil {return NSNull()} else {return s!}}
            let arr2 : [AnyObject] = arr.map{if $0 == nil {return NSNull()} else {return $0!}}
            _ = arr2
        }
        
        do {
            // the API is fixed!
            let arr = UIFont.familyNames().map {
                UIFont.fontNamesForFamilyName($0)
            }
            // print(arr)
            let views = self.view.subviews
            _ = arr
            _ = views
            // but you can still receive an untyped array
            let pepboys = Thing().badMethod() as! [String]
            print(pepboys)
        }
        
        do {
            let arr = [AnyObject]()
            let arr2 : [String] = arr.map {
                if $0 is String {
                    return $0 as! String
                } else {
                    return ""
                }
            }
            _ = arr2
        }

    }

}
