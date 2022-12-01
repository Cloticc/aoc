function Main()
    local file = io.open("input.txt", "r")
    local highest = 0
    local secondHighest = 0
    local thirdHighest = 0
    for line in file:lines() do
        local value = tonumber(line)
        if value > highest then
            thirdHighest = secondHighest
            secondHighest = highest
            highest = value
        elseif value > secondHighest then
            thirdHighest = secondHighest
            secondHighest = value
        elseif value > thirdHighest then
            thirdHighest = value
        end
    end
    print(highest)
    print(secondHighest)
    print(thirdHighest)
end
