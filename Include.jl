# setup paths -
const _ROOT = @__DIR__
const _PATH_TO_SRC = joinpath(_ROOT, "src")
const _PATH_TO_DATA = joinpath(_ROOT, "data")
const _PATH_TO_MY_IMAGES = joinpath(_ROOT, "myimages")
const _PATH_TO_TEST_IMAGES = joinpath(_ROOT, "mytestimages")

# check: do we have the required packahes loaded??
using Pkg
Pkg.activate("."); Pkg.resolve(); Pkg.instantiate(); Pkg.update();

# load external packages -
using LinearAlgebra; 
using Test;
using Images;
using ImageIO;
using ImageInTerminal;
using FileIO;

# load my codes -
include(joinpath(_PATH_TO_SRC, "Types.jl"));
include(joinpath(_PATH_TO_SRC, "Factory.jl"));
include(joinpath(_PATH_TO_SRC, "Files.jl"));
include(joinpath(_PATH_TO_SRC, "Compute.jl"));
include(joinpath(_PATH_TO_SRC, "Solvers.jl"));
