//  This file is distributed under the BSD 3-Clause License. See LICENSE for details.

#pragma once

#include <string_view>
#include <utility>
#include <vector>
#include <set>

#include "cell.hpp"
#include "lgraph.hpp"
#include "node.hpp"
#include "pass.hpp"
#include "absl/container/flat_hash_map.h"
// #include "absl/container/btree_set.h"

/*define only 1 of these:*/
//#define DEBUG //print everything
//#define KEEP_DUP //use vector
#define DE_DUP //use set 


class Traverse_lg : public Pass {
public:
  typedef absl::node_hash_map<Node::Compact_flat, std::pair<std::vector<std::string>, std::vector<std::string>>> vecMap;
  // typedef absl::node_hash_map<Node::Compact_flat, std::pair<absl::btree_set<std::string>, absl::btree_set<std::string>>> setMap_nodeKey;
  // typedef absl::node_hash_map<std::pair<absl::btree_set<std::string>, absl::btree_set<std::string>>, std::vector<Node::Compact_flat> > setMap_pairKey;
  typedef absl::node_hash_map<Node::Compact_flat, std::pair<std::set<std::string>, std::set<std::string>>> setMap_nodeKey;
  typedef absl::node_hash_map<std::pair<std::set<std::string>, std::set<std::string>>, std::vector<Node::Compact_flat> > setMap_pairKey;
private:
  absl::node_hash_map<Node::Compact_flat , std::vector<Node::Compact_flat> > print_map;
/*
#ifdef KEEP_DUP
  vecMap nodeIOmap;
#endif
#ifdef DE_DUP
  setMap nodeIOmap;
#endif
*/
protected:
  //FOR DEBUG:
  void do_travers(Lgraph* g);
  void get_input_node(const Node_pin &pin, std::ofstream& ofs);
  void get_output_node(const Node_pin &pin, std::ofstream& ofs);
  //FOR VECT PART:
  void do_travers(Lgraph* g, Traverse_lg::vecMap &nodeIOmap);
  void get_input_node(const Node_pin &pin, std::vector<std::string>& in_vec);
  void get_output_node(const Node_pin &pin, std::vector<std::string>& out_vec);
  //FOR SET PART:
  void do_travers(Lgraph* g, Traverse_lg::setMap_pairKey &nodeIOmap);
  // void get_input_node(const Node_pin &pin, absl::btree_set<std::string>& in_set);
  // void get_output_node(const Node_pin &pin, absl::btree_set<std::string>& out_set);
  void get_input_node(const Node_pin &pin, std::set<std::string>& in_set);
  void get_output_node(const Node_pin &pin, std::set<std::string>& out_set);

public:
  static void travers(Eprp_var& var);

  Traverse_lg(const Eprp_var& var);

  static void setup();
};