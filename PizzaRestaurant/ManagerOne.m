//
//  ManagerOne.m
//  PizzaRestaurant
//
//  Created by Erik Goossens on 2018-06-08.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "ManagerOne.h"

@implementation ManagerOne

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings { 
    return ![toppings containsObject:@"anchovies"];
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    return NO;
}

@end
