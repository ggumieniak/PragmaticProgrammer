//
//  Tortoise.swift
//  PragmaticProgrammer
//
//  Created by Grzegorz Gumieniak on 03/08/2021.
//

import Foundation

protocol Parser {
    var listOfCommands: [Commands]? { get }
    func createListOfCommands()
    func getArgsFromConsole() -> String
    func createCommand(from input: String) -> Commands
    func separateStringFrom(input: String) -> [String]
    func isCommandExists(command: String) -> Bool
//    func isCommandValid(command: [String]) -> Bool
//    func parseCommand(command: [String]) -> Commands
//    func doesUserUpperPen(command: Commands) -> Bool
}

enum Pencils {
    case width, thin
}

enum Commands {
    enum shortcuts: String, CaseIterable {
        case p,d,n,w,s,e,u
    }
    case Pencil(thickness: Pencils)
    case Drop
    case West(width: Int)
    case North(width: Int)
    case South(width: Int)
    case East(width: Int)
    case Upper
    case NONE
}

class Tortoise: Parser  {
    private(set) var listOfCommands: [Commands]?
    
    func createListOfCommands() {
        print(#function)
        var command: Commands
        repeat {
            let input = getArgsFromConsole()
            command = createCommand(from: input)
            listOfCommands?.append(command)
        } while(/* doesUserUpperPen(command: command) */ false)
    }
    
    func getArgsFromConsole() -> String {
        guard let input = readLine() else {
            return ""
        }
        return input
    }
    
    func createCommand(from input: String) -> Commands {
        let separatedInput = separateStringFrom(input: input).map { $0.lowercased() }
        if let command = separatedInput.first, isCommandExists(command: command) {
            return .Drop
        } else {
            print("Nie odnaleziono polecenia")
            return .NONE
        }
    }
    
    func separateStringFrom(input: String) -> [String] {
        let substrings = input.split(separator: " ")
        let output = substrings.map { String($0) }
        return output
    }
    
    func isCommandExists(command: String) -> Bool {
        // TODO: this looks a bit strange
        let options = Commands.shortcuts.allCases.map { $0.rawValue }
        return options.contains(command)
    }
    
//    func isCommandValid(command: [String]) -> Bool {
//        <#code#>
//    }
//
//    func parseCommand(command: [String]) -> Commands {
//        <#code#>
//    }
//
//    func doesUserUpperPen(command: Commands) -> Bool {
//        <#code#>
//    }
//

}
