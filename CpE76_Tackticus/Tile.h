//
//  Tile.h
//  CpE76_Tackticus
//
//  Created by Administrator on 9/21/13.
//  Copyright (c) 2013 Line of Awesome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Unit.h"

@interface Tile: NSObject

@property int owner;
@property Unit *unit;
@property float currentHP;
@property float currentMP;
@property NSString *status; /* IDLE, SELECTED, HIGHTLIGHTED */

- (id)initWithOwner:(int)owner AndUnit:(Unit *)unit AndCurrentHP:(float)hp AndCurrentMP:(float)mp;
@end
