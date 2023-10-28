#include <string>
#include <iostream>
#include "../include/utils.h"

std::string to_lower(const std::string& arg) {
    std::string res;

    for (auto ch: arg)
        res += tolower(ch);

    return res;
}

int main(int argc, char *argv[])
{
    std::string source1;
    getline(std::cin, source1);
    int file = openFile("bebus1");
    dprintf(file, to_lower(source1).c_str(), sizeof(char)*source1.size());
    std::cout << to_lower(source1);
    return 0;
}
