//
//  Tile.m
//  CpE76_Tackticus
//
//  Created by Administrator on 9/21/13.
//  Copyright (c) 2013 Line of Awesome. All rights reserved.
//

#import "Tile.h"

@implementation Tile
// class methods defined here

- (id)initWithOwner:(int)owner AndUnit:(Unit *)unit AndCurrentHP:(float)hp AndCurrentMP:(float)mp
{
    self = [super init];
    if (self) {
        self.owner = owner;
        self.unit = unit;
        self.currentHP = hp;
        self.currentMP = mp;
        self.status = @"idle";
    }
    return self;
}


@end
