//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Joshua Johnston on 6/8/14.
//  Copyright (c) 2014 josh johnston. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject
- (instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSInteger)index;
- (Card *)cardAtIndex:(NSInteger)index;

@property (nonatomic, readonly) NSInteger score;
@end
