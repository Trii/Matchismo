//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Joshua Johnston on 6/3/14.
//  Copyright (c) 2014 josh johnston. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CardGameViewController

- (Deck *)deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:nil forState:UIControlStateNormal];
    } else {
        PlayingCard *card = [self.deck drawRandomCard];
        if (!card) {
            self.deck = nil;
            card = [self.deck drawRandomCard];
        }
        
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        UIColor *color = [card isRedCard] ? [UIColor redColor] : [UIColor blackColor];
        [sender setTitleColor:color forState:UIControlStateNormal];
        [sender setTitle:[card contents] forState:UIControlStateNormal];
        self.flipCount++;
    }
}

@end
