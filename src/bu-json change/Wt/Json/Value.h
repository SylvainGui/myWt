// This may look like C code, but it's really -*- C++ -*-
/*
 * Copyright (C) 2011 Emweb bv, Herent, Belgium.
 *
 * See the LICENSE file for terms of use.
 */
#ifndef WT_JSON_VALUE_H_
#define WT_JSON_VALUE_H_

#include <Wt/WAny.h>
#include <Wt/WException.h>
#include <Wt/WString.h>

#define BOOST_JSON_STANDALONE 1
#include <boost/json/src.hpp>
#include <boost/json.hpp>
//using namespace boost::json;

namespace Json = boost::json;

namespace Wt {
  /*! \brief Namespace for the \ref json
   */
  namespace Json {

//class Object;
//class Array;

/*! \defgroup json JSON Library (Wt::Json)
 *  \brief A JSON representation and parsing library.
 *
 * The JSON library contains data types to represent a JSON data
 * structure (Value, Object and Array), a JSON parser, and a JSON serializer.
 *
 * Usage example:
 * \code
 * Json::Object result;
 * Json::parse("{ "
 *             "  \"a\": \"That's great\", "
 *             "  \"b\": true "
 *             "}",
 *             result);
 *
 * std::cerr << "Size: " << result.size(); << std::endl; // Size: 2
 * WString s = result.get("a");
 * bool b = result.get("b");
 * std::cerr << "a: " << s << ", b: " << b << std::endl; // a: That's great, b: true
 * \endcode
 *
 * Include the <Wt/Json/Parser.h> header for Wt::Json::parse(), and
 * the <Wt/Json/Serializer.h> header for Wt::Json::serialize().
 */

/*! \brief Enumeration for the type of a JSON value.
 *
 * \sa Value::type()
 *
 * \ingroup json
 */


/*! \class TypeException Wt/Json/Value.h Wt/Json/Value.h
 *  \brief Exception that indicates a type error.
 *
 * This exception is thrown when a Value is being casted to an
 * incompatible C++ type.
 *
 * \note To avoid exceptions, coerce the type first, and handle Null values.
 *
 * \ingroup json
 */
//class TypeException : public WException
//{
//public:
//  TypeException(const std::string& name, Type actualType, Type expectedType);
//  TypeException(Type actualType, Type expectedType);
//  virtual ~TypeException() throw();

//  /*! \brief Returns the object field name (if known) */
//  const std::string& name() const { return name_; }

//  /*! \brief Returns the value type */
//  Type actualType() const { return actualType_; }

//  /*! \brief Returns the expected value type */
//  Type expectedType() const { return expectedType_; }

//private:
//  std::string name_;
//  Type actualType_, expectedType_;
//};

/*! \brief A JSON value
 *
 * This class represents a JSON value, which may be:
 * - a simple type (boolean, number, string)
 * - a composed type (Array or Object)
 * - #Null: this represents values which are represented as "null" in
 *   JSON notations, but also the values returned for missing members in
 *   an Object, or values which are the result of a failed type coercion.
 *
 * \ingroup json
 */
  typedef boost::json::value Value;
  typedef boost::json::object Object;
  typedef boost::json::array Array;
  template<class V>
  std::string serialize(V val)
  {
      return boost::json::serialize(val);
  }


  }
}

#endif // WT_JSON_OBJECT_H_
