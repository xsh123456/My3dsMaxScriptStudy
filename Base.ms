macroScript MyCustomSelectType
category: "MyScripts"
tooltip: "MyCustomTools"


(
	
	fn SplineSubObjectLevel =
	(
		macros.run "Octopus" "LineSubSelection"
	
	)
	
		fn PolySubObjectLevel =
	(	
		 macros.run "Octopus" "PolySubSelection"
	)


	(
		-- 获取选择的第一个物体
		max modify mode
		selectedObject =#()
		--selectedObject = selection[1]
		selectedObject = modPanel.getCurrentObject() 
		 
		
		case classof selectedObject of
		(
			Editable_Poly:PolySubObjectLevel()
			Editable_mesh:PolySubObjectLevel()
			Edit_Mesh:PolySubObjectLevel()
			Edit_Poly:PolySubObjectLevel()
			Edit_Spline:SplineSubObjectLevel()
			SplineShape:SplineSubObjectLevel()
		)
	
	)
	
)

