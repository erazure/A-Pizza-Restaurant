//
//  ManagerTwo.m
//  PizzaRestaurant
//
//  Created by Erik Goossens on 2018-06-08.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "ManagerTwo.h"
#import "Kitchen.h"

@implementation ManagerTwo

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    return YES;
}

- (void)kitchenDidMakePizza:(Pizza *)pizza {
    NSLog(@"Enjoy your pizza!");
}


@end
