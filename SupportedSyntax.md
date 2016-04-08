# Comparison operations #
## Equality ##
```
Specify.That(Foo, Should.Equal(45));
Specify.That(Foo, Should.Yield(45));
```
`Should.Equal` and `Should.Yield` are equivalent; you can use whichever one is more readable in any given context. Here's an [example of Should.Yield](http://www.excastle.com/blog/archive/2007/06/10/43650.aspx).
## Reference equality ##
```
Specify.That(Foo, Should.ReferTo(Bar));
```
## Inequality ##
```
Specify.That(Foo, Should.Be.AtLeast(45));
Specify.That(Foo, Should.Be.AtMost(45));
Specify.That(Foo, Should.Be.Between(45, 48));
Specify.That(Foo, Should.Be.GreaterThan(45));
Specify.That(Foo, Should.Be.GreaterThanOrEqualTo(45));
Specify.That(Foo, Should.Be.InRange(45, 48));
Specify.That(Foo, Should.Be.LessThan(45));
Specify.That(Foo, Should.Be.LessThanOrEqualTo(45));
```
`AtLeast` and `GreaterThanOrEqualTo` are equivalent; use whichever name is more readable. The same goes for `AtMost` and `LessThanOrEqualTo`.
## Type ##
```
Specify.That(Foo, Should.Be.OfType(TComponent));
```
## Specific values ##
```
Specify.That(Foo, Should.Be.Assigned);
Specify.That(Foo, Should.Be.Null);
Specify.That(Foo, Should.Be.True);
Specify.That(Foo, Should.Be.False);
```

# Additional options for comparisons #
## Messages ##
```
Specify.That(Frequency, Should.Equal(440), 'Frequency');
```

Specify.That() takes an optional third parameter, which corresponds directly to the Message parameter in DUnit's CheckEquals() methods. This is a must if you have more than one call to Specify.That() in a single test method.

## Negation ##
```
Specify.That(Foo, Should.Not.Equal(45));
```
Everything that supports Should... also supports Should.Not...

## Epsilons (ToWithin) ##
```
Specify.That(Foo, Should.Equal(45.0)); // default epsilon
Specify.That(Foo, Should.Equal(45.0).ToWithin(0.00001));
Specify.That(Foo, Should.Equal(45.0).Exactly); // no epsilon
```
Floating-point values are notoriously inexact. DUnitLite lets you specify an "epsilon", a number that specifies how close the values should be to be considered equal.

If you don't specify an epsilon, DUnitLite will call Delphi's SameValue function to provide a reasonable epsilon for you. You can also specify your own epsilon with .ToWithin() or .Exactly.

# Future plans #
FutureSyntax lists some possible syntax that may be added in future versions.