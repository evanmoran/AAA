//
//  NSString+AAA.m
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import "NSString+AAA.h"
#import "NSNumber+AAA.h"

@implementation NSString (AAA)

 - (instancetype)aaa_capitalizeFirstLetter
 {
     NSLocale *locale = [NSLocale currentLocale];
     return [self aaa_capitalizeFirstLetterForLocale:locale];
 }

- (instancetype)aaa_capitalizeFirstLetterForLocale:(NSLocale *)locale
{
    if (self.length == 0)
        return self;
    NSString *firstChar = [[self substringToIndex:1] uppercaseStringWithLocale:locale];
    return [firstChar stringByAppendingString:[self substringFromIndex:1]];
}

#pragma mark - Class Methods

+ (instancetype)aaa_randomWordsWithWordCount:(NSUInteger)wordCount;
{
    NSArray *words = @[@"lorem",@"ipsum",@"dolor",@"sit",@"amet",@"consectetur",@"adipisicing",@"elit",@"sed",@"do",@"eiusmod",@"tempor",@"incididunt",@"ut",@"labore",@"et",@"dolore",@"magna",@"aliqua",@"Ut",@"enim",@"ad",@"minim",@"veniam",@"quis",@"nostrud",@"exercitation",@"ullamco",@"laboris",@"nisi",@"ut",@"aliquip",@"ex",@"ea",@"commodo",@"consequat",@"duis",@"aute",@"irure",@"dolor",@"in",@"reprehenderit",@"in",@"voluptate",@"velit",@"esse",@"cillum",@"dolore",@"eu",@"fugiat",@"nulla",@"pariatur",@"excepteur",@"sint",@"occaecat",@"cupidatat",@"non",@"proident",@"sunt",@"in",@"culpa",@"qui",@"officia",@"deserunt",@"mollit",@"anim",@"id",@"est",@"laborum"];

    if (wordCount <= 0) {
        return @"";
    }

    NSUInteger randomIndex = [NSNumber aaa_randomIndexForCount:words.count];
    NSMutableArray *output = [NSMutableArray array];

    for (NSUInteger index = randomIndex; wordCount > 0; ) {
        [output addObject:words[index]];
        wordCount--;
        // Loop words array
        index = (index + 1) % words.count;
    }

    return [output componentsJoinedByString:@" "];
}

+ (instancetype)aaa_randomWordsWithMin:(NSUInteger)min max:(NSUInteger)max;
{
    return [self aaa_randomWordsWithWordCount:[NSNumber aaa_randomUIntegerFromMin:min toMax:max]];
}

+ (instancetype)aaa_randomTitleCaseWordsWithMin:(NSUInteger)min max:(NSUInteger)max;
{
    return [[self aaa_randomWordsWithMin:min max:max] capitalizedString];
}

+ (instancetype)aaa_randomSentenceCaseWordsWithMin:(NSUInteger)min max:(NSUInteger)max;
{
    return [[self aaa_randomWordsWithMin:min max:max] aaa_capitalizeFirstLetterForLocale:[NSLocale localeWithLocaleIdentifier:@"en-US"]];
}

@end
