//
//  Planet.m
//  RadialGravity
//
//  Created by Derrick Liu on 4/18/14.
//  Copyright (c) 2014 TheSneakyNarwhal. All rights reserved.
//

#import "Planet.h"

@implementation Planet

-(void) setGravityRange:(float) range
{
    gravityRange = range;
}

-(float) getGravityRange
{
    return gravityRange;
}

-(void) setGravityMultiplier:(float)mult
{
    gravityMultiplier = mult;
}

-(void) doGravityUpdate:(NSArray*) children
{
    for (SKSpriteNode *child in children)
    {
        if (child.physicsBody.affectedByGravity && sqrtf(powf((self.position.x - child.position.x), 2) + powf((self.position.y - child.position.y), 2)) <= gravityRange)
        {
            [child.physicsBody applyForce: CGVectorMake((self.position.x - child.position.x) * gravityMultiplier, (self.position.y - child.position.y) * gravityMultiplier)];
        }
    }
}

@end
