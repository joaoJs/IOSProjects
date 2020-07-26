# ReferenceVsValueTypes Assignment

Research over the weekend further into Reference types and Value types outside what has been discussed in class. 

Write a small one page paper on:
    -What each is (reference and value type)
    -how are they different 
    -how they are utilized in iOS, Swift, and ObjC
    -pros and cons to either 
    
Write a flow chart on when it is better to use one vs the other.
    -Recommendation for this is to create a UML diagram flow chart
    -Look up Lucid Chart, it is a free diagram creating tool that is useful, but others can be used as well. (Lucid Chart just integrates seamlessly with common task tracking tools such as JIRA)
    -There will be times you will be expected to desing a system, so it is wise to familiarize yourself with UML diagrams early rather then on the job



# Reference vs Value types



Swift. 
Value Types: Each instance has a unique copy of its data. (Struct, Enum, Tuple)
Reference type: Instances shate a single copy of the data (Class)

Differences 
When copying a value type, a new instance is created so data is only changed in a specific instance of the element. For example:

struct valueTypeStruct { var data: Int = 5 }
var  valueTypeStructA = valueTypeStruct()
var valueTypeStructB = valueTypeStructA                       // valueTypeStructA is copied to valueTypeStructB
valueTypeStructA.data = 10                        // Changes valueTypeStructA, not valueTypeStructB
println("\(valueTypeStructA.data), \(valueTypeStructB.data)")    //"10, 5"

class referenceTypeClass { var data: Int = 5 }
var  referenceTypeClassA = referenceTypeClass()
var referenceTypeClassB = referenceTypeClassA        // referenceTypeClassB and referenceTypeClassA share the same instance of referenceTypeClass
referenceTypeClassA.data = 10                        // Changes both
println("\(referenceTypeClassA.data), \(referenceTypeClassB.data)")    //"10, 10"

Objective-C
In Objective-C, data types are represented as @class. @class is a reference type. So instances of that object will share and refer to the same address in memory.

MyNumber* a = [[MyNumber alloc ] init];
a.data = 5
MyNumber* b = a
b.count = 10
print(a.count) // 10

Reference types are good when different parts of your program need to share and mutate an instance and you don't want this instance to have multiple copies. For example, a unique User. On the other hand, in a multithreading environment, you might want to make copies of the instances, so that you can avoid side effects due threading issued and unpredicted behavior. Other advantages of value type: 

Efficiency. Allocating memory in the stack is faster than in the heap.
Memory management.  With reference types, two class instances that hold strong references to each other prevent each other from being deallocated. It can cause memory leak. With value types, there are no references, and so this problem does not arise. 


UML Diagram: https://app.lucidchart.com/invitations/accept/ba1394fe-817c-469c-8ab5-bff06e6b0231



