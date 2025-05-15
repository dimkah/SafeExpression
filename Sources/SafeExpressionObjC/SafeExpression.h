//
//  SafeExpression.h
//  SafeExpression
//
//  Created by Dmytro Romanov on 15.05.25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SafeExpression : NSObject

+ (nullable NSExpression *)expressionWithFormat:(NSString *)format
                                           error:(NSError * _Nullable * _Nullable)error
                                            NS_SWIFT_NAME(expression(format:error:))
                                            NS_SWIFT_NOTHROW;

@end

NS_ASSUME_NONNULL_END
