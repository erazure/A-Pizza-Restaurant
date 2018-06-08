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
    Pizza *somePizza = [[Pizza alloc] initWithPizzaSize:size toppings:someToppings];
    return somePizza;
 //5. Call Pizza's initializer to create a Pizza
}



@end
