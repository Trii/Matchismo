//
//  PlayingCard.h
//  Matchismo
//
//  Created by Joshua Johnston on 6/3/14.
//  Copyright (c) 2014 josh johnston. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
- (BOOL)isRedCard;
- (BOOL)isBlackCard;
@end
