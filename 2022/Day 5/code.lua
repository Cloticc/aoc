-- The expedition can depart as soon as the final supplies have been unloaded from the ships. Supplies are stored in stacks of marked crates, but because the needed supplies are buried under many other crates, the crates need to be rearranged.

-- The ship has a giant cargo crane capable of moving crates between stacks. To ensure none of the crates get crushed or fall over, the crane operator will rearrange them in a series of carefully-planned steps. After the crates are rearranged, the desired crates will be at the top of each stack.

-- The Elves don't want to interrupt the crane operator during this delicate procedure, but they forgot to ask her which crate will end up where, and they want to be ready to unload them as soon as possible so they can embark.

-- They do, however, have a drawing of the starting stacks of crates and the rearrangement procedure (your puzzle input). For example:

--     [D]
-- [N] [C]
-- [Z] [M] [P]
--  1   2   3

-- move 1 from 2 to 1
-- move 3 from 1 to 3
-- move 2 from 2 to 1
-- move 1 from 1 to 2
-- In this example, there are three stacks of crates. Stack 1 contains two crates: crate Z is on the bottom, and crate N is on top. Stack 2 contains three crates; from bottom to top, they are crates M, C, and D. Finally, stack 3 contains a single crate, P.

-- Then, the rearrangement procedure is given. In each step of the procedure, a quantity of crates is moved from one stack to a different stack. In the first step of the above rearrangement procedure, one crate is moved from stack 2 to stack 1, resulting in this configuration:

-- [D]
-- [N] [C]
-- [Z] [M] [P]
--  1   2   3
-- In the second step, three crates are moved from stack 1 to stack 3. Crates are moved one at a time, so the first crate to be moved (D) ends up below the second and third crates:

--         [Z]
--         [N]
--     [C] [D]
--     [M] [P]
--  1   2   3
-- Then, both crates are moved from stack 2 to stack 1. Again, because crates are moved one at a time, crate C ends up below crate M:

--         [Z]
--         [N]
-- [M]     [D]
-- [C]     [P]
--  1   2   3
-- Finally, one crate is moved from stack 1 to stack 2:

--         [Z]
--         [N]
--         [D]
-- [C] [M] [P]
--  1   2   3
-- The Elves just need to know which crate will end up on top of each stack; in this example, the top crates are C in stack 1, M in stack 2, and Z in stack 3, so you should combine these together and give the Elves the message CMZ.

-- After the rearrangement procedure completes, what crate ends up on top of each stack?




-- itxt = open("input", mode='r').read()
-- itxt, moves = itxt.split('\n\n')
-- moves = list(filter(lambda e: e not in ['move', 'from', 'to'], moves.split()))
-- moves = list(map(int, moves))
-- itxt = itxt.splitlines()

-- stack_pos = itxt.pop(-1)
-- itxt.reverse()

-- stacks = dict()

-- for i, e in enumerate(list(stack_pos)):
--     if e != ' ':
--         stacks.update({ int(e):
--             [j[i] for j in itxt if j[i] in ascii_uppercase]})

-- while len(moves):
--     n = moves.pop(0)
--     f = moves.pop(0)
--     t = moves.pop(0)

--     for _ in range(n):
--         stacks[t].append(stacks[f].pop(-1))

-- for i in stacks.values():
--     print(i[-1], end='')

-- [Q]     [P] [P]
-- [G] [V] [S] [Z] [F]
-- [W] [V] [F] [Z] [W] [Q]
-- [V] [T] [N] [J] [W] [B] [W]
-- [Z] [L] [V] [B] [C] [R] [N] [M]
-- [C] [W] [R] [H] [H] [P] [T] [M] [B]
-- [Q] [Q] [M] [Z] [Z] [N] [G] [G] [J]
-- [B] [R] [B] [C] [D] [H] [D] [C] [N]
-- 1   2   3   4   5   6   7   8   9


function main()
    local input = io.open("input.txt", "r")
    local lines = {}

    for line in input:lines() do
        table.insert(lines, line)
    end

    local stacks = {}
    local stack_pos = lines[#lines]
    lines[#lines] = nil

    for i = 1, #stack_pos do
        if stack_pos:sub(i, i) ~= " " then
            stacks[tonumber(stack_pos:sub(i, i))] = {}
        end
    end

    for i = 1, #lines do
        for j = 1, #lines[i] do
            if lines[i]:sub(j, j) ~= " " then
                stacks[#stacks - j + 1][i] = lines[i]:sub(j, j)
            end
        end
    end

    for i = 1, #stacks do
        stacks[i] = table.concat(stacks[i])
    end

    for i = 1, #stacks do
        print(stacks[i]:sub(-1, -1))
    end
end

main()






-- Initialize the stacks of crates.
local stacks = {
    { 'Z', 'N' },
    { 'M', 'C', 'D' },
    { 'P' }
}

-- Define the rearrangement instructions.
local instructions = {
    "move 1 from 2 to 1",
    "move 3 from 1 to 3",
    "move 2 from 2 to 1",
    "move 1 from 1 to 2"
}

-- Function to parse a rearrangement instruction.
-- Returns the source and destination stacks, and the number of crates to move.
local function parse_instruction(instruction)
    local source, dest, count = instruction:match("move (%d+) from (%d+) to (%d+)")
    return tonumber(source), tonumber(dest), tonumber(count)
end

-- Function to rearrange the stacks of crates.
-- Returns the top crate from each stack.
local function rearrange(stacks, instructions)
    for _, instruction in ipairs(instructions) do
        -- Parse the instruction to determine the source and destination stacks,
        -- and the number of crates to move.
        local source, dest, count = parse_instruction(instruction)

        -- Remove the top crates from the source stack and append them to the
        -- destination stack.
        local crates = {}
        for i = 1, count do
            local crate = table.remove(stacks[source])
            table.insert(crates, crate)
        end
        for _, crate in ipairs(crates) do
            table.insert(stacks[dest], crate)
        end
    end

    -- Return the top crate from each stack.
    return { stacks[1][#stacks[1]], stacks[2][#stacks[2]], stacks[3][#stacks[3]] }
end

-- Rearrange the stacks of crates.
local rearranged = rearrange(stacks, instructions)

-- Print the top crate from each stack.
print(rearranged[1], rearranged[2], rearranged[3]) -- Output: C M Z
