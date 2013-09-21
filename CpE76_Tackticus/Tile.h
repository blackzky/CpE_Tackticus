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

@property NSString *owner;
@property Unit *unit;
@property int currentHP;

- (id)initWithOwner:(NSString *)owner AndUnit:(Unit *)unit AndCurrentHP:(int)hp;
@end
