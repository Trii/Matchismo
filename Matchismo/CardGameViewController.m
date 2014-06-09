//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Joshua Johnston on 6/3/14.
//  Copyright (c) 2014 josh johnston. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardbuttons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardbuttons count]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int chooseButtonIndex = [self.cardbuttons indexOfObject:sender];
    [self.game chooseCardAtIndex:chooseButtonIndex];
    [self updateUI];
}

- (void) updateUI
{
    for (UIButton *cardButton in self.cardbuttons) {
        int cardButtonIndex = [self.cardbuttons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
