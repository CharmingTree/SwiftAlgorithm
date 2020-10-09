//
//  main.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/09.
//

import Foundation

var mergesort : MergeSort = MergeSort()

var arr = [ 90, 3, 1, 4, 3,34, 22 , 23, 6,1]
print("arr size : \(arr.count)")
mergesort.initSortedArr(size: arr.count)
print(arr)

mergesort.mergeSort(arr: &arr, m: 0, n: arr.count-1)

print(arr)
