#include <iostream>
using namespace std;

class Joseph
{
private:
    int data;
    Joseph *next;
    Joseph *head;
    Joseph *currentLoc;

public:
    Joseph();
    void InsertNode(int data);
    int josephPro(int k);
    void printdata();
};

Joseph::Joseph()
{
    head = NULL;
    currentLoc = NULL;
}

void Joseph::InsertNode(int data)
{
    Joseph *newNode = new Joseph();
    newNode->data = data;
    newNode->next = NULL;
    if (head == NULL)
    {
        head = newNode;
        head->next = newNode;
        currentLoc = head;
        return;
    }
    currentLoc->next = newNode;
    currentLoc = currentLoc->next;
    currentLoc->next = head;
}

int Joseph::josephPro(int k)
{
    int delValue;
    currentLoc = head;
    Joseph *delPtr = head->next;
    while (head->next != head)
    {
        for (int i = 1; i < k; i++)
        {
            currentLoc = currentLoc->next;
            delPtr = delPtr->next;
        }
        currentLoc->next = delPtr->next;
        if (delPtr == head) // if delPtr == head move head to the next node
            head = head->next;
        delValue = delPtr->data; // store deleted value in delValue
        delete delPtr;
        currentLoc = currentLoc->next;
        delPtr = currentLoc->next;
        cout << delValue << " Deleted \n";
    }
    return head->data;
}

void Joseph::printdata()
{
    currentLoc = head;
    do
    {
        cout << "-->" << currentLoc->data;
        currentLoc = currentLoc->next;
    } while (currentLoc != head);
    cout << "-->head\n";
}

int main()
{
    Joseph j;
    j.InsertNode(1);
    j.InsertNode(2);
    j.InsertNode(3);
    j.InsertNode(4);
    j.InsertNode(5);
    j.InsertNode(6);
    j.InsertNode(7);
    j.InsertNode(8);
    j.InsertNode(9);
    j.InsertNode(10);

    j.printdata();

    int k;
    cout << "Enter the step position for deletion (k): ";
    cin >> k; // Taking 'k' as input from the user

    cout << "Leader is : " << j.josephPro(k) << endl;

    return 0;
}
