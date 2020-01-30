# constructing the graph from outside data

network_data_file = "Data_Test.csv"
network_data = CSV.read(network_data_file; header=false)
df = network_data[1:2]

# saving data in form we know
src_node = round.(Int64, df[:,1])
dst_node = round.(Int64, df[:,2])

no_node = 50
no_link = length(df[:,1])


nodes = 1:no_node
g = SimpleGraph(no_node)
for i = 1:no_link
  add_edge!(g, src_node[i], dst_node[i])
end

# links of the network
links = Vector{NTuple{2,Int64}}()
for i = 1:no_link
#if (src_node[i] < dst_node[i])
  push!(links, (src_node[i], dst_node[i]))
#end
end

#creating a metagraph from g
mg = MetaGraph(g)

D=1:50
#set telemetry items embeded by eacg device
set_props!(mg, 1, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 2, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 3, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 4, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 5, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 6, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 7, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 8, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 9, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 10, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 11, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 12, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 13, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 14, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 15, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 16, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 17, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 18, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 19, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 20, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 21, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 22, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 23, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 24, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 25, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 26, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 27, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 28, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 29, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 30, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 31, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 32, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 33, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 34, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 35, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 36, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 37, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 38, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 39, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 40, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 41, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 42, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 43, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 44, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 45, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 46, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 47, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 48, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 49, Dict(:Items=>[1 2 3 4 5 6 7 8]))
set_props!(mg, 50, Dict(:Items=>[1 2 3 4 5 6 7 8]))

########################################################################################

# data file for the flow capacity and flow origin and destination
network_data_file2 = "Data_Test_Check12.csv"
network_data2 = CSV.read(network_data_file2; header=false)
df2 = network_data2[1:3]

#origine and destination and capacity of the flow
S = round.(Int64, df2[:,1])
E = round.(Int64, df2[:,2])
Kf = round.(Int64, df2[:,3])

###########################################################################################
F=1:10
#=
F=1:8

#S=[1 47 38 39 42]
#E=[8 29 39 9 26]
S=[1 8 21 42 43 35 4 18]
E=[3 32 27 31 7 8 13 27]

Kf = Dict(F[1] => 18, F[2] => 12, F[3] => 24, F[4] => 12, F[5] => 10, F[6] => 8, F[7] => 16, F[8] => 20)
#Kf = Dict(F[1] => 18, F[2] => 12, F[3] => 24, F[4] => 12, F[5] => 6)
=#
V=1:8
# size of telemetries
Size = Dict(V[1] => 2, V[2] => 2, V[3] => 2, V[4] => 2, V[5] => 2, V[6] => 2, V[7] => 2, V[8] => 2)


#set of Monitoring Applications
M = 1:4

  R = Dict(
#     1 => [1 2 3 4 5 6 7 8 9 10 11 12 13 14],
#     2 => [15 16 17 18 19 20]
    1 => [1 2],
    2 => [3 4],
    3 => [5 6],
    4 => [7 8]
  )




  #####################################################################################

  # Functional for the subset of a set

  function subsets(A::AbstractArray,r::Union{AbstractArray,Integer})
    o= Array{Array{eltype(A),1},1}(undef,0)
    if typeof(r)<:Integer
        r>length(A) && (r=[length(A)])
        r=[r...]
    elseif typeof(r)<:UnitRange
        r[end]>length(A) && (r=1:r[length(A)])
    else
        !issubset(r,1:length(A)) && (r=intersect(r,1:length(A)))
    end
    for n = r
        a=combinations(A,n)
        for i in a
            push!(o,i)
        end
    end
    return o
  end

  subsets(A::AbstractArray) = subsets(A,1:length(A))

  #####################################################################################

  PR=Dict()
  for m in M
    PR[m] = subsets(R[m])
  end

  # index for set Rs
  idxs_Rs = Dict()
for m in M
  idxs_Rs[m] = 1:length(PR[m])
  @show(idxs_Rs[m])
end


  #spatial dependency
  #Rs = Vector(undef, last(M))
  Rs = Dict()
for m in M
  Rs[m] = PR[m][idxs_Rs[m]]
end

  # index for set Rt
  idxs_Rt = Dict()
for m in M
  idxs_Rt[m] = 1:length(Rs[m])
  @show(idxs_Rt[m])
end

  #temporal dependency
  #Rt = Vector(undef, last(M))
  Rt = Dict()
for m in M
  Rt[m] = Rs[m][idxs_Rt[m]]
  #@show Rt[m]
end

  #function of the required deadline time
global  TT = Dict()
c = 1
for m in M, P in Rs[m]
  global c += 1
  TT[P] = c
end

  #function of the last time unit
global  HH = Dict()
c = 0
for m in M, P in Rt[m]
  global c += 1
  HH[P] = c
end
