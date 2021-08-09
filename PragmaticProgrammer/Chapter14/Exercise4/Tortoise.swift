//
//  Tortoise.swift
//  PragmaticProgrammer
//
//  Created by Grzegorz Gumieniak on 03/08/2021.
//

import Foundation

protocol Parser {
    func getActionFromConsole()
    func separateStringFrom(input: String) -> [String]
    func isCommandExists(command: String) -> Bool
    func isCommandValid(command: (String,Int)) -> Bool
    func createCommand(command: (String,Int)) -> Commands
}

enum Pencils {
    case width, thin
}

enum Commands {
    case Pencil(thickness: Pencils)
    case Drop
    case West(width: Int)
    case North(width: Int)
    case South(width: Int)
    case East(width: Int)
    case Upper
}

struct Tortoise: Parser {
    private var listOfCommands: [Commands]?
    func getActionFromConsole() {
        if let input = readLine() {
            let strings = separateStringFrom(input: input).map { $0.lowercased()}
            print(isCommandExists(command: strings.first!))
        } else {
            print("Please input some command")
        }
    }
    
    func separateStringFrom(input: String) -> [String] {
        let substrings = input.split(separator: " ")
        let output = substrings.map { String($0) }
        return output
    }
    func isCommandExists(command: String) -> Bool {
        switch command {
        case "p":
            return true
        case "d":
            return true
        case "w":
            return true
        case "n":
            return true
        case "s":
            return true
        case "e":
            return true
        case "u":
            return true
        default:
            return false
        }
    }
    
    func isCommandValid(command: (String, Int)) -> Bool {
        fatalError("Not implemented")
    }
    
    func createCommand(command: (String, Int)) -> Commands {
        fatalError("Not implemented")
    }
    
    
}
