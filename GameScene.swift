
//
//  GameScene.swift
//  g2
//
//  Created by Dude Guy on 8/6/16.
//  Copyright (c) 2016 Dude Guy. All rights reserved.
//

import SpriteKit
extension Array {
	subscript(safe index: Int) -> Element? {
		return index >= 0 && index < count ? self[index] : nil
	}
}
////// more array aggro
/// (akira_positions?[0])!
///

var akira = StoryToon()


//<#MARK: - GameScene{}#>
class GameScene: SKScene, UITextFieldDelegate {



	// labels
	var
	myLabel 	=	 SKLabelNode(fontNamed: "Chalkduster"),
	saver	 	:	 SKLabelNode?,
	l_counter 	:	 SKLabelNode?,
	l_counter_counter = 0
	;/// />

	// more globes
	var
	akira_actions = [SKAction.moveTo(CGPoint(x: 0, y: 0), duration: 0.5)],
	akira_action_array_index = 0,
	akira_positions = [CGPoint(x: 2, y: 1), CGPoint(x:1, y:2)],
	akira_positions_index = 0

	// branched <
	var textField2:		UITextField!
	var thisView	:	SKView!
	;/// branched />


	// DELETEME:
	var nextMoveIsRight = true

	enum vector { case
		right, left
	}




	//<#MARK: - didMovetoView()#>
	override func didMoveToView(view: SKView) {


		akira.addNode(self.childNodeWithName("Akira")!)

		myLabel.text 		= "Hello, World!"
		myLabel.fontSize 	= 45
		myLabel.position 	=
			CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))

		self.addChild(myLabel)


		player	= self.childNodeWithName("plaar") 	as? SKSpriteNode


		textField2 		= UITextField(frame: CGRectMake(0, 0, frame.width, 100))

		view.addSubview(textField2)
		textField2.delegate = self
		textField2.adjustsFontSizeToFitWidth = true
		textField2.backgroundColor = UIColor.blueColor()
		self.view!.addSubview(textField2)

		thisView = view


		saver 		= self.childNodeWithName("saverd")			as? SKLabelNode
		l_counter 	= self.childNodeWithName("counter")			as? SKLabelNode


	};///didMoveToView()/>



	//<#MARK: - touchesBegan()#>
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

		// Mainloop
		looper: for touch in touches
		{
			let TPOINT = touch.locationInNode(self)
			var sc = step_counter

			player!.removeAllActions()
			akira.node!.removeAllActions()
			tloc = TPOINT




			guard tloc!.y >= 100
				else {	myLabel.text = "you clicked ET"; continue }

			// always happens unless you touched ET (see above guard)
			let action	= SKAction.moveTo(TPOINT, duration: 2)
			player!.runAction(action)


			// grabPostionOfAllNodes() + seeIfTheyMatchTouch():
			guard false == akira.node!.frame.contains(TPOINT)
			else {
					akira.node!.color == GREEN ?
						akira.node!.color = RED
						:
						(akira.node!.color = GREEN)

					continue
			}


			// don't move him if you click Saver or if He's Red
			guard (akira.node!.color != GREEN
				&&
				saver!.frame.contains(TPOINT) == true
				&&
				l_counter!.frame.contains(TPOINT) == true)
				else {

					let action	= SKAction.moveTo(tloc!, duration: 0.5)
					akira.act_list.insert(action, atIndex: sc)
					akira.node!.runAction(akira.act_list[sc])

					continue
			}
			

			guard false == clicked(saver)
				else {

					step_counter += 1

					akira.node!.color = RED // so he wont move

					myLabel.text = "saved clip"

					continue
			}




			guard false == clicked(l_counter)
				else {

					akira.node!.color = .redColor()
					akira.node!.position = akira.start_pos

					myLabel.text = "replaying"
					sc -= 1
					akira.node!.runAction(akira.act_list[sc])
					// TODO: PUT A FILLER FOR EACH STEP SO NO NIL
					continue
			}

			defer {	myLabel.text! += "TESTER" }

		}; /// MainLoop />

	}; ///touchesBegan()/>



	//<#MARK: - update()#>
	override func update(currentTime: CFTimeInterval) {
		l_counter!.text = "step count: \(step_counter)"
	};///update()/>





	//<#MARK: - RANDOM FUNCS#>
	func moveSprite( name :SKSpriteNode? = player, to_the :vector)	{
		let action:SKAction = {
			switch(to_the) {
			case .left:
				return SKAction.moveBy(CGVector(dx: -50, dy: 0), duration: 0.25)
			case .right:
				return SKAction.moveBy(CGVector(dx:  50, dy: 0), duration: 0.25)
			}; // switch()/>
		}()

		name!.runAction(action)
	}; // moveSprite()/>

	func updateCamera() {
		let ploc = player!.position
		let act  = SKAction.moveTo(ploc, duration: 0.0)

		cam!.runAction(act)
	}; // updateCamera()/>

	func clicked(node: SKNode?) -> Bool
	{
		if(node!.frame.contains(tloc!)){
			return true
		}
		else {
			return false
		}
	}
};//////// GameSprite/>


