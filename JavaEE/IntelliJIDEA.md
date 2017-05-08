# IntelliJ IDEA 

### 设置

#### `JSTL`设置

+ 下载`JSTL`包，地址[http://archive.apache.org/dist/jakarta/taglibs/standard/binaries/](http://archive.apache.org/dist/jakarta/taglibs/standard/binaries/)

+ 解压`JSTL`包

+ 打开`IDEA`的`setting`，然后搜索`DTDS`，找到`Schemas and DTDS`，接着点击`External Schemas and DTDs`窗口右侧的`+`号，输入`http://java.sun.com/jsp/jstl/core`，在`Exporer`中浏览文件并找到下载的`JSTL`目录下的`tld`下的`c.tld`，选中

+ 在`project`的`web`下的`WEB-INF`下新建一个`lib`目录

+ 把`JSTL`目录下的两个`.jar`文件拷贝到新建的`lib`目录下

+ 示例

  ```java
  <%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <html>
    <head>
      <title>IntelliJ IDEA 测试</title>
    </head>
    <body>
      intellj IDEA JSTL 测试
      <c:out value="测试" />
    </body>
  </html>
  ```

  ​