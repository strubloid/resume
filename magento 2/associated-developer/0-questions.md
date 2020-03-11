# Questions

### Plugins
Q: Who is the ObjectManager, I've searched by and I could find only an interface  ObjectManagerInterface, but I could not see someone implementing it, but I could see classes calling on constructor
```
 $this->objectManager = \Magento\TestFramework\Helper\Bootstrap::getObjectManager();
 
 use Magento\TestFramework\Helper\Bootstrap;
 $this->objectManager = Bootstrap::getObjectManager();
```
Q: How can we change functionality if everyone is loading by DependencyInjection?
Q: Is it a good thing like this and why?
Q: I could see that the title it is Plugin but the folder is it Plugin or Plugins?


#### Revertable data patch
Q: How is a good Revertable Data Patch, what are the things that we should worry about while writing it?
Q: Do we have good examples for this?
Q: When should be using this approach?


#### Revertable schema patch
Q: Is it something that we do?
Q: Can I have an example of this?


