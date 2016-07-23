let findNextScene = {
			// Load scene info if next_scene time
			if(next_scene > current_scene)
			{
				say("\n Loading scene...")
				// Switch next_scene, loading data into scene_info
				switch(next_scene) {
					
				// scene 0
				case 0:    
					say("0 set")
					scene_info = [
						
						// clip 0
						0: {
							say("clip 0 activated")
							setStage(1, 0)
						}
					]
					
				// scene 1
				case 1:
					
					say("1 set")
					
					scene_info = [
						
						// clip 0
						0: {
							say("s1 c0 playing")
							setClip(1)						
						},
						
						// clip 1
						1: {
							setClip(0)
							say("s1 c1 playing. ((nc = \(next_clip)))")
							debugged += 1
							
						}
						
					]
					
					
				// scene error
				default: say("ERROR: no scene")	
					
				}
				
				// For next entry 
				// ONLY THING SO FAR IS LOADING INFO
				// NO UNWRAPPING
				GD.scn_current_scene = next_scene
				GD.scn_scene_info 	=  scene_info
				
			}
			else 
			{
				print("\n Scene isn't over yet..")
			}
			say("leaving fns: ((nc = \(next_clip)))")
			
		}


// find the right scene
		print("b4 fns: ((nc = \(next_clip)))")
		findNextScene()
				print("after fns: ((nc = \(next_clip)))")