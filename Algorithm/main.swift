//
//  main.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/09.
//

import Foundation

//var mergesort : MergeSort = MergeSort()
//var quick : QuickSort = QuickSort()
//var arr = [ 90, 3, 1, 4, 3,34, 22 , 23, 6,1]
//print("unSorted : \(arr)")

/* MergeSort Test*/
//print("arr size : \(arr.count)")
//mergesort.initSortedArr(size: arr.count)
//print("unSorted : \(arr)")
//mergesort.mergeSort(arr: &arr, west: 0, east: arr.count-1)
//print("Sorted : \(arr)")

/* QuickSort Test*/
//quick.quickSort(arr: &arr, start: 0, end: arr.count-1)
//print("unSorted : \(arr)")

/* DFS TEST */
var d = DFS()
d.setValue(edges: [(1, 2), (2, 1), (1, 3), (3, 1), (2, 3), (3, 2), (2, 4), (4, 2), (2, 5), (5, 2), (3, 6), (6, 3), (3, 7), (7, 3), (4, 5), (5, 4), (6, 7), (7, 6)])

d.dfs(x: 1)

//practiceDFS(n: 7, edges: [(1, 2), (2, 1), (1, 3), (3, 1), (2, 3), (3, 2), (2, 4), (4, 2), (2, 5), (5, 2), (3, 6), (6, 3), (3, 7), (7, 3), (4, 5), (5, 4), (6, 7), (7, 6)])


//class Myclass {
//    var a : YourClass!
//    deinit {
//        print("deinit")
//    }
//}
//
//class YourClass {
//    var b : Myclass!
//    deinit {
//        print("yourClass deinit")
//    }
//}
//var myobj : Myclass! = Myclass()
//
//var myobj2 : YourClass! = YourClass()
//
//myobj.a = myobj2
//myobj2.b = myobj
//
//myobj = nil
//
//
//
//print("=== END")
