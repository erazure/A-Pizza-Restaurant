//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Erik Goossens on 2018-06-07.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

-(instancetype) initWithPizzaSize:(PizzaSize)size toppings:(NSArray<NSString*>*)toppings {
    self = [super init];
    if (self) {
        _toppings = toppings;
        _size = size;
    }
    return self;
    
}
@end
    
