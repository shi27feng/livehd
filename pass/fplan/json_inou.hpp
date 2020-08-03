/*
  This class converts a json file representing a hierarchical netlist into a Hier_tree data structure.
*/
#pragma once

#include <filesystem>
#include <fstream>
#include <string>

#include <unordered_map>
#include <algorithm>
#include <iterator>

#include "rapidjson/document.h" // for json parsing
#include "graph_info.hpp"

#include "i_resolve_header.hpp"

class Json_inou_parser {
public:
  
  // load and check json being passed to us
  Json_inou_parser(const std::string& path);
  
  // create a graph from json
  Graph_info make_tree() const;
  
  // get area for the whole design...?
  double get_area() const;

  // get aspect ratio for the whole design...?
  double get_aspect_ratio() const;
private:
  rapidjson::Document d;
};
