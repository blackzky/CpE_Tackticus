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
@property int baseHP;
@property int baseMP;
@property int baseDamage;
@property int skillDamage;
@property int moveRange;
@property int attackRange;
@property int skillRange;

- (id)initType:(NSString *)t hp:(int)bh mp:(int)bm bDamage:(int)bd sDamage:(int)sd moveRange:(int)mr atkRange:(int)ar skillRange:(int)sr;
@end
