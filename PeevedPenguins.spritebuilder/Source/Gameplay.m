//
//  Gameplay.m
//  PeevedPenguins
//
//  Created by andrew on 04/07/2014.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay {

//this is the implementation of the firing mechanism
CCPhysicsNode *_physicsNode;
CCNode *_catapultArm;
}

//is called when CCB file has cimpleted loading
-(void)didLoadFromCCB {
    // tell this scene to accept touches
    self.userInteractionEnabled = true;
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    [self launchPenguin];
}

-(void)launchPenguin {
    //loads the   Penguin.ccb that was setup in spritebuilder
    CCNode *penguin = [CCBReader load:@"Penguin"];
    //position the penguin at the bowl of the catapult
    penguin.position = ccpAdd(_catapultArm.position, ccp(16, 50));
    
    // add the penguin to the physicsNode of this scene (because it has physics enabled)
    [_physicsNode addChild:penguin];
    
    // manually create & apply a force  to launch the penguin
    CGPoint launchDirection = ccp(1, 0);
    CGPoint force = ccpMult(launchDirection, 8000);
    [penguin.physicsBody applyForce:force ];
}


@end
