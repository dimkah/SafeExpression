//
//  SafeExpression.m
//  SafeExpression
//
//  Created by Dmytro Romanov on 15.05.25.
//

#import "SafeExpression.h"

@implementation SafeExpression

+ (nullable NSExpression *)expressionWithFormat:(NSString *)format error:(NSError **)error {
    @try {
        return [NSExpression expressionWithFormat:format];
    } @catch (NSException *exception) {
        if (error) {
            *error = [NSError errorWithDomain:@"SafeExpression.Error"
                                         code:1
                                     userInfo:@{
                                         NSLocalizedDescriptionKey: exception.reason ?: @"Unknown error"
                                     }];
        }
        return nil;
    }
}

@end
