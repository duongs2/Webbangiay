// ConsoleApplication1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>


// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file

#include <algorithm>

const int MAX_SIZE = 50;

// Hàm nhập mảng
void nhapMang(int arr[], int& n) {
    do {
        std::cout << "Nhap so luong phan tu (0<=n<=50): ";
        std::cin >> n;
    } while (n < 0 || n > MAX_SIZE);

    std::cout << "Nhap mang " << n << " so nguyen:\n";
    for (int i = 0; i < n; ++i) {
        std::cout << "arr[" << i << "]: ";
        std::cin >> arr[i];
    }
}

// Hàm hiển thị mảng
void hienThiMang(const int arr[], int n) {
    std::cout << "Mang gom " << n << " so nguyen:\n";
    for (int i = 0; i < n; ++i) {
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;
}

// Hàm chèn giá trị x vào vị trí k trong mảng
void chenPhanTu(int arr[], int& n, int x, int k) {
    if (k < 0 || k > n) {
        std::cout << "Vi tri chen khong hop le.\n";
        return;
    }

    for (int i = n; i > k; --i) {
        arr[i] = arr[i - 1];
    }

    arr[k] = x;
    ++n;
}

// Hàm sắp xếp mảng giảm dần
void sapXepGiamDan(int arr[], int n) {
    std::sort(arr, arr + n, std::greater<int>());
}

// Hàm tính trung bình cộng các phần tử lẻ trong mảng
float tinhTrungBinhCongLe(const int arr[], int n) {
    int tongLe = 0;
    int soPhanTuLe = 0;

    for (int i = 0; i < n; ++i) {
        if (arr[i] % 2 != 0) {
            tongLe += arr[i];
            ++soPhanTuLe;
        }
    }

    return soPhanTuLe > 0 ? static_cast<float>(tongLe) / soPhanTuLe : 0.0;
}

int main() {
    int arr[MAX_SIZE];
    int n;

    nhapMang(arr, n);
    hienThiMang(arr, n);

    int x, k;
    std::cout << "Nhap gia tri can chen (x): ";
    std::cin >> x;
    std::cout << "Nhap vi tri can chen (k): ";
    std::cin >> k;

    chenPhanTu(arr, n, x, k);
    hienThiMang(arr, n);

    sapXepGiamDan(arr, n);
    hienThiMang(arr, n);

    float trungBinhLe = tinhTrungBinhCongLe(arr, n);
    std::cout << "Trung binh cong cac phan tu le: " << trungBinhLe << std::endl;

    return 0;
}
