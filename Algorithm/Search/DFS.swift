//
//  DFS.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/11.
//

import Foundation


func practiceDFS(n lastNode: Int, edges : [(Int, Int)]) -> Int {
    var edgeInfo = [Int : Array<Int>]()
    
    for edge in edges {
        if var array = edgeInfo[edge.0] {
            array.append(edge.1)
            edgeInfo[edge.0] = array
        }
        else {
            edgeInfo[edge.0] = [edge.1]
        }
    }
    
    var result = 0
    
    func dfs(node : Int, visited : [Int]) {
        guard node != lastNode else {
            result += 1
            return
        }
        
        guard let neighbors = edgeInfo[node] else { return }
        for edge in neighbors {
            guard visited.contains(edge) == false else { continue }
            print(node, terminator: " ")
            dfs(node: node, visited: visited + [edge])
        }
        
        
    }
    
    dfs(node: 1, visited: [1])
    
    return result
}


//practiceDFS(n: 5, edges: [(1, 2), (1, 3), (1, 4), (2, 1), (2, 4), (2, 5), (3, 2), (3, 4), (4, 5)])
class DFS
{
    var edgeInfo : [Int : Array<Int>]
    var visited : [Bool]
    
    init() {
        edgeInfo = [Int : Array<Int>]()
        visited = [Bool]()
    }
    
    func setValue(edges : [(Int, Int)]) {
        
        // [(1, 2), (1, 3), (1, 4), (2, 1), (2, 4), (2, 5), (3, 2), (3, 4), (4, 5)])
        for edge in edges {
            if var array = edgeInfo[edge.0] {
                array.append(edge.1)
                edgeInfo[edge.0] = array
            }
            else {
                edgeInfo[edge.0] = [edge.1]
            }
        }
        print(">>>> \n\(edgeInfo)")
        for i in 0..<edgeInfo.count {
            visited.append(false)
        }
        
    }
    
    func dfs(x : Int) { // start point
        if (visited[x-1]) { return }
        else {
            visited[x-1] = true
            print(x, terminator: " ")
            guard let current = edgeInfo[x]  else {
                return
            }
            for i in 0..<current.count {
                var y = current[i]
                dfs(x: y)
            }
        }
    }
    
    
}
