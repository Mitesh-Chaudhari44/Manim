#include <iostream>
#include <stack>
using namespace std;

int gcd(int num1, int num2) {
    stack<pair<int, int>> stk;  // Stack to hold pairs of (n1, n2)

    // Push the initial pair of numbers onto the stack
    stk.push(make_pair(num1, num2));

    while (!stk.empty()) {
        pair<int, int> current = stk.top();  // Get the top of the stack
        stk.pop();

        int n1 = current.first;
        int n2 = current.second;

        // Base cases
        if (n1 == 0) return n2;
        if (n2 == 0) return n1;

        // Push the next step onto the stack (this simulates the recursive call)
        if (n1 > n2) {
            stk.push(make_pair(n1 % n2, n2));
        } else {
            stk.push(make_pair(n1, n2 % n1));
        }
    }

    return -1;  // This line will never be reached, but it's good practice
}

int main() {
    int num1, num2;

    cout << "Enter 2 positive integer numbers: ";
    cin >> num1 >> num2;

    cout << "\nGCD of " << num1 << " and " << num2 << " is " << gcd(num1, num2) << "." << endl;

    return 0;
}
