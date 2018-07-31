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
        _ = rootNode.newShape(SCNFloor(), diffuse: "floor")
        
    }// end: setup()
    
}// end: SCNNode extension

// my extension
extension SCNNode {
    
    // MARK: - Camera
    // --------------
    
    // add camera to node
    // usage: let cameraNode = node.newCameraNode(at: position)
    func newCameraNode(at position: SCNVector3? = nil, lookAt target: SCNNode? = nil) -> SCNNode {
        
        // camera
        let camera = SCNCamera()
        
        // camera node
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        if let p = position { cameraNode.position = p }
        if let t = target { cameraNode.look(at: t) }
        
        // graph tree
        add(cameraNode)
        
        return cameraNode
    }
    
    // MARK: - Lights
    // --------------
    
    // usage: let lightNode = node.newLightNode(.omni, at: position)
    func newLightNode(_ type: SCNLight.LightType, color: Any? = nil, at position:SCNVector3? = nil) -> SCNNode {

        // light
        let light = SCNLight()
        light.type = type
        if let c = color { light.color = c }
        
        // light node
        let lightNode = SCNNode()
        lightNode.light = light
        if let p = position { lightNode.position = p }
        
        // graph tree
        add(lightNode)
        
        return lightNode
    }
    
}// end: SCNNode extension
