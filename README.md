# Log File Parser *(coding test)*

## Problem:

1. A script that receives a log as argument (eg. `webserver.log`)
2. Returns the following:
   1. List of webpages with most page views ordered from most pages views to less page views
   2. List of webpages with most unique page views also ordered



## Solution:

Run this in your terminal:

```
./parser.rb FILE_PATH
```

**Output would look like:**
```
{
           "Page Views" => {
            "/about" => 171,
          "/contact" => 89,
            "/index" => 82,
        "/help_page" => 80,
             "/home" => 78
    },
    "Unique Page Views" => {
            "/about/2" => 90,
            "/contact" => 89,
              "/index" => 82,
              "/about" => 81,
        "/help_page/1" => 80,
               "/home" => 78
    }
}
```