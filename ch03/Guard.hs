-- Pattern matching can not only be used for functions.
-- The case construct lets us pattern match within an expression

fromMaybe defval wrapped =
  case wrapped of
    Nothing -> defval
    Just value -> value