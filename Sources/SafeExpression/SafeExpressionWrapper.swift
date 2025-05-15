//
//  SafeExpressionWrapper.swift
//  SafeExpression
//
//  Created by Dmytro Romanov on 15.05.25.
//

import Foundation
import SafeExpressionObjC

public enum SafeExpressionWrapper {
    
    public static func expression(format: String) throws -> NSExpression {
        var error: NSError?
        if let expr = SafeExpression.expression(format: format, error: &error) {
            return expr
        } else {
            throw error ?? NSError(domain: "SafeExpression.Unknown", code: -1)
        }
    }
}
