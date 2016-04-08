
```
// Type:
Specify.That(Foo, Should.DescendFrom(TComponent));
Specify.That(Foo, Should.Implement(IBar));

// String:
Specify.That(Foo, Should.Contain('Bar'));
Specify.That(Foo, Should.StartWith('Bar'));
Specify.That(Foo, Should.EndWith('Bar'));

// Case-insensitive string comparisons:
Specify.That(Foo, Should.Equal('Bar').IgnoringCase);
Specify.That(Foo, Should.Contain('Bar').IgnoringCase);
Specify.That(Foo, Should.StartWith('Bar').IgnoringCase);
Specify.That(Foo, Should.EndWith('Bar').IgnoringCase);

// Numeric:
Specify.That(Foo, Should.Be.Even);
Specify.That(Foo, Should.Be.Negative);
Specify.That(Foo, Should.Be.Odd);
Specify.That(Foo, Should.Be.Positive);
```