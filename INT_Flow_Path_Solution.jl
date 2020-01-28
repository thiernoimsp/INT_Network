function extractTour(sol)
path=Dict()
for f in F
    # Start at the origin of the flow S[f]. 
    tour = [S[f]]  
    cur_device = S[f]
    
    while true
        # Look for first edge out of current device. 
        for j in vertices(mg)
if (cur_device,j) in links || (j,cur_device) in links
            if sol[(cur_device,j),f] >= 1 - 1e-6 || sol[(j,cur_device),f] >= 1 - 1e-6
                push!(tour, j)
                
                # Never use this edge again.
if (sol[(cur_device,j),f] >= 1 - 1e-6)  
                sol[(cur_device, j),f] = 0.0 
elseif (sol[(j,cur_device),f] >= 1 - 1e-6)
                sol[(j, cur_device),f] = 0.0
else
println("C'est fouti")
end
                
                # Move to next device. 
                cur_device = j
                break
            end
end
        end
        
        # If reached the destination of the flow E[f], stop: feaseble path found! 
        if cur_device == E[f]
            break
        end
    end
println("Flow ",f ," ---> ",tour)
end
path

end
