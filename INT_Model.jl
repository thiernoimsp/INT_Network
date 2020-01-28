# the model
model = JuMP.Model(with_optimizer(CPLEX.Optimizer))
MOI.set(model, MOI.RawParameter("CPX_PARAM_TILIM"), 30)


#variable 
  @variable(model, s_b[m in M, d in vertices(mg), P in idxs_Rs[m]], Bin)
  @variable(model, t_b[m in M, P in idxs_Rt[m]], Bin)
  @variable(model, x[(i,j) in links, f in F; i!=j], Bin)
  @variable(model, y[d in vertices(mg), v in V, f in F], Bin)
  @variable(model, s[m in M, d in vertices(mg), P in Rs[m]] >= 0)
  @variable(model, t[m in M, P in Rt[m]] >= 0)
  @variable(model, ttt[i in vertices(mg), f in F] >= 0)


#objective
@objective(model, Max, sum(s_b[m,d,P]  for m in M, d in vertices(mg), P in idxs_Rs[m]) + sum(t_b[m,P] for m in M, P in idxs_Rt[m]))

#constraints
#starting of the flow
for f in F
@constraint(model, sum(x[(S[f],j),f] for j in neighborhood(mg, S[f], 1) if S[f]!=j) + sum(x[(j,S[f]),f] for j in neighborhood(mg, S[f], 1) if j!=S[f]) == 1)
end

#ending of the flow
for f in F
@constraint(model, sum(x[(i,E[f]),f] for i in neighborhood(mg, E[f],1) if i!=E[f]) + sum(x[(E[f],i),f] for i in neighborhood(mg, E[f],1) if E[f]!=i) == 1)
end

#flow conservation
for f in F, i in vertices(mg)
if (i!= S[f] && i!=E[f])
@constraint(model, sum(x[(j,i),f] for j in neighborhood(mg, i, 1) if i!=j) - sum(x[(i,j),f] for j in neighborhood(mg, i, 1) if j!=i) == 0)
end
end

#removing subtour of size two
for (i,j) in links, f in F
@constraint(model, x[(i,j),f] + x[(j,i),f]  <= 1)
end

# single telemetry is collected by a single flow
for d in vertices(mg), v in get_prop(mg, d, :Items),f in F
@constraint(model, y[d,v,f] <= sum(x[(i,d),f] for i in neighborhood(mg, d, 1) if i!=d))
end

#exch flow does not excced it capacity
for f in F
@constraint(model, sum(y[d,v,f]*Size[v]  for d in vertices(mg), v in get_prop(mg, d, :Items)) <= Kf[f] )
end

for m in M, P in Rs[m], d in vertices(mg)
@constraint(model, s[m,d,P] == sum(y[d,v,f] for v in P, f in F))
end

for m in M, P in Rt[m] 
if HH[P] > TT[P]
@constraint(model, t[m,P] == sum(y[d,v,f] for d in vertices(mg), v in P, f in F))
end
end

for m in M, P in Rs[m], d in vertices(mg), P1 in idxs_Rs[m]
@constraint(model, s_b[m,d,P1] <= s[m,d,P]/length(P))
end

for m in M, P in Rt[m], P2 in idxs_Rt[m]
@constraint(model, t_b[m,P2] <= t[m,P]/length(P))
end

#writing the model to LP file
lp_model = MathOptFormat.LP.Model()
MOI.copy_to(lp_model, backend(model))
MOI.write_to_file(lp_model, "INT_Model.lp")

@time  JuMP.optimize!(model)

@show termination_status(model)
@show primal_status(model)
