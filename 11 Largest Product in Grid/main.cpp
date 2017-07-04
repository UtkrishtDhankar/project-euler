#include <iostream>
#include <vector>
#include <algorithm>

const int matrix_size = 20;
const int window_size = 4;

typedef std::vector<std::vector<int> > Matrix;

Matrix GetMatrixFromUser(const int size)
{
	Matrix matrix(size, std::vector<int> (size, 0));

	for (std::vector<int>& row : matrix)
	{
		for (int& i : row)
		{
			std::cin >> i;
		}
	}

	return matrix;
}

void PrintVector(const std::vector<int>& v)
{
	for (const int i : v)
	{
		std::cout << i << " ";
	}
	std::cout << std::endl;
}

void PrintMatrix(const Matrix& matrix)
{
	for (const std::vector<int>& row : matrix)
	{
		PrintVector(row);
	}
	std::cout << std::endl;
}

int FindRowwiseMaxProductFromMatrix(const Matrix& matrix)
{
	int maxProduct = 0;
	for (const std::vector<int>& row : matrix)
	{
		for (auto it = row.begin(); it < row.end() - window_size + 1; it++) {
			int product = 1;
			for (auto productIt = it; productIt < it + window_size; productIt++) {
				product *= *productIt;	
			}

			if (product > maxProduct) {
				maxProduct = product;
			}
		}
	}

	std::cout << "rowise " << maxProduct << std::endl;
	return maxProduct;
}

int FindColumnwiseMaxProductFromMatrix(const Matrix& matrix)
{
	int maxProduct = 0;
	for (int column = 0; column < matrix_size; column++)
	{
		for (int row = 0; row <= matrix_size - window_size; row++)
		{
			int product = 1;

			for (int i = 0; i < window_size; i++)
			{
				product *= matrix[row + i][column];
			}

			if (product > maxProduct) {
				maxProduct = product;
			}
		}
	}

	std::cout << "columnwise " << maxProduct << std::endl;
	return maxProduct;
}

int FindDiagonalwiseMaxProductFromMatrix(const Matrix& matrix)
{
	int maxProduct = 0;
	for (int column = 0; column <= matrix_size - window_size; column++)
	{
		for (int row = 0; row <= matrix_size - window_size; row++)
		{
			int product = 1;

			for (int i = 0; i < window_size; i++)
			{
				product *= matrix[row + i][column + i];
			}

			if (product > maxProduct) {
				maxProduct = product;
			}
		}
	}


	for (int column = 0; column <= matrix_size - window_size; column++)
	{
		for (int row = window_size - 1; row < matrix_size; row++)
		{
			int product = 1;

			for (int i = 0; i < window_size; i++)
			{
				product *= matrix[row - i][column + i];
			}

			if (product > maxProduct) {
				maxProduct = product;
			}
		}
	}

	std::cout << "diagonalwise " << maxProduct << std::endl;
	return maxProduct;
}

int FindMaxProductFromMatrix(const Matrix& matrix)
{
	return std::max({
			FindRowwiseMaxProductFromMatrix(matrix),
			FindDiagonalwiseMaxProductFromMatrix(matrix),
			FindColumnwiseMaxProductFromMatrix(matrix)
		});
}

int main()
{
	// The convention is that matrix[x][y] gives the element from
	// the xth row and the yth column.
	Matrix matrix = GetMatrixFromUser(matrix_size);

	int maxProduct = FindMaxProductFromMatrix(matrix);

	std::cout << maxProduct << std::endl;
	
	return 0;	
}
