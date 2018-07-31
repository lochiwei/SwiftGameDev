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
            at: [0, 0.5, 0], color: .green
        )
        
        // camera
        _ = rootNode.newCameraNode(at: [0, 0, 15])
        
        // lights
        _ = rootNode.newLightNode(.omni, at: [0, 15, 15])
        let ambientLightNode = rootNode.newLightNode(.ambient)
        ambientLightNode.light?.color = UIColor.darkGray
        
    }// end: setup()
    
}// end: SCNNode extension

// my extension
extension SCNNode {
    
    // add camera to node
    // usage: node.newCameraNode(at: position)
    func newCameraNode(at position: SCNVector3? = nil) -> SCNNode {
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        if let p = position { cameraNode.position = p }
        add(cameraNode)
        
        return cameraNode
    }
    
    // MARK: - Lights
    // --------------
    
    func newLightNode(_ type: SCNLight.LightType, at position:SCNVector3? = nil) -> SCNNode {

        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = type
        if let p = position { lightNode.position = p }
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        add(lightNode)
        
        return lightNode
    }
    
}// end: SCNNode extension
