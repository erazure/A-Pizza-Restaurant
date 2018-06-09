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
#import "ManagerOne.h"
#import "ManagerTwo.h"

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
        
        Kitchen *restaurantKitchen = [Kitchen new];
        ManagerOne *managerOne = [ManagerOne new];
        ManagerTwo *managerTwo = [ManagerTwo new];
        
        while (TRUE) {
            
            NSLog(@"If you'd like to order a pizza, please enter your pizza size (small, medium , or large) and toppings separated by spaces:");
            
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            NSLog(@"Input was %@", inputString);
            NSLog(@"Would you like to have a manager oversee your order? Please enter <1> for manager one, <2> for manager two, or <No thanks> to proceed.");
            
            NSLog(@"> ");
            char managerStr[100];
            fgets (managerStr, 100, stdin);
            
            NSString *managerStrTwo = [[NSString alloc] initWithUTF8String:managerStr];
            managerStrTwo = [managerStrTwo stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            
            if ([managerStrTwo isEqualToString:@"1"]) {
                restaurantKitchen.delegate = managerOne;
            }
            else if ([managerStrTwo isEqualToString:@"2"]) {
                restaurantKitchen.delegate = managerTwo;
            }
            else {
                restaurantKitchen.delegate = nil;
            }
            
            
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            NSString *firstWord = commandWords[0];
            NSRange rangeOfToppings;
            rangeOfToppings.location = 1;
            rangeOfToppings.length = [commandWords count] - 1;
            NSArray *toppings = [commandWords subarrayWithRange:rangeOfToppings];
            
            Pizza *pizza = [restaurantKitchen makePizzaWithSize:stringtoSize(firstWord) toppings:toppings];
            NSLog(@"You ordered a pizza of size: %@", sizeToString(pizza.size));
            NSLog(@"With these toppings: %@", pizza.toppings);
            
        }

    }
    return 0;
}

