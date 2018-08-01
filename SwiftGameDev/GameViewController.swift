//
//  GameViewController.swift
//  SwiftGameDev
//
//  Created by pegasus on 2018/07/30.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import Extensions

class GameViewController: UIViewController {
    
    // MARK: - Outlets
    
    var scene: SCNScene!
    var sceneView: SCNView!
    
    // MARK: - Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSceneView()
    }
    
    func setupSceneView() {
        
        // scene
        let scene = SCNScene(named: "art.scnassets/hero.dae")!
        scene.setup()
        
        // scene view
        sceneView = view as! SCNView
        
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        sceneView.showsStatistics = true
        sceneView.backgroundColor = UIColor.black
        
        // tap recognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        sceneView.add(tap)
    }
    
    @objc
    func onTap(_ tap: UIGestureRecognizer) {
        
        // check what nodes are tapped
        let p = tap.location(in: sceneView)
        let hitResults = sceneView.hitTest(p, options: [:])
        
        // check that we clicked on at least one object
        guard hitResults.count > 0 else { return }
        
        // retrieved the first clicked object's material
        let material = hitResults[0].node.geometry!.firstMaterial!
        
        // animate material (0.5 sec red flash)
        run({
            // emit red light
            material.emission.contents = UIColor.red
        }, completion: {
            // after 0.5 sec, turn off emission
            run({ material.emission.contents = UIColor.black }, duration: 0.5)
        }, duration: 0.5)
    }
    
    // MARK: - Controller Settings
    
    override var shouldAutorotate: Bool { return true }
    override var prefersStatusBarHidden: Bool { return true }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIDevice.current.userInterfaceIdiom == .phone ? .allButUpsideDown : .all
    }
    

}// end: GameViewController
