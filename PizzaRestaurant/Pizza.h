//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by Erik Goossens on 2018-06-07.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PizzaSize) {
    PizzaSizeSmall = 0,
    PizzaSizeMedium = 1,
    PizzaSizeLarge = 2,
};

@interface Pizza : NSObject

@property (nonatomic, assign) PizzaSize size;
@property (nonatomic, copy, readonly) NSArray <NSString *>*toppings;

-(instancetype) initWithPizzaSize:(PizzaSize)size toppings:(NSArray<NSString*>*)toppings;

    //6. implement a custom initializer
    // 7. create PizzaSize propery and toppings property
@end
