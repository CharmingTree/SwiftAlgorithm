//
//  main.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/09.
//

import Foundation

var mergesort : MergeSort = MergeSort()
var quick : QuickSort = QuickSort()
var arr = [ 90, 3, 1, 4, 3,34, 22 , 23, 6,1]
print("unSorted : \(arr)")

/* MergeSort Test*/
//print("arr size : \(arr.count)")
//mergesort.initSortedArr(size: arr.count)
//print("unSorted : \(arr)")
//mergesort.mergeSort(arr: &arr, west: 0, east: arr.count-1)
//print("Sorted : \(arr)")

/* QuickSort Test*/
quick.quickSort(arr: &arr, start: 0, end: arr.count-1)
print("unSorted : \(arr)")

