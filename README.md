SpriteKit-RadialGravity
=======================

Simple planet gravity in Spritekit

![alt tag](https://raw.githubusercontent.com/TheSneakyNarwhal/SpriteKit-RadialGravity/master/pic.png)

This adds a easy way to implement planet gravity in your game


How to use it
=======================

1. Import the Planet.h class to the scene.

2. Disable world gravity.

3. Set a spritenode with a the circular PhysicsBody as you normally would.

3. Set the gravity range of the planet.

4. Set the gravity strength (start with 0.2f).

5. Add the planet gravity update to the update method.

    -(id)initWithSize:(CGSize)size {    
        if (self = [super initWithSize:size])
        {
            [YMCPhysicsDebugger init];
            
            [self setPhysicsBody: [SKPhysicsBody bodyWithEdgeLoopFromRect: self.frame]];
            [self.physicsWorld setGravity: CGVectorMake( 0, 0)];
            
            planet = [Planet spriteNodeWithImageNamed:@"planet.png"];
            [planet setSize: CGSizeMake(100, 100)];
            [planet setPosition: CGPointMake( self.size.width/2, self.size.height/2)];
            [planet setPhysicsBody: [SKPhysicsBody bodyWithCircleOfRadius: 50]];
            [planet.physicsBody setDynamic: false];
            [planet.physicsBody setCategoryBitMask: planetCategory];
            [planet.physicsBody setCollisionBitMask: asteroidCategory];
            [planet setGravityRange: 120];
            [planet setGravityMultiplier: 0.1f];
            [self addChild: planet];
            
            SKSpriteNode *planetRange = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(10, 10)];
            [planetRange setPosition: CGPointMake( self.size.width/2, self.size.height/2)];
            [planetRange setPhysicsBody: [SKPhysicsBody bodyWithCircleOfRadius: [planet getGravityRange]]];
            [planetRange.physicsBody setDynamic: false];
            [planetRange.physicsBody setCategoryBitMask: voidCategory];
            [self addChild: planetRange];
            
            [self drawPhysicsBodies];
        }
        return self;
    }



