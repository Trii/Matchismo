//
//  PlayingCard.m
//  Matchismo
//
//  Created by Joshua Johnston on 6/3/14.
//  Copyright (c) 2014 josh johnston. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    return @[@"♣︎", @"♥︎", @"♠︎", @"♦︎"];
}

- (BOOL)isRedCard
{
    return [@[@"♥︎", @"♦︎"] containsObject: self.suit];
}

- (BOOL)isBlackCard
{
    return ![self isRedCard];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : [[PlayingCard rankStrings] objectAtIndex:0];
}


+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6",
             @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count] - 1;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
