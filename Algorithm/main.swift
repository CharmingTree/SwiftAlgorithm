//
//  main.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/09.
//

import Foundation

//var mergesort : MergeSort = MergeSort()
//var quick : QuickSort = QuickSort()
var arr : [Int] = []

for i in 0..<100 {
    arr.append(Int(arc4random_uniform(200)))
}

//for i in stride(from: 0, to: arr.count, by: 1) {
//    if ( (i % 10) == 0 )
//    {
//        print("\(i):\(arr[i])")
//    }
//    else {
//        print("\(i):\(arr[i])", terminator: " ")
//    }
//}

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
//var d = DFS()
//d.setValue(edges: [(1, 2), (2, 1), (1, 3), (3, 1), (2, 3), (3, 2), (2, 4), (4, 2), (2, 5), (5, 2), (3, 6), (6, 3), (3, 7), (7, 3), (4, 5), (5, 4), (6, 7), (7, 6)])
//
//d.dfs(x: 1)

/* InsertTest */
//var insertsort : InsertSort = InsertSort()
//print("unSorted : \(arr)")
//insertsort.Sort(arr: &arr, start: 0, end: arr.count)
//print("Sorted : \(arr)")

/* BubbleSortTest */
//var bubblesort : Sort = BubbleSort()
//
//print("unSorted : \(arr)")
//bubblesort.Sort(arr: &arr, start: 0, end: arr.count)
//print("Sorted : \(arr)")
//practiceDFS(n: 7, edges: [(1, 2), (2, 1), (1, 3), (3, 1), (2, 3), (3, 2), (2, 4), (4, 2), (2, 5), (5, 2), (3, 6), (6, 3), (3, 7), (7, 3), (4, 5), (5, 4), (6, 7), (7, 6)])

/* MaxHeapSort Test */

var maxHeapsort : Sort = MaxHeapSort()
print("unSorted : \(arr)")
maxHeapsort.Sort(arr: &arr, start: 0, end: arr.count)
print("Sorted : \(arr)")
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
