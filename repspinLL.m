#include <iostream>
using namespace std;

// Node to represent sparse matrix
struct Node {
    int value;
    int row_position;
    int column_position;
    Node* next;
};

// Function to create new node
void create_new_node(Node** start, int non_zero_element, int row_index, int column_index) {
    Node* temp = *start;
    if (temp == NULL) {
        // Create new node dynamically
        temp = new Node();
        temp->value = non_zero_element;
        temp->row_position = row_index;
        temp->column_position = column_index;
        temp->next = NULL;
        *start = temp;
    } else {
        while (temp->next != NULL)
            temp = temp->next;

        // Create new node dynamically
        Node* r = new Node();
        r->value = non_zero_element;
        r->row_position = row_index;
        r->column_position = column_index;
        r->next = NULL;
        temp->next = r;
    }
}

// This function prints contents of linked list starting from start
void PrintList(Node* start) {
    Node* temp = start;

    cout << "row_position: ";
    while (temp != NULL) {
        cout << temp->row_position << " ";
        temp = temp->next;
    }
    cout << endl;

    temp = start;
    cout << "column_position: ";
    while (temp != NULL) {
        cout << temp->column_position << " ";
        temp = temp->next;
    }
    cout << endl;

    temp = start;
    cout << "Value: ";
    while (temp != NULL) {
        cout << temp->value << " ";
        temp = temp->next;
    }
    cout << endl;
}

// Driver of the program
int main() {
    // Assume 4x5 sparse matrix
    int sparseMatrix[4][5] = {
        {0, 0, 3, 0, 4},
        {0, 0, 5, 7, 0},
        {0, 0, 0, 0, 0},
        {0, 2, 6, 0, 0}
    };

    // Start with the empty list
    Node* start = NULL;

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 5; j++) {
            // Pass only those values which are non-zero
            if (sparseMatrix[i][j] != 0) {
                create_new_node(&start, sparseMatrix[i][j], i, j);
            }
        }
    }

    PrintList(start);

    return 0;
}
