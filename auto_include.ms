proc(_contains, @a, @b,

	return(string_position(@a, @b) != -1)

)

proc(_int_cd, @loc,

	return(array(integer(@loc[0]), integer(@loc[1]), integer(@loc[2]), integer(@loc[3])))

)

proc(_yaml_fix, @string,

	return(replace(replace(replace(@string, "{", "\n  "), "}", ""), ",", "\n "))

)