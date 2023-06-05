--A simple way for gliding physics
local wing = -- Put a basepart here

local strength = 1 -- Determines the strength of the lift force, basically. I reccomend 10+ for player controllers

local f = wing.Attachment.VectorForce2 --Important to note that the part being manipulated has an attachment with a vectorforce as a child

game:GetService("RunService").Heartbeat:Connect(function(dt) -- Loop
	if wing.Velocity.Magnitude > 0 then
		local aoa = wing.CFrame.UpVector:Dot(wing.AssemblyLinearVelocity.Unit) -- The angle at which the wing is pointing compared to it's velocity
		f.Force = -wing.CFrame.UpVector*wing.AssemblyMass*workspace.Gravity*aoa*strength*0.99 -- Applying 99% of the force so it never perfectly cancels out part's gravity
	end
end)
