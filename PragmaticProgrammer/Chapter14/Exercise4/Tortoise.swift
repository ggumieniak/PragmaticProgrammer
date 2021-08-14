//
//  Tortoise.swift
//  PragmaticProgrammer
//
//  Created by Grzegorz Gumieniak on 03/08/2021.
//

import Foundation

protocol Parser {
    var listOfCommands: [Commands] { get }
    func createListOfCommands()
    func getArgsFromConsole() -> String
    func createCommand(from input: String) -> Commands
    func separateStringFrom(input: String) -> [String]
    func isCommandExists(command: String) -> Bool
    func isCommandValid(commands: [String]) -> Bool
    func parseCommand(command: [String]) -> Commands
    func doesUserUpperPen(command: Commands) -> Bool
}

enum Pencils: Int {
    case width = 1, thin
}

enum Commands: Equatable {
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
    
    private(set) var listOfCommands: [Commands] = []
    
    func createListOfCommands() {
        print(#function)
        var command: Commands
        repeat {
            let input = getArgsFromConsole()
            command = createCommand(from: input)
            print(command)
            listOfCommands.append(command)
        } while(!doesUserUpperPen(command: command))
        for item in listOfCommands {
            print(item)
        }
    }
    
    func getArgsFromConsole() -> String {
        guard let input = readLine() else {
            return ""
        }
        return input
    }
    
    func createCommand(from input: String) -> Commands {
        let separatedInput = separateStringFrom(input: input).map { $0.lowercased() }
        if isCommandValid(commands: separatedInput) {
            return parseCommand(command: separatedInput)
        } else {
            print("Nie odnaleziono polecenia")
            return .NONE
        }
    }
    
    func separateStringFrom(input: String) -> [String] {
        let substrings = input.split(separator: " ")
        var output = substrings.map { String($0) }
        output.append("1")
        return output
    }
    
    func isCommandValid(commands: [String]) -> Bool {
        if let command = commands.first, isCommandExists(command: command) {
            switch command {
            case "p","n","w","s","e":
                return commands[1].isInt
            default:
                return true
            }
        }
        return false
    }
    
    func isCommandExists(command: String) -> Bool {
        let options = Commands.shortcuts.allCases.map { $0.rawValue }
        return options.contains(command)
    }
    
    func parseCommand(command: [String]) -> Commands {
        if let value = Int(command[1]), value > 0 {
            switch command[0] {
            case "p": return Commands.Pencil(thickness: Pencils(rawValue: value < 2 ? value : 1)!)
            case "n": return Commands.North(width: value)
            case "w": return Commands.West(width: value)
            case "s": return Commands.South(width: value)
            case "e": return Commands.East(width: value)
            case "d": return Commands.Drop
            case "u": return Commands.Upper
            default:
                return .NONE
            }
        } else {
            return .NONE
        }
    }
    
    func doesUserUpperPen(command: Commands) -> Bool {
        return command == Commands.Upper ? true : false
    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
    
}
