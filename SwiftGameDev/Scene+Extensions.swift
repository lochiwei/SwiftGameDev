//
//  Scene+Extensions.swift
//  SwiftGameDev
//
//  Created by pegasus on 2018/07/31.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import SceneKit
import Extensions



// MARK: - SCNNode

extension SCNNode {
    
    // Subnodes
    // ----------------
    
    // earth node
    func newEarthNode(_ radius:CGFloat, at position:SCNVector3? = nil) -> SCNNode {
        let earthNode = newSphereNode(radius, at: position)
        let m = earthNode.geometry!.firstMaterial!
        m.diffuse.contents = #imageLiteral(resourceName: "earthDiffuse")
        m.specular.contents = #imageLiteral(resourceName: "earthSpecular")
        m.normal.contents = #imageLiteral(resourceName: "earthNormal")
        m.ambient.contents = #imageLiteral(resourceName: "earthAmbient")
        m.diffuse.mipFilter = .linear
        return earthNode
    }
    
    // box rock
    func newBoxRock(_ width:CGFloat, _ height:CGFloat, _ length:CGFloat, at position:SCNVector3? = nil) -> SCNNode  {
        
        // prepare materials
        let materials = (1...6).map { (i) -> SCNMaterial in
            let m = SCNMaterial()
            m.diffuse.contents = UIImage(named: "boxSide\(i)")
            return m
        }
        
        // new box node
        let node = newBoxNode(width, height, length, at: position)
        node.geometry?.materials = materials
        
        return node
    }
    

    
}// end: SCNNode extension


// MARK: - SCNScene

extension SCNScene {
    
    func setup() {
        
        // camera
        _ = rootNode.newCameraNode(at: [10, 15, 30], lookAt: rootNode)
        
        // lights
        _ = rootNode.newLightNode(.omni, at: [0, 15, 15])
        _ = rootNode.newLightNode(.ambient, color: UIColor.darkGray)
        spotlight()
        
        // nodes
        _ = rootNode.newBoxNode(1, 1, 1, at: [0, 0.5, 0], diffuse: UIColor.red)
        _ = rootNode.newFloorNode(diffuse: "Floor")
        _ = rootNode.newPyramidNode(3, 6, 3, at: [30, 0, -40], diffuse: UIColor.blue)
        _ = rootNode.newSphereNode(6, at: [35, 6, -60], diffuse: UIColor.red)
        _ = rootNode.newBoxNode(3,3,3, at: [20, 1.5, -20], diffuse: UIColor.brown)
        _ = rootNode.newTubeNode(r: 1, R: 1.5, h: 2, at: [-10, 0.75, -75], diffuse: UIColor.yellow)
        _ = rootNode.newCylinderNode(r:3, h:3, at: [0,4,-25], diffuse: UIColor.green)
        _ = rootNode.newTorusNode(R: 7, r: 2, at: [75, 1, -80], diffuse: UIColor.orange)
        
        // nodes with materials
        _ = rootNode.newEarthNode(10, at: [-20, 10, -30])
        _ = rootNode.newBoxRock(10, 10, 10, at: [-20, 10, 0])
        
    }// end: setup()
    
    func spotlight() {
        
        let node = rootNode.newLightNode(
            .spot, color: UIColor.darkGray,
            at: [10, 50, 30], lookAt: rootNode
        )
        
        let spotlight = node.light!
        spotlight.castsShadow = true
        spotlight.spotInnerAngle = 0 // degrees
        spotlight.spotOuterAngle = 50
        spotlight.zNear = 50
        spotlight.zFar = 500
    }
    
}// end: SCNNode extension
