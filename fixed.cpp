/*****************************************************************/
  /* NAME: Oscar Aguilar */
  /* ASGT: Activity 1 */
  /* ORGN: CSUB - CMPS 3500*/
  /* FILE: Fixed.cpp */
  /* DATE: 02/08/2025 */
  /*****************************************************************/

#include <iostream>
#include <vector>

using namespace std;

void bubbleSort(vector<int>& v) {

    // initalize the size of the vector into n for n iterations.
    int n = v.size(); 

    // Iterate through the unsorted array
    for(int i = 0; i < n - 1; i++){
        for( int j = 0; j < n - i - 1; j++) {
            // Swap the values to move the larger value to the end
            if (v[j] > v[j + 1]){ swap(v[j], v[j + 1]); }
      }
    }
}

int main()
{

    // Four Defined Vector Lists of Integers
    vector<int> list_1 = {5,1,4,2,8};
    vector<int> list_2 = {-1, -1, 0, 0, 3, 3, 6};
    vector<int> list_3 = {-1, 0, -2121, 1111, 8098, 443222, -123212};
    vector<int> list_4 = {600000, 0, -200000, 100000000, 7000, 40000000};

    int user_input;

     // Ask user for input to choose a list
    while(true){
    cout << "Choose a list you want to sort:" << endl;
    cout << " 1) List 1" << endl;
    cout << " 2) List 2" << endl;
    cout << " 3) List 3" << endl;
    cout << " 4) List 4" << endl;
    cout << "Please only select one option!" << endl;

    cin >> user_input;

    if(user_input >= 1 && user_input <= 4){
        break; // break if the value is valid 
    } else
        // print the message to remind the user their input was invalid
        cout << "invalid input! Please choose a valid option(1-4). " << endl;
    }
    // Sort the selected list and print the result
    if (user_input == 1) {
        bubbleSort(list_1);  // Sort list_1
        for (auto i : list_1) {
            cout << i << " ";  // Print sorted list_1
        }
        cout << endl;
    } else if (user_input == 2) {
        bubbleSort(list_2);  // Sort list_2
        for (auto i : list_2) {
            cout << i << " ";  // Print sorted list_2
        }
        cout << endl;
    } else if (user_input == 3) {
        bubbleSort(list_3);  // Sort list_3
        for (auto i : list_3) {
            cout << i << " ";  // Print sorted list_3
        }
        cout << endl;
    } else if (user_input == 4) {
        bubbleSort(list_4);  // Sort list_4
        for (auto i : list_4) {
            cout << i << " ";  // Print sorted list_4
        }
        cout << endl;
    }

    return 0;
}
