-- --First
-- local scores = {
--     ["A"] = {
--         ["X"] = 4,
--         ["Y"] = 8,
--         ["Z"] = 3
--     },
--     ["B"] = {
--         ["X"] = 1,
--         ["Y"] = 5,
--         ["Z"] = 9
--     },
--     ["C"] = {
--         ["X"] = 7,
--         ["Y"] = 2,
--         ["Z"] = 6
--     }
-- }
--Second
local scores = {
    ["A"] = {
        ["X"] = 3,
        ["Y"] = 4,
        ["Z"] = 8
    },
    ["B"] = {
        ["X"] = 1,
        ["Y"] = 5,
        ["Z"] = 9
    },
    ["C"] = {
        ["X"] = 2,
        ["Y"] = 6,
        ["Z"] = 7
    }
}

function main()
    local file = io.open("input.txt", "r")
    local totalScore = 0
    if file then
        for line in file:lines() do
            local opponent, you = line:match("(%w) (%w)")

            totalScore = totalScore + scores[opponent][you]
        end

        print(totalScore)
    end
end

main()

-- X = lose 0
-- Y = draw 3
-- Z = win 6
-------------------------
-- A = Rock
-- B = Paper
-- C = Scissors
--------------------------
-- D = Rock
-- E = Paper
-- F = Scissors
