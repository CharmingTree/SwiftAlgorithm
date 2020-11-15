//
//  TimSort.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/23.
//

import Foundation
extension Array {
    mutating func insertionSort(by comparer: (Element, Element) -> Bool) {
        insertionSort(0, count, by: comparer)
    }

    private mutating func insertionSort(_ begin:Int, _ end: Int, by comparer: (Element, Element) -> Bool) {

        for i in begin..<end {
            for j in stride(from: i, to: 0, by: -1) {
                if !comparer(self[j],self[j-1]) {
                    break
                }
                self.swapAt(j, j-1)
            }
        }
    }
}

extension Array {
     mutating func mergeSort(by comparer: (Element, Element) -> Bool) {
         _mergeSort(0, count, by: comparer)
     }

     private mutating func _mergeSort(_ start: Int, _ end:Int, by comparer: (Element, Element) -> Bool) {
         let range = end - start
         if range < 2 {
             return
         }

         let mid = (start + end) / 2
         _mergeSort(start, mid, by: comparer)
         _mergeSort(mid, end, by: comparer)
         merge(start, end, by:comparer)
     }

     private mutating func merge(_ start:Int, _ end: Int, by comparer: (Element, Element) -> Bool ){
         self.insertionSort(start, end, by: comparer)
     }
 }

extension Array where Element == Range<Int>{
    mutating func mergeRuns(_ merging: (Range<Int>) -> Void)
    {
         while count > 1
        {
            var lastIndex = count - 1
            
            if lastIndex >= 3, self[lastIndex-3].count <= self[lastIndex-2].count + self[lastIndex-1].count
            {
                if self[lastIndex-2].count < self[lastIndex].count
                {
                    lastIndex -= 1
                }
                
            }
            else if lastIndex >= 2, self[lastIndex-2].count <= self[lastIndex-1].count + self[lastIndex].count
            {
                if self[lastIndex-2].count < self[lastIndex].count
                {
                    lastIndex -= 1
                }
            }
            else if self[lastIndex-1].count <= self[lastIndex].count
            {
                //
            }
            else
            {
                break;
            }
            
            let mergedX = self.remove(at: lastIndex)
            let mergedY = self.remove(at: lastIndex-1)
            
            let merged = mergedY.lowerBound..<mergedX.upperBound
            merging(merged)
            
            self.insert(merged, at: lastIndex-1)
        }
    }
    private mutating func mergeAll(_ merging: (Range<Int>)->Void)
    {
        while count > 1
        {
            let mergedX = self.removeLast()
            let mergedY = self.removeLast()
            
            let merged = mergedY.lowerBound..<mergedX.upperBound
            merging(merged)
            self.append(merged)
        }
    }
}

extension Array
{
    private var minRun : Int{
        let bitsToUse = 6
        if count < 1 << bitsToUse
        {
            return count
        }
        let offset = (Int.bitWidth - bitsToUse) - count.leadingZeroBitCount
        let mask = (1 << offset) - 1
        return count >> offset + (count & mask == 0 ? 0 : 1)
    }
    
    private func getRun(_ start : Int, by comparer : (Element, Element) -> Bool) -> (Bool, Int)
    {
        guard start < count - 1 else {
            return (true, count)
        }
        
        let isDescending = comparer(self[start+1], self[start])
        
        var previous = start
        var current = start + 1
        repeat
        {
            previous = current
            current += 1
        } while current < count && isDescending == comparer(self[current], self[previous])
        
        return (isDescending, current)
    }
   
    private mutating func reverse(_ start:Int,_ end: Int)
    {
        var start = start
        var end = end
        while start < end
        {
            swapAt(start, end)
            start += 1
            end -= 1
        }
    }
    
    mutating func timsort(_ start : Int, _ end : Int, by comparer: (Element,Element)->Bool)
    {
        let minRun = self.minRun
        var runStack: [Range<Int>] = []
        var start = startIndex
        
        while start < endIndex
        {
            var (isDesending,end) = getRun(start, by: comparer)
            
            if isDesending
            {
                reverse(start, end)
            }
            
            if end < endIndex, end - start < minRun
            {
                let newEnd = Swift.min(endIndex, start+minRun)
                
                insertionSort(start, newEnd, by:comparer)
                end = newEnd
            }
            
            runStack.append(start..<end)
            runStack.mergeRuns {
                merge($0.lowerBound, $0.upperBound, by:comparer)
            }
            
            start = end
        }
        
        runStack.mergeAll {
            merge($0.lowerBound, $0.upperBound, by:comparer)
        }
    }
}

class TimSort : Sort
{
    
    
    func Sort(arr: inout [Int], start: Int, end: Int) {
        print("")
    }
    func verifySort(arr: inout [Int]) -> Bool {
        print("")
        return true
    }
}
