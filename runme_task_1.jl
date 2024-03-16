# include -
include("Include.jl")

# setup some helper functions -
"""
    _my_system_setup()

This function sets up the system of equations for the toy problem. 

### Returns
- `A::Array{Float64,2}`: The unknown system matrix. For the toy problem, this is a 7 x 7 matrix.
- `B::Array{Float64,2}`: The known system matrix (the columns that correspond to measured species). For the toy problem, this is a 7 x 17 matrix.
- `ṅ::Array{Float64,1}`: The measurement vector. For the toy problem, this is a 17 x 1 vector.
"""
function _my_system_setup()::Tuple{Array{Float64,2}, Array{Float64,2}, Array{Float64,1}}

    # initialize -
    path_to_reaction_file = joinpath(_PATH_TO_DATA, "Toy.net");
    measured_columns = [4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]; # we have measured these columns
    unkown_columns = setdiff(1:24, measured_columns); # we want to estimate these columns

    # load the reaction file -
    R = readreactionfile(path_to_reaction_file, comment="//", delim=',', expand = false);

    # build the stoichiometric matrix -
    S = build(MyStoichiometricMatrixModel, R);

    # setup the measurement matrix -
    number_of_species = length(S.species);
    
    # build the system matrix -
    d = [1,1,-1]
    A_all_columns = [S.matrix d[1]*diagm(ones(number_of_species)) d[2]*diagm(ones(number_of_species)) d[3]*diagm(ones(number_of_species))];

    # split system matrix -
    A = A_all_columns[:,unkown_columns];
    B = A_all_columns[:,measured_columns];

     # setup the measurement vector -
     ṅ = [
    
        # --- stream 1 ---
        10.0 ; # 1 s1 A1
        0.0 ; # 2 s1 A2
        0.0 ; # 3 s1 B
        0.0 ; # 4 s1 C
        0.0 ; # 5 s1 P
        0.0 ; # 6 s1 x
        4.0 ; # 7 s1 y

        # --- stream 2 ---
        0.0 ; # 8 s2 A1
        6.0 ; # 9 s2 A2
        0.0 ; # 10 s2 B
        0.0 ; # 11 s2 C
        0.0 ; # 12 s2 P
        0.0 ; # 13 s2 x
        0.0 ; # 14 s2 y

        # --- stream 3 ---
        0.0 ; # 15 s3 A1 !!! You will change this value in the runme script !!!
        0.0 ; # 16 s3 A2 !!! You will change this value in the runme script !!!
        0.0 ; # 17 s3 B
    ];


    # return -
    return (A, B, ṅ)
end


"""
    runme()

The `runme` function is the main driver for the toy problem. It will setup the system of equations and solve for the feasible region.

### Returns
- `frame::Array{Int64,2}`: The feasible region. This is a 1401 x 1201 matrix. Values of 1 indicate a feasible solution, values of 0 indicate an infeasible solution.
"""
function runme()

    # initialize -
    (A, B, ṅ) = _my_system_setup();

    # TODO: setup two arrays of values for A1 and A2 measurements -
    A1 = nothing;
    A2 = nothing;

    # TODO: initialize the frame, this will hold the results.
    # it should have A1 as the rows and A2 as the columns.
    frame = nothing;

    # TODO: main loop. You will loop over A1 and A2 and solve the system of equations.
    # If the solution is feasible, then the frame should be 1, otherwise 0.
    throw(ArgumentError("You need to implement the main loop!"));

    # return -
    return frame;
end

# execute the runme script
frame = runme();

# TODO: uncomment the following line to save the frame image to disk -
# save(File{format"JPEG"}(joinpath(_PATH_TO_MY_IMAGES, "Test.jpeg")), Gray.(frame));