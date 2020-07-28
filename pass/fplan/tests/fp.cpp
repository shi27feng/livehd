#include <iostream>

#include "json_inou.hpp"
#include "hier_tree.hpp"

// this is a mini-testbed, currently.

int main() {
	std::cout << "starting floorplan." << std::endl;
  
  std::cout << "loading netlist and organizing hierarchy...";
  Json_inou_parser p("/home/kneil/code/real/livehd/pass/fplan/tests/hier_test.json");
	std::cout << "done." << std::endl;
  
  std::cout << "discovering hierarchies...";
  Graph_info&& gi = p.make_tree();
  Hier_tree t(gi, 1, 0.0);
  std::cout << "done." << std::endl;

  std::cout << "finished floorplan." << std::endl;
}
