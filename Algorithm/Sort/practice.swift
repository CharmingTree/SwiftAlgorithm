//
//  practice.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/17.
//

import Foundation

class Practice : Sort
{
 
    var sorted : [Int]
    
    init()
    {
        sorted = []
    }
    
    init(len : Int) {
        sorted = []
        for i in 0..<len
        {
            sorted.append(0)
        }
    }
    
    func partition4(arr : inout [Int], start : Int, end : Int) -> Int
    {
        var left = start
        var right = end
        var pivot = end
        
        while (left < right)
        {
            while (arr[pivot] > arr[left] && left < right)
            {
                left += 1
            }
            while (arr[pivot] <= arr[right] && left < right)
            {
                right -= 1
            }
            if (left < right)
            {
                arr.swapAt(left, right)
            }
        }
        
        arr.swapAt(right, pivot)
        
        return right
    }
    
    func QuickSort4(arr: inout [Int], left : Int, right : Int)
    {
        
        if (left < right)
        {
            var pivot = partition4(arr: &arr, start: left, end: right)
            QuickSort4(arr: &arr, left: left, right: pivot-1)
            QuickSort4(arr: &arr, left: pivot+1, right: right)
        }
    }
    
    func Merge4(arr : inout [Int], west : Int, middle : Int, east : Int)
    {
        var i = west
        var j = middle+1
        var k = west
        
        while ( i <= middle && j <= east)
        {
            if (arr[i] < arr[j])
            {
                sorted[k] = arr[i]
                i += 1
            }
            else
            {
                sorted[k] = arr[j]
                j += 1
            }
            k += 1
        }
        
        if (i > middle)
        {
            for t in stride(from: j, through: east, by: 1)
            {
                sorted[k] = arr[t]
                k += 1
            }
        }
        else
        {
            for t in stride(from: i, through: middle, by: 1)
            {
                sorted[k] = arr[t]
                k += 1
            }
        }
        
        for t in stride(from: west, through: east, by: 1)
        {
            arr[t] = sorted[t]
        }
    }
    
    func MergeSort4(arr : inout [Int], west : Int, east : Int)
    {
        if ( west < east)
        {
            var middle = (west+east) / 2
            MergeSort4(arr: &arr, west: west, east: middle)
            MergeSort4(arr: &arr, west: middle+1, east: east)
            Merge4(arr: &arr, west: west, middle: middle, east: east)
        }
    }
    
    func MaxHeapify3(arr : inout [Int], root : Int)
    {
        if (root >= arr.count) { return }
        
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        MaxHeapify3(arr: &arr, root: child1)
        MaxHeapify3(arr: &arr, root: child2)
        
        if (child2 >= arr.count)
        {
            if (child1 >= arr.count)
            {
                return
            }
            else
            {
                if (arr[root] < arr[child1])
                {
                    arr.swapAt(root, child1)
                }
                return
            }
        }
        
        var large = child1
        
        if (arr[child1] < arr[child2])
        {
            large = child2
        }
        
        if (arr[root] < arr[large])
        {
            arr.swapAt(root, large)
            heapsort3(arr: &arr, root: large, len: arr.count)
            return
        }
    }
    func heapsort3(arr : inout [Int], root : Int, len : Int)
    {
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        if (child2 >= len)
        {
            if (child1 >= len)
            {
                return
            }
            else
            {
                if (arr[root] < arr[child1])
                {
                    arr.swapAt(root, child1)
                }
                return
            }
        }
        
        if (arr[child2] < arr[child1])
        {
            swap(&child1, &child2)
        }
        
        if (arr[root] < arr[child2])
        {
            arr.swapAt(root, child2)
            heapsort3(arr: &arr, root: child2, len: len)
        }
    }
    
    func MaxHeapSort3(arr : inout [Int], start : Int, end : Int)
    {
        MaxHeapify3(arr: &arr, root: 0)
        for i in stride(from: end-1, to: start, by: -1)
        {
            arr.swapAt(0, i)
            heapsort3(arr: &arr, root: 0, len: i)
        }
    }
    
    func Merge(arr : inout [Int], west : Int, middle : Int, east : Int)
    {
        var i = west
        var j = middle+1
        var k = west
        
        while ( i <= middle && j <= east)
        {
            if (arr[i] < arr[j])
            {
                sorted[k] = arr[i]
                i += 1
            }
            else
            {
                sorted[k] = arr[j]
                j += 1
            }
            k += 1
        }
        
        if (i > middle)
        {
            for t in stride(from: j, to: east+1, by: 1)
            {
                sorted[k] = arr[t]
                k += 1
            }
        }
        else
        {
            for t in stride(from: i, to: middle+1, by: 1)
            {
                sorted[k] = arr[t]
                k += 1
            }
        }
        
        for t in stride(from: west, to: east+1, by: 1)
        {
            arr[t] = sorted[t]
        }
    }
    
    func MergeSort(arr : inout [Int], west : Int, east : Int)
    {
        if (west < east)
        {
            var middle = (west+east) / 2
            MergeSort(arr: &arr, west: west, east: middle)
            MergeSort(arr: &arr, west: middle+1, east: east)
            Merge(arr: &arr, west: west, middle: middle, east: east)
        }
    }
    
    func MaxHeapify2(arr : inout [Int], root : Int)
    {
        if (arr.count <= root) { return }
        
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        MaxHeapify2(arr: &arr, root: child1)
        MaxHeapify2(arr: &arr, root: child2)
        
        if (child2 >= arr.count)
        {
            if (child1 >= arr.count)
            {
                return
            }
            else
            {
                if (arr[root] < arr[child1])
                {
                    arr.swapAt(root, child1)
                }
                return
            }
        }
        
        var large = child1
        
        if (arr[child1] < arr[child2])
        {
            large = child2
        }
        
        if (arr[root] < arr[large])
        {
            arr.swapAt(root, large)
            heapsort2(arr: &arr, root: large, len: arr.count)
            return
        }
    }
    
    func heapsort2(arr : inout [Int], root : Int, len : Int)
    {
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        if (child2 >= len)
        {
            if (child1 >= len)
            {
                return
            }
            else
            {
                if (arr[root] < arr[child1])
                {
                    arr.swapAt(root, child1)
                }
                return
            }
        }
        
        if (arr[child1] > arr[child2])
        {
            swap(&child1, &child2)
        }
        
        if (arr[root] < arr[child2])
        {
            arr.swapAt(root, child2)
            heapsort2(arr: &arr, root: child2, len: len)
        }
    }
    
    func MaxHeapSort2(arr: inout [Int], start : Int, end : Int)
    {
        MaxHeapify2(arr: &arr, root: 0)
        for i in stride(from: end-1, to: start, by: -1)
        {
            arr.swapAt(0, i)
            heapsort2(arr: &arr, root: 0, len: i)
        }
    }
    
    
    func MaxHeapify(arr : inout [Int], root : Int)
    {
        if (root >= arr.count) { return }
        
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        MaxHeapify(arr: &arr, root: child1)
        MaxHeapify(arr: &arr, root: child2)
        
        if (child2 >= arr.count)
        {
            if (child1 >= arr.count) { return }
            
            if (arr[root] < arr[child1])
            {
                arr.swapAt(root, child1)
            }
            return 
        }
        
        var large = child1
        
        if (arr[child1] < arr[child2])
        {
            large = child2
        }
        
        if (arr[root] < arr[large])
        {
            arr.swapAt(root, large)
            heapsort(arr: &arr, root: large, len: arr.count)
            return
        }
        
    }
    
    func heapsort(arr : inout [Int], root : Int, len : Int)
    {
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        if (child2 >= len)
        {
            if (child1 >= len)
            {
                return
            }
            
            if (arr[child1] > arr[root])
            {
                arr.swapAt(child1, root)
            }
            return
        }
        
        if (arr[child1] > arr[child2])
        {
            swap(&child1, &child2)
        }
        
        if (arr[root] < arr[child2])
        {
            arr.swapAt(root, child2)
            heapsort(arr: &arr, root: child2, len: len)
        }
        
    }
    func MaxHeapSort(arr : inout [Int], start : Int, end : Int)
    {
        MaxHeapify(arr: &arr, root: start)
        for i in stride(from: arr.count-1, to: start, by: -1)
        {
            arr.swapAt(0, i)
            heapsort(arr: &arr, root: 0, len: i)
        }
    }
    
    func partition(arr : inout [Int], start : Int, end : Int) -> Int
    {
        var left = start
        var right = end
        var pivot = end
        
        while (left < right)
        {
            while (arr[pivot] > arr[left] && left < right)
            {
                left += 1
            }
            while (arr[pivot] <= arr[right] && left < right)
            {
                right -= 1
            }
            if (left < right)
            {
                arr.swapAt(left, right)
            }
        }
        
        arr.swapAt(right, pivot)
        return right
    }
    
    func quickSort(arr : inout [Int], start : Int, end : Int)
    {
        var left = start
        var right = end
        if ( left < right)
        {
            var pivot = partition(arr: &arr, start: left, end: right)
            quickSort(arr: &arr, start: left, end: pivot-1)
            quickSort(arr: &arr, start: pivot+1, end: right)
        }
    }
    
    func Merge5(arr : inout [Int], west : Int, middle : Int, east : Int)
    {
        var i = west
        var j = middle+1
        var k = west
        
        while ( i <= middle && j <= east)
        {
            if (arr[i] < arr[j])
            {
                sorted[k] = arr[i]
                i += 1
            }
            else
            {
                sorted[k] = arr[j]
                j += 1
            }
            k += 1
        }
        
        if (i > middle)
        {
            for t in stride(from: j, through: east, by: 1)
            {
                sorted[k] = arr[t]
                k += 1
            }
        }
        else
        {
            for t in stride(from: i, through: middle, by: 1)
            {
                sorted[k] = arr[t]
                k += 1
            }
        }
        
        for t in stride(from: west, through: east, by: 1)
        {
            arr[t] = sorted[t]
        }
    }
    
    func MergeSort5(arr : inout [Int], west : Int, east : Int)
    {
        if (west < east)
        {
            var middle = (west+east) / 2
            MergeSort5(arr: &arr, west: west, east: middle)
            MergeSort5(arr: &arr, west: middle+1, east: east)
            Merge5(arr: &arr, west: west, middle: middle, east: east)
        }
    }
    
    func partition5(arr : inout [Int], start : Int, end : Int) -> Int
    {
        var left = start
        var right = end
        var pivot = end
        
        while (left < right)
        {
            while (arr[pivot] > arr[left] && left < right)
            {
                left += 1
            }
            while (arr[pivot] <= arr[right] && left < right)
            {
                right -= 1
            }
            
            if (left < right)
            {
                arr.swapAt(left, right)
            }
        }
        
        arr.swapAt(right, pivot)
        return right
    }
    
    func quickSort5(arr : inout [Int], start : Int, end : Int)
    {
        var left = start
        var right = end
        if ( left < right)
        {
            var pivot = partition5(arr: &arr, start: left, end: right)
            quickSort5(arr: &arr, start: left, end: pivot-1)
            quickSort5(arr: &arr, start: pivot+1, end: right)
        }
    }
    
    func MaxHeapify4(arr : inout [Int], root : Int)
    {
        if root >= arr.count { return }
        
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        MaxHeapify4(arr: &arr, root: child1)
        MaxHeapify4(arr: &arr, root: child2)
        
        if ( child2 >= arr.count)
        {
            if (child1 >= arr.count)
            {
                return
            }
            else
            {
                if (arr[root] < arr[child1])
                {
                    arr.swapAt(root, child1)
                }
                return
            }
        }
        
        var large = child1
        
        if (arr[child1] < arr[child2])
        {
            large = child2
        }
        
        if (arr[root] < arr[large])
        {
            arr.swapAt(root, large)
            heapSort4(arr: &arr, root: large, len: arr.count)
            return
        }
    }
    
    func heapSort4(arr : inout [Int], root : Int, len : Int)
    {
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        if (child2 >= len)
        {
            if (child1 >= len)
            {
                return
            }
            else
            {
                if (arr[root] < arr[child1])
                {
                    arr.swapAt(root, child1)
                }
                return
            }
        
        }
        
        if (arr[child1] > arr[child2])
        {
            swap(&child1, &child2)
        }
        
        if (arr[root] < arr[child2])
        {
            arr.swapAt(root, child2)
            heapSort4(arr: &arr, root: child2, len: len)
        }
    }
    func MaxHeapSort4(arr : inout [Int], start : Int, end : Int)
    {
        MaxHeapify4(arr: &arr, root: 0)
        for i in stride(from: end-1, through: start, by: -1)
        {
            arr.swapAt(0, i)
            heapSort4(arr: &arr, root: 0, len: i)
        }
    }
    
    func MaxHeapify5(arr : inout [Int], root : Int)
    {
        if ( arr.count <= root)
        {
            return;
        }
        
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        MaxHeapify5(arr: &arr, root: child1)
        MaxHeapify5(arr: &arr, root: child2)
        
        if (child2 >= arr.count)
        {
            if (child1 >= arr.count)
            {
                return;
            }
            else
            {
                if (arr[root] < arr[child1])
                {
                    arr.swapAt(root, child1)
                }
                return;
            }
        }
        
        var large = child1
        
        if (arr[child1] < arr[child2])
        {
            large = child2
        }
        
        if (arr[root] < arr[large])
        {
            arr.swapAt(root, large)
            heapsort5(arr: &arr, root: large, len: arr.count)
            return;
        }
    }
    
    func heapsort5(arr : inout [Int], root : Int, len : Int)
    {
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        if (child2 >= len)
        {
            if (child1 >= len)
            {
                return
            }
            else
            {
                if (arr[root] < arr[child1])
                {
                    arr.swapAt(root, child1)
                }
                return
            }
        }
        
        if (arr[child1] > arr[child2])
        {
            swap(&child1, &child2)
        }
        
        if (arr[root] < arr[child2])
        {
            arr.swapAt(root, child2)
            heapsort5(arr: &arr, root: child2, len: len)
        }
    }
    
    func MaxHeapSort5(arr: inout [Int], start : Int, end : Int)
    {
        MaxHeapify5(arr: &arr, root: 0)
        for i in stride(from: end, through: start, by: -1)
        {
            arr.swapAt(0, i)
            heapsort5(arr: &arr, root: 0, len: i)
        }
    }
    
    func partition6(arr : inout [Int], start : Int, end : Int) -> Int
    {
        var left = start
        var right = end
        var pivot = end
        
        while (left < right)
        {
            while (arr[pivot] > arr[left] && left < right)
            {
                left += 1
            }
            while (arr[pivot] <= arr[right] && left < right)
            {
                right -= 1
            }
            
            if (left < right)
            {
                arr.swapAt(left, right)
            }
        }
        
        arr.swapAt(right, pivot)
        
        return right
    }
    
    func QuickSort6(arr : inout [Int], start : Int, end : Int)
    {
        var left = start
        var right = end
        if (left < right)
        {
            var pivot = partition6(arr: &arr, start: left, end: right)
            QuickSort6(arr: &arr, start: left, end: pivot-1)
            QuickSort6(arr: &arr, start: pivot+1, end: right)
        }
    }
    
    func Merge6(arr : inout [Int], west : Int, middle : Int, east : Int)
    {
        var i = west
        var j = middle+1
        var k = west
        
        while ( i <= middle && j <= east)
        {
            if (arr[i] < arr[j])
            {
                sorted[k] = arr[i]
                i += 1
            }
            else
            {
                sorted[k] = arr[j]
                j += 1
            }
            k += 1
        }
        
        if (i > middle)
        {
            for t in stride(from: j, through: east, by: 1)
            {
                sorted[k] = arr[t]
                k += 1
            }
        }
        else
        {
            for t in stride(from: i, through: middle, by: 1)
            {
                sorted[k] = arr[t]
                k += 1
            }
        }
        
        for t in stride(from: west, through: east, by: 1)
        {
            arr[t] = sorted[t]
        }
    }
    func MergeSort6(arr : inout [Int], west : Int, east : Int)
    {
        if ( west < east)
        {
            var middle = (west+east) / 2
            MergeSort6(arr: &arr, west: west, east: middle)
            MergeSort6(arr: &arr, west: middle+1, east: east)
            Merge6(arr: &arr, west: west, middle: middle, east: east)
        }
    }
    
    func MaxHeapify6(arr : inout [Int], root : Int)
    {
        if (root >= arr.count)
        {
            return
        }
        
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        MaxHeapify6(arr: &arr, root: child1)
        MaxHeapify6(arr: &arr, root: child2)
        
        if (child2 >= arr.count) {
            if ( child1 >= arr.count) {
                return;
            }
            else {
                arr.swapAt(root, child1)
                return
            }
        }
        
        var large = child1
        
        if (arr[child1] < arr[child2])
        {
            large = child2
        }
        
        if (arr[root] < arr[large])
        {
            arr.swapAt(root, large)
            heapsort6(arr: &arr, root: large, len: arr.count)
            return
        }
    }
    
    func heapsort6(arr : inout [Int], root : Int, len : Int)
    {
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        if (child2 >= len) {
            if (child1 >= len) {
                return
            }
            else{
                if (arr[root] < arr[child1])
                {
                    arr.swapAt(root, child1)
                }
                return
            }
        }
        
        if (arr[child1] > arr[child2]) {
            swap(&child1, &child2)
        }
        
        if (arr[root] < arr[child2])
        {
            arr.swapAt(root, child2)
            heapsort6(arr: &arr, root: child2, len: len)
        }
    }
    
    func MaxHeapSort6(arr : inout [Int], start : Int, end : Int) {
        MaxHeapify6(arr: &arr, root: 0)
        for i in stride(from: end, through: start, by: -1)
        {
            arr.swapAt(0, i)
            heapsort6(arr: &arr, root: 0, len: i)
        }
    }
    
    func Merge7(arr : inout [Int], west : Int, middle : Int, east : Int)
    {
        var i = west
        var j = middle+1
        var k = west
        
        while ( i <= middle && j <= east)
        {
            if (arr[i] < arr[j])
            {
                sorted[k] = arr[i]
                i += 1
            }
            else {
                sorted[k] = arr[j]
                j += 1
            }
            k += 1
        }
        
        if i > middle {
            for t in stride(from: j, through: east, by: 1)
            {
                sorted[k] = arr[t]
                k += 1
            }
        }
        else {
            for t in stride(from: i, through: middle, by: 1)
            {
                sorted[k] = arr[t]
                k += 1
            }
        }
        
        for t in stride(from: west, through: east, by: 1)
        {
            arr[t] = sorted[t]
        }
    }
    
    func MergeSort7(arr : inout [Int], west : Int, east : Int)
    {
        if (west < east)
        {
            var middle = (west+east) / 2
            MergeSort7(arr: &arr, west: west, east: middle)
            MergeSort7(arr: &arr, west: middle+1, east: east)
            Merge7(arr: &arr, west: west, middle: middle, east: east)
        }
    }
    
    func partition7(arr : inout [Int], start : Int, end : Int) -> Int
    {
        var left = start
        var right = end
        var pivot = end
        
        while (left < right) {
            while(arr[pivot] > arr[left] && left < right) {
                left += 1
            }
            while(arr[pivot] <= arr[right] && left < right) {
                right -= 1
            }
            if (left<right) {
                arr.swapAt(left, right)
            }
        }
        arr.swapAt(right, pivot)
        
        return right
    }
    
    func quickSort7(arr : inout [Int], left : Int, right : Int) {
        if (left < right) {
            var pivot = partition7(arr: &arr, start: left, end: right)
            quickSort7(arr: &arr, left: left, right: pivot-1)
            quickSort7(arr: &arr, left: pivot+1, right: right)
        }
    }
    
    func MaxHeapify7(arr : inout [Int], root : Int)
    {
        if (arr.count <= root ) { return }
        
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        MaxHeapify7(arr: &arr, root: child1)
        MaxHeapify7(arr: &arr, root: child2)
        
        if (child2 >= arr.count) {
            if (child1 >= arr.count) {
                return
            }
            else{
                if (arr[root] < arr[child1]) {
                    arr.swapAt(root, child1)
                }
                return
            }
        }
        
        var large = child1
        
        if (arr[child1] < arr[child2]) {
            large = child2
        }
        
        if (arr[root] < arr[large]) {
            arr.swapAt(root, large)
            heapsort7(arr: &arr, root: large, len: arr.count)
            return
        }
    }
    
    func heapsort7(arr : inout [Int], root : Int, len : Int) {
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        if (child2 >= len) {
            if (child1 >= len) {
                return
            }
            else{
                if (arr[root] < arr[child1])
                {
                    arr.swapAt(root, child1)
                }
                return
            }
        }
        
        if (arr[child1] > arr[child2]) {
            swap(&child1, &child2)
        }
        
        if (arr[root] < arr[child2]) {
            arr.swapAt(root, child2)
            heapsort7(arr: &arr, root: child2, len: len)
        }
    }
    
    func MaxHeapSort7(arr : inout [Int], start : Int, end : Int) {
        MaxHeapify7(arr: &arr, root: 0)
        for i in stride(from: end, through: start, by: -1) {
            arr.swapAt(0, i)
            heapsort7(arr: &arr, root: 0, len: i)
        }
    }
    
    func Merge8(arr : inout [Int], west : Int,middle : Int, east : Int) {
        var i = west
        var j = middle+1
        var k = west
        
        while ( i <= middle && j <= east) {
            if (arr[i] < arr[j]) {
                sorted[k] = arr[i]
                i += 1
            }
            else {
                sorted[k] = arr[j]
                j += 1
            }
            k += 1
        }
        
        if (i > middle) {
            for t in stride(from: j, through: east, by: 1) {
                sorted[k] = arr[t]
                k += 1
            }
        }
        else {
            for t in stride(from: i, through: middle, by: 1) {
                sorted[k] = arr[t]
                k += 1
            }
        }
        
        for t in stride(from: west, through: east, by: 1) {
            arr[t] = sorted[t]
        }
    }
    
    func MergeSort8(arr : inout [Int], west : Int, east : Int) {
        if (west < east) {
            var middle = (west + east) / 2
            MergeSort8(arr: &arr, west: west, east: middle)
            MergeSort8(arr: &arr, west: middle+1, east: east)
            Merge8(arr: &arr, west: west, middle: middle, east: east)
        }
    }
    
    func partition8(arr : inout [Int], start : Int, end : Int) -> Int {
        var left = start
        var right = end
        var pivot = end
        
        while ( left < right) {
            while (arr[pivot] > arr[left] && left < right) {
                left += 1
            }
            while (arr[pivot] <= arr[right] && left < right) {
                right -= 1
            }
            if (left < right) {
                arr.swapAt(left, right)
            }
        }
        
        arr.swapAt(right, pivot)
        return right
    }
    
    func QuickSort8(arr : inout [Int], start : Int, end : Int) {
        if (start < end ) {
            var pivot = partition8(arr: &arr, start: start, end: end)
            QuickSort8(arr: &arr, start: start, end: pivot-1)
            QuickSort8(arr: &arr, start: pivot+1, end: end)
        }
    }
    
    func getMaxLength(arr : [Int]) -> Int{
        var maxLength : Int = 0;
        
        for i in 0..<arr.count {
            var clength = (arr[i] == 0) ? 1 : Int(log10(Double(arr[i])))+1;
            if ( maxLength < clength) {
                maxLength = clength
            }
        }
        
        return maxLength;
    }
    
    func RadixSort(arr : inout [Int]) {
        let maxLength = getMaxLength(arr: arr);
        var bucket = Array<Array<Int>>()
        var powed = 1
        var index = 0
        for i in 0..<10
        {
            bucket.append(Array<Int>())
        }
        
        for i in 1...maxLength {
            
            for j in 0..<arr.count {
                var element = Int(arr[j]/powed) % 10
                bucket[element].append(arr[j]);
            }
            
            for j in 0..<10 {
                while (!bucket[j].isEmpty) {
                    arr[index] = Int(bucket[j][0])
                    bucket[j].remove(at: 0)
                    index += 1
                }
            }
            index = 0
            powed *= 10
        }
    }
    
    func Sort(arr: inout [Int], start: Int, end: Int) {
        //quickSort(arr: &arr, start: start, end: end-1)
        //MaxHeapSort(arr: &arr, start: start, end: end)
        //MergeSort(arr: &arr, west: start, east: end-1)
        //MaxHeapSort2(arr: &arr, start: start, end: end)
        //MaxHeapSort3(arr: &arr, start: start, end: end)
        //MergeSort4(arr: &arr, west: start, east: end-1)
//        QuickSort4(arr: &arr, left: start, right: end-1)
//        MergeSort5(arr: &arr, west: start, east: end-1)
//        quickSort5(arr: &arr, start: start, end: end-1)
//        MaxHeapSort5(arr: &arr, start: start, end: end-1)
//        QuickSort6(arr: &arr, start: start, end: end-1)
//        MergeSort6(arr: &arr, west: start, east: end-1)
//        MaxHeapSort6(arr: &arr, start: start, end: end-1)
//        MergeSort7(arr: &arr, west: start, east: end-1)
//        quickSort7(arr: &arr, left: start, right: end-1)
//        MaxHeapSort7(arr: &arr, start: start, end: end-1)
//        MergeSort8(arr: &arr, west: start, east: end-1)
//        QuickSort8(arr: &arr, start: start, end: end-1)
        RadixSort(arr: &arr)
    }
    
    public func verifySort(arr : inout [Int]) -> Bool
    {
        var isCollect : Bool = true
        for i in stride(from: 1, to: arr.count, by: 1)
        {
            if ( arr[i-1] > arr[i])
            {
                isCollect = false
                break
            }
        }
        return isCollect
    }
}
