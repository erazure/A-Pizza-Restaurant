//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)someToppings
{
    if (self.delegate != nil) //alternatively: if (self.delegate)
    {
        BOOL shouldMakePizza = [self.delegate kitchen:self shouldMakePizzaOfSize:size andToppings:someToppings];
        BOOL shouldUpgradeOrder = [self.delegate kitchenShouldUpgradeOrder:self];
        if (!shouldMakePizza) {
            return nil;
        }
        if (shouldUpgradeOrder) {
            size = PizzaSizeLarge;
        }
    }
    
    
    Pizza *somePizza = [[Pizza alloc] initWithPizzaSize:size toppings:someToppings];
    
    if ([self.delegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
        [self.delegate kitchenDidMakePizza:somePizza];
    }
    return somePizza;
}

@end
