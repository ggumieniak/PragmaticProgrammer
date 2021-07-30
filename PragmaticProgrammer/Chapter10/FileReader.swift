//
//  FileReader.swift
//  PragmaticProgrammer
//
//  Created by Grzegorz Gumieniak on 29/07/2021.
//

import Foundation


final class FileReader {
    private var filePointer: UnsafeMutablePointer<FILE>?
    var lineByteArrayPointer: UnsafeMutablePointer<CChar>? = nil
    var lineCap: Int = 0
    init() {}
    deinit { closeFile() }
    func openFile(fileName: String) {
        let file = prepareDirectoryOfFile(name: fileName)
        if checkIsFileValid(file: file) {
            filePointer = createFilePointer(at: file)
        } else {
            print("Failed to find an file: \(file)")
        }
    }
    
    func closeFile() {
        guard let filePointer = self.filePointer else {
            print("File wasn't be pointed")
            return
        }
        lineByteArrayPointer = nil
        lineCap = 0
        fclose(filePointer)
    }
    
    func readLine() -> String {
        guard let filePointer = self.filePointer else {
            return "File wasn't pointed"
            
        }
        
        let lengthOfLine = getline(&lineByteArrayPointer, &lineCap, filePointer)
        
        if checkIfTheFileIsEndAt(line: lengthOfLine) {
            return String.init(cString:lineByteArrayPointer!)
        } else {
            return "End of File."
        }
    }
    
    private func checkIfTheFileIsEndAt(line: Int) -> Bool {
        return line > 0 ? true : false
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
    private func createFilePointer(at fileDirectory: URL) -> UnsafeMutablePointer<FILE> {
        guard let filePointer = fopen(fileDirectory.path, "r") else {
            preconditionFailure("Failed to open an file \(fileDirectory.absoluteString)")
        }
        return filePointer
    }
}
