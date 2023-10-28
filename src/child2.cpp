#include <string>
#include <iostream>
#include "../include/utils.h"

std::string replace_spaces(std::string source, char replacement) {
    for (auto spaceChar: {' ', '\t', '\n', '\r', '\t', '\v'})
        std::replace(source.begin(), source.end(), spaceChar, replacement);

    return source;
}

int main(int argc, char *argv[])
{
    std::string source1;
    std::getline(std::cin, source1);
    int file = openFile("bebus2");
    dprintf(file, replace_spaces(source1, '_').c_str(), sizeof(char)*source1.size());
    std::cout << replace_spaces(source1, '_');
    return 0;
}
