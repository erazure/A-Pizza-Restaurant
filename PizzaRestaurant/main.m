//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "Pizza.h"

PizzaSize stringtoSize(NSString * str) {
    if ([str.lowercaseString isEqualToString:@"small"]) {
        return PizzaSizeSmall;
    }
    if ([str.lowercaseString isEqualToString:@"medium"]) {
            return PizzaSizeMedium;
    }
    return PizzaSizeLarge;
}

NSString *sizeToString(PizzaSize size) {
    switch (size) {
        case PizzaSizeSmall:
            return @"small";
        case PizzaSizeMedium:
            return @"medium";
        case PizzaSizeLarge:
            return @"large";
    }
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
        while (TRUE) {
            
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            NSLog(@"Input was %@", inputString);
            
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            NSString *firstWord = commandWords[0];
            NSRange rangeOfToppings;
            rangeOfToppings.location = 1;
            rangeOfToppings.length = [commandWords count] - 1;
            NSArray *toppings = [commandWords subarrayWithRange:rangeOfToppings];
            
            Pizza *pizza = [restaurantKitchen makePizzaWithSize:stringtoSize(firstWord) toppings:toppings];
            NSLog(@"%@", pizza);
            NSLog(@"You ordered a pizza of size: %@", sizeToString(pizza.size));
            NSLog(@"With these toppings: %@", pizza.toppings);
            
            
            
        }

    }
    return 0;
}

