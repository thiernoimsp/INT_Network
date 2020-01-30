# in this file I'm using the instance from prof Marcelo
using JuMP,
      GLPK,
      CPLEX,
      CSV,
      DataFrames,
      Combinatorics,
      MathOptFormat,
      LightGraphs,
      MetaGraphs,
      Test,
      GraphPlot

function build_and_run_model(; verbose = true)

      include("INT_Data_Loading.jl")
      include("INT_Model.jl")
      include("INT_Extract_Solution.jl")
      include("INT_Flow_Path_Solution.jl")

end

build_and_run_model(verbose = false)
