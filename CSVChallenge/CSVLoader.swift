//
//  CSVLoader.swift
//  CSVChallenge
//
//  Created by Carlos Fernandez Mayor on 21/04/2018.
//  Copyright © 2018 Carlos Fernandez Mayor. All rights reserved.
//

import Foundation
import CSV

class CSVLoader {
    
    public func rows(filename: String) throws -> [Row] {
        let string = try load(filename: filename)
        let reader = try CSVReader(string: string, hasHeaderRow: true)
        return try reader.compactMap( { try row(from: $0) } )
    }
    
    private func load(filename: String) throws -> String {
        let comps = try filename.filenameComponents()
        let bundle = Bundle(for: type(of: self))
        guard let fileURL = bundle.url(forResource: comps[0], withExtension: comps[1]) else {
            throw ApplicationError.fileNotFound
        }
        let string = try String(contentsOf: fileURL)
        return string
    }
    
    private func row(from array:[String]) throws -> Row {
        if array.count != 3 { throw ApplicationError.incorrectRowFormat }
        let title = array[0]
        let description = array[1]
        let image = array[2]
        return Row(title: title, description: description, imageUrl: image)
    }
}

extension String {
    public func filenameComponents() throws -> [String] {
        let filenameComponents = self.split(separator: ".")
        guard filenameComponents.count == 2 else { throw ApplicationError.incorrectFilenameFormat }
        return filenameComponents.map({String($0)})
    }
}

enum ApplicationError: Error {
    case incorrectFilenameFormat
    case fileNotFound
    case incorrectRowFormat
}
