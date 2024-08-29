//
//  Logger.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/29/24.
//

import Foundation

private let queue = DispatchQueue(label: "LoggerQueue")

final class Logger {
    static func event(
        message: String,
        filePath: String = #file,
        line: Int = #line,
        functionName: String = #function,
        date: Date = Date()
    ) {
        queue.async {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
            let formattedDate = dateFormatter.string(from: date)
            
            let fileName = filePath.components(separatedBy: "/").last?.replacingOccurrences(of: ".swift", with: "") ?? "unknownFilename \(filePath)"
            
            var log = "[\(String(describing: fileName))][\(functionName):\(line)][\(formattedDate)] \(message)"
           print(log)
        }
    }
}
