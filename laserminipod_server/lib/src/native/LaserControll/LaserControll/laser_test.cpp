#include "pch.h"
#include "laser_test.h"
#include <iostream>

void HalloWelt() {
    std::cout << "Hallo, Welt aus der DLL!" << std::endl;
}

void HalloWeltParameter(int x, int y, double radius) {
    std::cout << "Hello from C++! x: " << x
        << ", y: " << y
        << ", radius: " << radius << std::endl;
}