function isPrime(n)
    if n == 1
        return(false)
    elseif n == 2
        return(true)
    else
        for i = 2:(n ^ (0.5)) + 1
            if n % i == 0
                return(false)
            end
        end
        return(true)
    end
end

function prime_factors(n)
    count = 0
    final = [1]
    k = n
    if n == 1
        return([])
    end
    while k != 1
        count += 1
        if k % count == 0 && isPrime(count) == true
            k = k/count
            final = [final; [count]]
            count = 0
        end


    end
    return(final[2:end])
end
