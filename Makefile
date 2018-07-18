fuzzer: fuzzer.cpp
	test $(SOLIDITY_ROOT)
	test $(BOOST_ROOT)
	$(CXX) $(CXXFLAGS) -std=c++11 \
		-I$(SOLIDITY_ROOT) -I $(SOLIDITY_ROOT)/build/deps/include/ -I$(SOLIDITY_ROOT)/libsolc \
		fuzzer.cpp \
		$(SOLIDITY_ROOT)/build/libsolc/libsolc.a  $(SOLIDITY_ROOT)/build/libsolidity/libsolidity.a $(SOLIDITY_ROOT)/build/libdevcore/libdevcore.a $(SOLIDITY_ROOT)/build/deps/lib/libjsoncpp.a $(SOLIDITY_ROOT)/build/libevmasm/libevmasm.a \
		$(BOOST_ROOT)/lib/libboost_system.a $(BOOST_ROOT)/lib/libboost_regex.a $(BOOST_ROOT)/lib/libboost_filesystem.a \
		/usr/lib/x86_64-linux-gnu/libz3.so -lFuzzingEngine -o fuzzer
