-- Binary tree type
data Tree a
  = Node a (Tree a) (Tree a)
  | Empty
  deriving (Show)

-- Either a node with two children (each being a binary tree) or an empty value

-- Compared to Java:
-- class Tree<A>
-- {
--     A value;
--     Tree<A> left;
--     Tree<A> right;

--     public Tree(A v, Tree<A> l, Tree<A> r)
--     {
-- 	value = v;
-- 	left = l;
-- 	right = r;
--     }
-- }

-- Example function constructing a tree with two leaves (leaf by convention has no children)
-- class Example
-- {
--     static Tree<String> simpleTree()
--     {
-- 	return new Tree<String>(
--             "parent",
-- 	    new Tree<String>("left leaf", null, null),
-- 	    new Tree<String>("right leaf", null, null));
--     }
-- }

simpleTree = Node "parent" (Node "left child" Empty Empty) (Node "right child" Empty Empty)

-- Exercise: Define a tree type that has only one constructor, like our Java example. Instead of the Empty constructor, use the Maybe type to refer to a node's children. 43 comments

data Tree2 a = Node2 a (Maybe (Tree2 a)) (Maybe (Tree2 a))
