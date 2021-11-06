/*
 * Copyright (C) 2011 Emweb bv, Herent, Belgium.
 *
 * See the LICENSE file for terms of use.
 */

#include "Wt/Json/Array.h"
#include "Wt/Json/Object.h"
#include "Wt/Json/Parser.h"
#include "Wt/Json/Value.h"
#include "Wt/WStringStream.h"

#include <boost/version.hpp>

#if !defined(WT_NO_SPIRIT) && BOOST_VERSION >= 104100
#  define JSON_PARSER
#endif

#ifdef JSON_PARSER

#include "3rdparty/rapidxml/rapidxml.hpp"

#include <boost/spirit/include/qi.hpp>
#include <boost/spirit/include/phoenix_core.hpp>
#include <boost/spirit/include/phoenix_operator.hpp>
#include <boost/spirit/include/phoenix_object.hpp>
#if BOOST_VERSION < 105600
#include <boost/spirit/home/phoenix/statement/throw.hpp>
#else
#include <boost/phoenix.hpp>
#endif

#include <boost/bind/bind.hpp>

#endif // JSON_PARSER

namespace Wt {
  namespace Json {

namespace {

static constexpr int MAX_RECURSION_DEPTH = 1000;

}



Value parse(const std::string& input, bool valideUTF8, bool allow_trailing_commas, bool allow_comments)
{
    parse_options opt; // all extensions default to off
    opt.allow_comments = allow_comments;                          // permit C and C++ style comments to appear in whitespace
    opt.allow_trailing_commas = allow_trailing_commas;            // allow an additional trailing comma in object and array element lists
    opt.allow_invalid_utf8 = !valideUTF8;                         // skip utf-8 validation of keys and strings
    return boost::json::parse(input, storage_ptr(), opt);
}

Value parse(const std::string& input, ParseError &error, bool valideUTF8, bool allow_trailing_commas, bool allow_comments)
{
    parse_options opt; // all extensions default to off
    opt.allow_comments = allow_comments;                          // permit C and C++ style comments to appear in whitespace
    opt.allow_trailing_commas = allow_trailing_commas;            // allow an additional trailing comma in object and array element lists
    opt.allow_invalid_utf8 = !valideUTF8;                         // skip utf-8 validation of keys and strings
    return boost::json::parse(input, error, storage_ptr(), opt);
}

void parse(const std::string& input, Object& result, bool valideUTF8, bool allow_trailing_commas, bool allow_comments)
{
    auto value = parse(input, valideUTF8, allow_trailing_commas, allow_comments);

    object& parsedObject = value.as_object();

    parsedObject.swap(result);
}

bool parse(const std::string& input, Object& result, ParseError& error, bool valideUTF8, bool allow_trailing_commas, bool allow_comments)
{
    auto value = parse(input, error, valideUTF8, allow_trailing_commas, allow_comments);

    if(!error){
        object& parsedObject = value.as_object();
        parsedObject.swap(result);
    }

    return !error;
}


void parse(const std::string& input, Array& result, bool valideUTF8, bool allow_trailing_commas, bool allow_comments)
{
    auto value = parse(input, valideUTF8, allow_trailing_commas, allow_comments);

    array& parsedObject = value.as_array();

    parsedObject.swap(result);
}

bool parse(const std::string& input, Array& result, ParseError& error, bool valideUTF8, bool allow_trailing_commas, bool allow_comments)
{
    auto value = parse(input, error, valideUTF8, allow_trailing_commas, allow_comments);

    if(!error){
        array& parsedObject = value.as_array();
        parsedObject.swap(result);
    }

    return !error;
}


  }
}
