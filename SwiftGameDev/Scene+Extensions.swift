//
//  Scene+Extensions.swift
//  SwiftGameDev
//
//  Created by pegasus on 2018/07/31.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import SceneKit
import Extensions

// scene
extension SCNScene {
    
    func setup() {
        
        // nodes
        _ = rootNode.newShape(
            SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0),
            at: [0, 0.5, 0], diffuse: UIColor.red
        )
        
        // camera
        _ = rootNode.newCameraNode(at: [10, 15, 30], lookAt: rootNode)
        
        // lights
        _ = rootNode.newLightNode(.omni, at: [0, 15, 15])
        _ = rootNode.newLightNode(.ambient, color: UIColor.darkGray)
        
        // floor
        _ = rootNode.newFloorNode(diffuse: "Floor")
        
        // primitive nodes
        _ = rootNode.newPyramidNode(3, 6, 3, at: [30, 0, -40], diffuse: UIColor.blue)
        _ = rootNode.newSphereNode(6, at: [35, 6, -60], diffuse: UIColor.red)
        _ = rootNode.newBoxNode(3,3,3, at: [20, 1.5, -20], diffuse: UIColor.brown)
        _ = rootNode.newTubeNode(r: 1, R: 1.5, h: 2, at: [-10, 0.75, -75], diffuse: UIColor.yellow)
        _ = rootNode.newCylinderNode(r:3, h:3, at: [0,4,-25], diffuse: UIColor.green)
        _ = rootNode.newTorusNode(R: 7, r: 2, at: [75, 1, -80], diffuse: UIColor.orange)
        
    }// end: setup()
    
}// end: SCNNode extension


// my extension
extension SCNNode {
    
    
    
}// end: SCNNode extension
