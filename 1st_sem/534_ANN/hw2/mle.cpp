// ConsoleApplication2.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"


#include <string>
#include <iostream>
#include <fstream>

using namespace std;
void readData(string name, double* arry);

void readData(string name, double* arry) {
	string line;
	int i = 0;
	ifstream myfile(name);
	if (myfile.is_open())
	{
		while (getline(myfile, line))
		{
			//cout << line << '\n';
			arry[i] = atof(line.c_str());
			i++;
		}
		myfile.close();
	}
	else cout << "Unable to open file"<<endl;
}
int main() {
	//cout << "hello" << endl;
	cout << "hello" << endl;

	int size = 50;
	double c1[50];
	double c2[50];
	
	readData("C1_data.txt", c1);
	readData("C2_data.txt", c2);

	double c1_sum = 0;
	double c2_sum = 0;

	for (int i = 0; i < size; i++) {
		c1_sum += c1[i];
		c2_sum += c2[i];
	}

	double c1_mean = c1_sum / size;
	double c2_mean = c2_sum / size;

	double c1_variance = 0;
	double c2_variance = 0;

	for (int i = 0; i < size; i++) {
		c1_variance += (c1_mean - c1[i]) * (c1_mean - c1[i]) /size;
		c2_variance += (c2_mean - c2[i]) * (c2_mean - c2[i]) / size;
	}

	cout << "c1 mean: " << c1_mean << endl;
	cout << "c2 mean: " << c2_mean << endl;
	cout << "c1 variance: " << c1_variance << endl;
	cout << "c2 variance: " << c2_variance << endl;

	int choice;
	cin >> choice ;
	return choice;
}
