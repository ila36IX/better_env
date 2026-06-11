#!/bin/env bash
# Automatically create class files with its constructors

if [[ -z "$1" ]]; then
	echo "Usage: $0 <ClassName> <- make sure to give PascaleCase";
	exit 1
fi

class_name=$1

# ClassName -> CLASS_NAME
# Will be used as the pretected header
function to_screaming_snake_case()
{
	name=$1;
	python3 -c "print(''.join(['_'+c if c.isupper() else c for c in '$name']).lstrip('_').upper())"
}

if [[ -f "$class_name.h" || -f "$class_name.cpp" ]]; then
	echo "Error: File $class_name.h or $class_name.cpp already exists"
	exit 1
fi

header_guard="$(to_screaming_snake_case $class_name)_H"

# Creating the header file
cat > "$class_name.h" << EOF
#ifndef $header_guard
#define $header_guard

class $class_name
{
      private:
        int n{0};

      public:
        $class_name(void);
        $class_name(/* Parameters */);
        $class_name(const $class_name &other);
        $class_name &operator=(const $class_name &other);
        ~$class_name();
};

#endif
EOF

# creating the cpp file
cat > "$class_name.cpp" << EOF
#include "$class_name.h"

$class_name::$class_name(void)
{
}

$class_name::$class_name(/*parameters*/)
{
}

$class_name::$class_name(const $class_name &other)
{
        *this = other;
}

$class_name &$class_name::operator=(const $class_name &other)
{
        if (this != &other)
        {
                // _member = other._member;
        }
        return (*this);
}

$class_name::~$class_name()
{
}
EOF

echo "$class_name.h and $class_name.cpp created"
