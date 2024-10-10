class SparseMatrix {
private:
    Node* head; // Head of the linked list

public:
    // Constructor to initialize the sparse matrix
    SparseMatrix() : head(nullptr) {}

    // Function to insert a new element into the sparse matrix
    void insert(int row, int col, int value) {
        if (value == 0) return; // We only store non-zero elements

        Node* newNode = new Node(row, col, value);

        if (!head) {
            head = newNode; // If the list is empty, make the new node the head
        } else {
            Node* temp = head;
            // Traverse to the end of the list and add the new node
            while (temp->next) {
                temp = temp->next;
            }
            temp->next = newNode;
        }
    }

    // Function to display the sparse matrix in the linked list format
    void display() {
        Node* temp = head;
        std::cout << "Row\tColumn\tValue\n";
        while (temp) {
            std::cout << temp->row << "\t" << temp->col << "\t" << temp->value << "\n";
            temp = temp->next;
        }
    }

    // Destructor to free memory
    ~SparseMatrix() {
        Node* current = head;
        Node* nextNode;
        while (current) {
            nextNode = current->next;
            delete current;
            current = nextNode;
        }
    }
};
