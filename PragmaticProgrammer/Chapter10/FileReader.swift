//
//  FileReader.swift
//  PragmaticProgrammer
//
//  Created by Grzegorz Gumieniak on 29/07/2021.
//

import Foundation


// TODO: Make a line by line reader, not by entire file in a one moment
final class FileReader {
    init() {
    }
    
    func openFile(fileName: String) {
        let file = prepareDirectoryOfFile(name: fileName)
        if checkIsFileValid(file: file) {
            
        }
    }
    
    private func prepareDirectoryOfFile(name fileName: String) -> URL {
        return FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(fileName)
    }
    
    private func checkIsFileValid(file fileDirectory: URL) -> Bool {
        if FileManager.default.fileExists(atPath: fileDirectory.path) {
            return true
        }
        return false
    }
    func readLine() -> String {
        return "Some string"
    }
}
