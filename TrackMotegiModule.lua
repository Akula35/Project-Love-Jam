local TrackMotegiModule = {}

function TrackMotegiModule.loadMap()
	mapFile = "Motegi (JAP).png"
	return mapFile
end

function TrackMotegiModule.loadTrack()
	courseGrid = { } -- grid of spaces for bike on course
		courseGrid[1] = {}
			courseGrid[1][1] = {}
				courseGrid[1][1][1] = 1435
				courseGrid[1][1][2] = 705
				courseGrid[1][1][3] = 210
			courseGrid[1][2] = {}
				courseGrid[1][2][1] = 525
				courseGrid[1][2][2] = 860
				courseGrid[1][2][3] = 300
			courseGrid[1][3] = {}
				courseGrid[1][3][1] = 1150
				courseGrid[1][3][2] = 540
				courseGrid[1][3][3] = 0
	return courseGrid
end

return TrackMotegiModule