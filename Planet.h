//
//  Planet.h
//  RadialGravity
//
//  Created by Derrick Liu on 4/18/14.
//  Copyright (c) 2014 TheSneakyNarwhal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Planet : SKSpriteNode
{
    float gravityRange;
    float gravityMultiplier;
}
-(void) setGravityRange:(float) range;
-(float) getGravityRange;
-(void) setGravityMultiplier:(float) mult;
-(void) doGravityUpdate: (NSArray*) children;
@end
