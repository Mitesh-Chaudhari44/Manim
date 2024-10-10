#include <iostream>
#include <stack>

// Function to calculate GCD using stack-based recursion
int gcdUsingStack(int a, int b) {
    std::stack<std::pair<int, int>> stk;

    // Push the initial pair onto the stack
    stk.push({a, b});

    while (!stk.empty()) {
        // Get the top pair from the stack
        std::pair<int, int> current = stk.top();
        stk.pop();

        int x = current.first;
        int y = current.second;

        // If the second number becomes zero, the first number is the GCD
        if (y == 0) {
            return x;
        } else {
            // Push the next state (y, x % y) onto the stack
            stk.push({y, x % y});
        }
    }

    // If the stack is empty and we haven't returned, it means GCD was not found, which is not possible.
    return 1; // This line is just for safety; it won't be reached.
}

int main() {
    int num1 = 48, num2 = 18;

    int gcd = gcdUsingStack(num1, num2);
    std::cout << "GCD of " << num1 << " and " << num2 << " is: " << gcd << std::endl;

    return 0;
}
