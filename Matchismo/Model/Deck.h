//
//  Deck.h
//  Matchismo
//
//  Created by Joshua Johnston on 6/4/14.
//  Copyright (c) 2014 josh johnston. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;
@end
