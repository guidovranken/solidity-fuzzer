#include <stdint.h>
#include <stdlib.h>
#include <string>
#include <libsolc.h>
#include <libsolidity/interface/CompilerStack.h>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size)
{
    try {
        dev::solidity::CompilerStack m_compiler;
        std::string sourceCode = "pragma solidity >=0.0;\n" + std::string(data, data + size);
        m_compiler.reset(false);
        m_compiler.addSource("", sourceCode);
        m_compiler.compile();
    } catch ( ... ) {  }

    return 0;
}
