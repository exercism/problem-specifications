A binary tree with no repeated elements can be represented uniquely by its
pre-order and in-order traversals (post-order and in-order also work).

Tree traversals start at the root of the tree and can be defined recursively.

    Pre-order traversal of this tree is [a, i, x, f, r]     |
        take the node value                                 |    a
        then pre-order left subtree (recursive)             |   / \
        and finally pre-order right subtree (recursive)     |  i   x
    In-order traversal of this tree is [i, a, f, x, r]      |     / \
        in-order left subtree (recursive)                   |    f   r
        then take the node value                            |
        and finally in-order right subtree (recursive)      |

Implement an algorithm to rebuild a tree from its pre-order and in-order
traversals.

Bonus Points:

Consider the case when the traversals contain repeated elements. There may be
multiple possible trees. Find all of them.

Save the trees!
