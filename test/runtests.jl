using Pkg.TOML
using Test

cd(joinpath(@__DIR__, ".."))

contents = readdir()
for c in contents
    if isdir(c)
        print("Entering $c\n")
        cd(c)
        files = readdir(".")
        for f in files
            if splitext(f)[2] == ".toml"
                print("parsing $f\n")
                @test_nowarn TOML.parsefile(f)
            end
        end
        cd("..")
    end
end
