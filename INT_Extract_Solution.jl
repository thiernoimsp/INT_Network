#Spatial dependencies
println("Spatial dependencies :")
Spatial_Dependencies = Vector{NTuple{3,Int64}}()
for m in M
   for d in vertices(mg)
      for P in idxs_Rs[m]
         if (JuMP.value(s_b[m, d, P]) == 1)
            println("$(m) $(d) $(P) = $(JuMP.value(s_b[m, d, P]))")
            push!(Spatial_Dependencies, (m, d, P))
         end
      end
   end
end

# saving the spatial dependencies into a csv file
CSV.write(
   "Spatial_Dependencies.csv",
   DataFrame(Spatial_Dependencies),
   header = ["m", "d", "P"],
)

#Temporal dependencies
println("Temporal dependencies :")
Temporal_Dependencies = Vector{NTuple{2,Int64}}()
for m in M
   for P in idxs_Rt[m]
      if (JuMP.value(t_b[m, P]) == 1)
         println("$(m) $(P) = $(JuMP.value(t_b[m, P]))")
         push!(Temporal_Dependencies, (m, P))
      end
   end
end

# saving the temporal dependencies into a csv file
CSV.write(
   "Temporal_Dependencies.csv",
   DataFrame(Temporal_Dependencies),
   header = ["m", "P"],
)


#Collected telemetry items
println("Items:")
Items_12 = Vector{NTuple{3,Int64}}()
for d in vertices(mg)
   for v in V
      for f in F
         if (JuMP.value(y[d, v, f]) == 1)
            println("  $(d) $(v) $(f) = $(JuMP.value(y[d, v, f]))")
            push!(Items_12, (d, v, f))
         end
      end
   end
end

CSV.write(
   "Items_12.csv",
   DataFrame(Items_12),
   header = ["Device", "Item", "flow"],
)

#Path of the flows
println("Path of the flows:")
Flows = Vector{NTuple{3,Int64}}()
for f in F
   for (i, j) in links
      if (JuMP.value(x[(i, j), f]) == 1)
         println("  $(i) $(j) $(f) = $(JuMP.value(x[(i,j), f]))")
         push!(Flows, (i, j, f))
      end
   end
end

#saving the output of flows into a csv file
CSV.write(
   "Flows.csv",
   DataFrame(Flows),
   writeheader = false,
)
