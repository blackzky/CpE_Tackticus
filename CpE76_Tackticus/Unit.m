//
//  Unit.m
//  CpE76_Tackticus
//
//  Created by Administrator on 9/21/13.
//  Copyright (c) 2013 Line of Awesome. All rights reserved.
//

#import "Unit.h"

@implementation Unit

- (id)initType:(NSString *)t hp:(float)bh mp:(float)bm bDamage:(int)bd sDamage:(int)sd moveRange:(int)mr atkRange:(int)ar skillRange:(int)sr skillCost:(int)sc
{
    self = [super init];
    if (self) {
        self.type = t;
        self.baseHP = bh;
        self.baseMP = bm;
        self.baseDamage = bd;
        self.skillDamage = sd;
        self.moveRange = mr;
        self.attackRange = ar;;
        self.skillRange = sr;
        self.skillCost = sc;
    }
    return self;
}

@end
