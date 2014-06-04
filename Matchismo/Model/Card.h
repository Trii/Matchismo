//
//  Card.h
//  Matchismo
//
//  Created by Joshua Johnston on 6/3/14.
//  Copyright (c) 2014 josh johnston. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int) match: (NSArray *) otherCards;

@end
