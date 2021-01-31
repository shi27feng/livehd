//  This file is distributed under the BSD 3-Clause License. See LICENSE for details.

#include <charconv>

#include "lgtuple.hpp"
#include "lgraph.hpp"
#include "likely.hpp"

Lgtuple::key_map_type::const_iterator Lgtuple::get_it(std::string_view key) const {
  key_map_type::const_iterator it = key_map.find(std::string{key});

  return it;
}

std::string Lgtuple::get_last_level(const std::string &key) {
  std::string last_key{key};

  auto n = last_key.find_last_of('.');
  if (n != std::string::npos) {
    last_key = last_key.substr(n+1);
  }

  return last_key;
}

std::string Lgtuple::get_all_but_last_level(const std::string &key) {
  std::string last_key{""};

  auto n = key.find_last_of('.');
  if (n != std::string::npos) {
    last_key = key.substr(0,n);
  }

  return last_key;
}

std::string Lgtuple::get_remove_first_level(const std::string &key) const {
  std::string first_level;

  auto n = key.find_first_of('.');
  if (n != std::string::npos) {
    first_level = key.substr(n+1);
  }

  return first_level; // empty if no dot left
}

void Lgtuple::add_int(const std::string &key, std::shared_ptr<Lgtuple const> tup) {

  if (tup->is_scalar()) {
    key_map.insert_or_assign(key, tup->get_dpin());
    return;
  }

  std::string key_base{key + "."};

  for(auto ent:tup->key_map) {
    key_map.insert_or_assign(key_base + ent.first, ent.second);
  }

  for(auto ent:tup->pos2key_map) {
    pos2key_map.insert_or_assign(key_base + ent.first, key_base + ent.second);
  }
  for(auto ent:tup->key2pos_map) {
    key2pos_map.insert_or_assign(key_base + ent.first, key_base + ent.second);
  }
}


std::shared_ptr<Lgtuple> Lgtuple::make_merge(Node_pin &sel_dpin, const std::vector<std::shared_ptr<Lgtuple const>> &tup_list) {
	(void)sel_dpin;

  I(tup_list.size()>1); // nothing to merge?

  auto tup0 = tup_list[0];

	auto new_tup = std::make_shared<Lgtuple>(tup0->get_name());

  for(auto i=0u;i<tup_list.size();++i) {
    auto tup = tup_list[i];
    tup->dump();
    I(tup->get_name() == tup0->get_name());
    for(const auto &it:tup->get_map()) {
      (void)it;
      I(tup->pos2key_map.empty()); // FIXME: only unordered for the moment
    }
  }

	return new_tup;
}

int Lgtuple::get_pos(std::string_view key) const {
  auto last_key = get_last_level(std::string{key});

  if (last_key[0]>='0' && last_key[0]<='9') {
    int x;
    std::from_chars(last_key.data(), last_key.data() + last_key.size(), x);
    return x;
  }

  auto k2p_it = key2pos_map.find(std::string{key});
  if (k2p_it == key2pos_map.end())
    return -1;

  last_key = get_last_level(k2p_it->second);
  I(last_key[0]>='0' && last_key[0]<='9');

  int x;
  std::from_chars(last_key.data(), last_key.data() + last_key.size(), x);
  return x;
}

const Node_pin &Lgtuple::get_dpin(int pos) const {
  auto it = get_it(pos);
  if (unlikely(it == key_map.end())) {
    LGraph::info("pos:{} does not exist in tuple:{}", pos, name);
    dump();
    return invalid_dpin;
  }

  return it->second;
}

const Node_pin &Lgtuple::get_dpin(std::string_view key) const {
  auto it = get_it(key);
  if (unlikely(it == key_map.end())) {
    LGraph::info("key:{} does not exist in tuple:{}", key, name);
    dump();
    return invalid_dpin;
  }

  return it->second;
}

const Node_pin &Lgtuple::get_dpin(int pos, std::string_view key) const {
  auto it = get_it(pos, key);
  if (unlikely(it == key_map.end())) {
    LGraph::info("pos:{} key:{} does not exist in tuple:{}", pos, key, name);
    dump();
    return invalid_dpin;
  }

  return it->second;
}


std::shared_ptr<Lgtuple> Lgtuple::get_sub_tuple(int pos, std::string_view key) const {
  (void)pos;
  (void)key;

  if ((pos==0 || pos<0) && key.empty()) {
    // speedup simple case of just copying everything
    return std::make_shared<Lgtuple>(*this);
  }

  std::shared_ptr<Lgtuple> tup;

  auto it = get_lower_it(pos, key);
  auto str_pos = std::to_string(pos);
  while(it!=key_map.end()) {
    if (str_pos.size() <= it->first.size() && it->first.substr(0,str_pos.size()) == str_pos) {
      if (!tup)
        tup = std::make_shared<Lgtuple>(""); // no name

      auto rest_name = get_remove_first_level(it->first);
      tup->key_map.insert_or_assign(rest_name, it->second);
    }else if (key.size() <= it->first.size() && it->first.substr(0,key.size()) == key) {
      if (!tup)
        tup = std::make_shared<Lgtuple>(""); // no name

      auto rest_name = get_remove_first_level(it->first);
      tup->key_map.insert_or_assign(rest_name, it->second);
      if (rest_name.size()) {
        auto it2 = key2pos_map.find(it->first);
        if (it2 != key2pos_map.end()) {
          tup->key2pos_map.insert_or_assign(rest_name, it2->second);
          tup->pos2key_map.insert_or_assign(it2->second, rest_name);
        }
      }
    }else{
      break;
    }
    ++it;
  }

  return tup;
}

std::shared_ptr<Lgtuple> Lgtuple::get_sub_tuple(int pos) const {
  (void)pos;
  std::shared_ptr<Lgtuple> tup;

  I(false); // FIXME: implement it

  return tup;
}

std::shared_ptr<Lgtuple> Lgtuple::get_sub_tuple(std::string_view key) const {
  (void)key;
  std::shared_ptr<Lgtuple> tup;

  I(false); // FIXME: implement it

  return tup;
}

void Lgtuple::del(std::string_view key) {
  if (key.empty())
    return;

  std::string key1_match{key};
  std::string key2_match{std::string{key} + "."};
  std::string key2_attr_match{std::string{key} + ".__"};

  for(auto it=key_map.begin(); it!=key_map.end(); ) { // delete any match to key (even subkeys like key.foo.bar)
    const auto &n = it->first;
    if (key1_match.size() == n.size() && strcasecmp(n.c_str(), key1_match.data())==0) { // exact
      auto k2p_it = key2pos_map.find(it->first);
      if (k2p_it != key2pos_map.end()) {
        pos2key_map.erase(k2p_it->second);
        key2pos_map.erase(k2p_it);
      }
      it = key_map.erase(it);
    }else if (key2_match.size() <= n.size() && strncasecmp(n.c_str(), key2_match.data(), key2_match.size())==0) { // subkeys
      if (key2_attr_match.size() <= n.size() && strncasecmp(n.c_str(), key2_attr_match.c_str(), key2_attr_match.size()) == 0) { 
        ++it; // Do not remove hidden or attributes
      }else{
        auto k2p_it = key2pos_map.find(it->first);
        if (k2p_it != key2pos_map.end()) {
          pos2key_map.erase(k2p_it->second);
          key2pos_map.erase(k2p_it);
        }
        it = key_map.erase(it);
      }
    }else{
      ++it;
    }
  }
}

void Lgtuple::del(int pos) {
  auto str_pos = std::to_string(pos);
  auto p2k_it = pos2key_map.find(str_pos);
  if (p2k_it == pos2key_map.end())
    return del(str_pos); // case: there is no key

  return del(p2k_it->second); // case: there is key and pos
}

void Lgtuple::add(int pos, std::string_view key, std::shared_ptr<Lgtuple const> tup) {
  bool only_attr_add = true;
  for(const auto &it:tup->key_map) {
    if (it.first.size()>2 && it.first.substr(0,2) == "__")
      continue;
    only_attr_add = false;
    break;
  }
  if (!only_attr_add)
    del(key);

  std::string key_str{key};
  if (pos>=0 && key.empty()) {                        // fix position
    key_str = std::to_string(pos);
  }else if (pos>=0 && !std::isdigit(key_str[0])) {    // fix position & key
    pos2key_map.insert_or_assign(std::to_string(pos), key_str);
    key2pos_map.insert_or_assign(key_str, std::to_string(pos));
  }else if (pos<0 && key.empty() && !key_map.empty()) { // append (no key or position)
    auto v = get_next_free_pos("");
    key_str = std::to_string(v);
  }

  add_int(key_str, tup);
}

void Lgtuple::add(int pos, std::string_view key, const Node_pin &dpin) {
  del(key);

  std::string key_str{key};
  if (pos>=0 && key.empty()) {                        // fix position
    key_str = std::to_string(pos);
  }else if (pos>=0 && !std::isdigit(key_str[0])) {    // fix position & key
    pos2key_map.insert_or_assign(std::to_string(pos), key_str);
    key2pos_map.insert_or_assign(key_str, std::to_string(pos));
  }else if (pos<0 && key.empty() && !key_map.empty()) { // append (no key or position)
    auto v = get_next_free_pos("");
    key_str = std::to_string(v);
  }

  key_map.insert_or_assign(key_str, dpin);
}

void Lgtuple::add(std::string_view key, std::shared_ptr<Lgtuple const> tup) {
  del(key);

  add_int(std::string{key}, tup);
}

void Lgtuple::add(std::string_view key, const Node_pin &dpin) {
  auto k2p_it = key2pos_map.find(key);
  std::string pos_match;
  if (k2p_it != key2pos_map.end()) {
    pos_match = k2p_it->second;
  }

  del(key);

  if (!pos_match.empty()) { // preserve pos if existed before
    pos2key_map.insert_or_assign(pos_match, key);
    key2pos_map.insert_or_assign(key, pos_match);
  }

  key_map.insert_or_assign(std::string{key}, dpin);
}

void Lgtuple::add(int pos, std::shared_ptr<Lgtuple const> tup) {
  auto str_pos = std::to_string(pos);
  auto p2k_it = pos2key_map.find(str_pos);
  std::string key_match;
  if (p2k_it == pos2key_map.end()) {
    key_match = p2k_it->second;
  }

  del(pos);

  if (!key_match.empty()) { // preserve key name if existed before
    pos2key_map.insert_or_assign(str_pos, key_match);
    key2pos_map.insert_or_assign(key_match, str_pos);
  }

  add_int(str_pos, tup);
}

void Lgtuple::add(int pos, const Node_pin &dpin) {
  auto str_pos = std::to_string(pos);
  auto p2k_it = pos2key_map.find(str_pos);
  std::string key_match;
  if (p2k_it != pos2key_map.end()) {
    key_match = p2k_it->second;
  }

  del(pos);

  if (!key_match.empty()) { // preserve key name if existed before
    pos2key_map.insert_or_assign(str_pos, key_match);
    key2pos_map.insert_or_assign(key_match, str_pos);
    key_map.insert_or_assign(key_match, dpin);
  }else{
    key_map.insert_or_assign(str_pos, dpin);
  }
}

void Lgtuple::add(const Node_pin &dpin) {
  add("", dpin);
}

int Lgtuple::get_next_free_pos(const std::string &match) const {
  int next_tup_pos = 0;
  for(auto it:key_map) {
    int v = 0;
    if (strncasecmp(it.first.c_str(),match.c_str(),match.size())!=0)
      continue;

    auto last_level = get_last_level(it.first);
    if (std::isdigit(last_level[0])) {
      v = std::atoi(last_level.c_str());
    }else{
      const auto it2 = key2pos_map.find(it.first);
      if (it2 != key2pos_map.end()) {
        auto str = get_last_level(it2->second);
        v = std::atoi(str.c_str());
      }else{
        continue;
      }
    }

    if (v>=next_tup_pos) {
      next_tup_pos = v+1;
    }
  }

  return next_tup_pos;
}

bool Lgtuple::concat(std::shared_ptr<Lgtuple const> tup) {

  bool ok = true;

  for(auto it:tup->key_map) {

    if (key_map.find(it.first) == key_map.end()) {
      key_map.insert_or_assign(it.first, it.second);
      continue;
    }

    auto last_level = get_last_level(it.first);
    if (!std::isdigit(last_level[0])) {
      dump();
      tup->dump();
      LGraph::info("tuples {} and {} can not concat for key:{}", get_name(), tup->get_name(), it.first);
      ok = false;
      continue;
    }
    I(tup->pos2key_map.find(it.first) == tup->pos2key_map.end()); // It was a pos>=0, key.empty(), so no pos2key_map

    auto str = get_all_but_last_level(it.first);
    auto v = get_next_free_pos(str);
    auto pos_str = std::to_string(v);

    if (str.empty())
      key_map.insert_or_assign(pos_str, it.second);
    else
      key_map.insert_or_assign(str + "." + pos_str, it.second);
  }

  for(auto it:tup->pos2key_map) {
    if (pos2key_map.find(it.first) != pos2key_map.end()) {
      I(!ok); // already reported error
      continue;
    }
    pos2key_map.insert_or_assign(it.first, it.second);
    key2pos_map.insert_or_assign(it.first, it.second);
  }

  return ok;
}

std::vector<std::pair<std::string, Node_pin>> Lgtuple::get_level_attributes(int pos, std::string_view key) const {

  std::vector<std::pair<std::string, Node_pin>> v;

  if (key.size()>2 && key.substr(0,2) == "__")
    return v; // no recursive attributes

  auto it = get_lower_it(pos, key);

  auto str_pos = std::to_string(pos);
  while(it!=key_map.end()) {
    if ( (str_pos.size() > it->first.size() || it->first.substr(0,str_pos.size()) != str_pos)
      && (key.size() > it->first.size() || it->first.substr(0,key.size()) != key)) {
      return v;
    }
    auto last_level = get_last_level(it->first);

    if (last_level.size()>2 && last_level.substr(0,2) == "__") {
      I(last_level != it->first); // There must be a dot
      v.emplace_back(last_level, it->second);
    }
    ++it;
  }

  return v;
}

void Lgtuple::dump() const {
  fmt::print("tuple name:{}\n", name);
  for(const auto &it:key_map) {
    auto it_pos = key2pos_map.find(it.first);
    if (it_pos == key2pos_map.end()) {
      fmt::print("  key:{} dpin:{}\n", it.first, it.second.debug_name());
    }else{
      fmt::print("  key:{}@{} dpin:{}\n", it.first, it_pos->second, it.second.debug_name());
    }
  }
}

