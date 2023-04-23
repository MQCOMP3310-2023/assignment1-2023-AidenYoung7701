//A.1.11
import java

from Call c, Method m
where
  (
  m = c.getCallee() and
  m.hasName("println") and
  c.getArgument(0).toString() = "getMessage(...)" and
  c.getArgument(0).getAChildExpr().getType() instanceof ThrowableType
  )
  or
  (
   m = c.getCallee() and
  m.hasName("printStackTrace") and
  m.getNumberOfParameters() = 0 and
  m.getDeclaringType()
      .getSourceDeclaration()
      .getASourceSupertype*()
      .hasQualifiedName("java.lang", "Throwable")

  )
select c, c.getCaller()