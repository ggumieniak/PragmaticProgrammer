//
//  Tortoise.swift
//  PragmaticProgrammer
//
//  Created by Grzegorz Gumieniak on 03/08/2021.
//

import Foundation

protocol Parser {
    func createListOfCommands()
    func getArgsFromConsole() -> String
    func createCommand(from input: String) -> Commands
    func separateStringFrom(input: String) -> [String]
    func isCommandExists(command: String) -> Bool
    func isCommandValid(command: [String]) -> Bool
    func parseCommand(command: [String]) -> Commands
    func doesUserUpperPen(command: Commands) -> Bool
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

struct Tortoise: Parser  {
    func createListOfCommands() {
        var command: Commands?
        repeat {
            let input = getArgsFromConsole()
            command = createCommand(from: input)
        } while(doesUserUpperPen(command: command ?? Commands.Upper))
    }
    
    func getArgsFromConsole() -> String {
        guard let input = readLine() else {
            return ""
        }
        return input
    }
    
    func createCommand(from input: String) -> Commands {
        <#code#>
    }
    
    func isCommandExists(command: String) -> Bool {
        <#code#>
    }
    
    func isCommandValid(command: [String]) -> Bool {
        <#code#>
    }
    
    func parseCommand(command: [String]) -> Commands {
        <#code#>
    }
    
    func doesUserUpperPen(command: Commands) -> Bool {
        <#code#>
    }
    
    func separateStringFrom(input: String) -> [String] {
        let substrings = input.split(separator: " ")
        let output = substrings.map { String($0) }
        return output
    }
}
