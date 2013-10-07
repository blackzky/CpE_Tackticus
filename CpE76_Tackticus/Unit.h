//
//  Unit.h
//  CpE76_Tackticus
//
//  Created by Administrator on 9/21/13.
//  Copyright (c) 2013 Line of Awesome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Unit : NSObject

@property NSString *type;
@property float baseHP;
@property float baseMP;
@property int baseDamage;
@property int skillDamage;
@property int moveRange;
@property int attackRange;
@property int skillRange;
@property int skillCost;

- (id)initType:(NSString *)t hp:(float)bh mp:(float)bm bDamage:(int)bd sDamage:(int)sd moveRange:(int)mr atkRange:(int)ar skillRange:(int)sr skillCost:(int)sc;
@end
