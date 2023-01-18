# The main function that handles the course of the simulation
function main(size)

    # Initialize the counter variables
    count = 0

    # Simulate each list length 1000000 times
    for x in 1:1000000

        # If a match is found, increase the count of each individual tracker
        found = simulate(size)
        if found == true
            count += 1
        end
    end

    results(size, count)
end

# Function that actually performs the simulation
function simulate(count)
    found = false

    # Create a list of birthdays of the length "count"
    list = Int[]
    for x in 1:count
        push!(list, rand(1:365))
    end
    
    # Check if a match in birthdays is found
    for y in 1:length(list)
        for z in 1:length(list)
            if y == z
                continue
            end

            # If a match if found, return true
            if list[y] == list[z]
                return true
            end
        end
    end

    return found
end

# Print the results of the simulation
function results(size, count)
    println("For a group of ", size, " random people, a match was found ", count, "/1000000 times, or ", count/10000, " percent")
end

# -----------------------
#     RUN THE PROGRAM
# -----------------------
println("Welcome to the Birthday Paradox simulator!")
println("Checking if a group from 10 to 30 people would have matching birthdays")
println("Simulating each group 1,000,000 times...\n")

for x in 1:100
    main(x)
end