//
//  NSString+AAA.h
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AAA)

// - aaa_underscore       (ExampleName => example_name)
// - aaa_dasherize        (ExampleName => example-name)
// - aaa_camelize         (example name => ExampleName)

- (instancetype)aaa_capitalizeFirstLetter;
- (instancetype)aaa_capitalizeFirstLetterForLocale:(NSLocale *)locale;

#pragma mark - Class Methods

+ (instancetype)aaa_randomWordsWithWordCount:(NSUInteger)wordCount;
+ (instancetype)aaa_randomWordsWithMin:(NSUInteger)min max:(NSUInteger)max;
+ (instancetype)aaa_randomTitleCaseWordsWithMin:(NSUInteger)min max:(NSUInteger)max;
+ (instancetype)aaa_randomSentenceCaseWordsWithMin:(NSUInteger)min max:(NSUInteger)max;

@end
