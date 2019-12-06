#canonical data version 1.1.0
println(prime_factors(1))
if prime_factors(1) == []
    println("correct")
else
    println("wrong")
end

println(prime_factors(2))
if prime_factors(2) == [2]
    println("correct")
else
    println("wrong")
end

println(prime_factors(9))
if prime_factors(9) == [3, 3]
    println("correct")
else
    println("wrong")
end

println(prime_factors(8))
if prime_factors(8) == [2, 2, 2]
    println("correct")
else
    println("wrong")
end

println(prime_factors(12))
if prime_factors(12) == [2, 2, 3]
    println("correct")
else
    println("wrong")
end

println(prime_factors(901255))
if prime_factors(901255) == [5, 17, 23, 461]
    println("correct")
else
    println("wrong")
end

println(prime_factors(93819012551))
if prime_factors(93819012551) == [11, 9539, 894119]
    println("correct")
else
    println("wrong")
end
