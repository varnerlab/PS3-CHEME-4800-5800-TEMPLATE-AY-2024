# include -
include("include.jl") 

# ----------------------------------------------------------------------------------
# for more information on tests, see: https://docs.julialang.org/en/v1/stdlib/Test/
# ----------------------------------------------------------------------------------

# Testset - let's write some tests for all the facts that we know about the SVD -
@testset verbose = true "Test your feasible region" begin

    # load the images -
    my_image = load(joinpath(_PATH_TO_MY_IMAGES, "Test.jpeg")); # image we generated
    my_test_image = load(joinpath(_PATH_TO_TEST_IMAGES, "Solution.jpeg")); # correct image

    # is my image the correct size -
    @test size(my_image) == (1401,1201);
    @test typeof(my_image) == Matrix{Gray{N0f8}};
    @test maximum(my_image) == 1.0;
    @test minimum(my_image) == 0.0;

    # compare the images -
    @test my_image == my_test_image
end