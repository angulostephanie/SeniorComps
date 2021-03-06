//
//  Projectile.swift
//  OxyAR
//
//  Created by Stephanie Angulo on 3/5/19.
//  Copyright © 2019 Stephanie Angulo. All rights reserved.
//

import Foundation

import SceneKit

class Projectile: SCNNode {
    override init () {
        super.init()
        let geometry = SCNSphere(radius: 0.03)
        let shape = SCNPhysicsShape(geometry: geometry, options: nil)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.lightGray
        material.isDoubleSided = true
        
        self.geometry = geometry
        self.geometry?.materials = [material]
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
        self.physicsBody?.isAffectedByGravity = false
        self.physicsBody?.categoryBitMask = CollisionCategory.target.rawValue
        self.physicsBody?.contactTestBitMask = CollisionCategory.projectile.rawValue
        self.name = "Projectile"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
