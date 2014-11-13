#Ruby File Tree

Make a FileTree in Ruby.

```ruby
@t = FileTree.new('path/to/dir')
```

##.to_h
Makes a Hash of Hashes whose keys are the filename and (if directory) have "children" Hashes.

```ruby
@t = FileTree.new('path/to/dir')
@t.to_h
#=> {"dir1"=>
  {:children=>
    {"file3.txt"=>
      {:children=>nil, :type=>"file", :full_path=>"test/data/dir1/file3.txt"}},
   :type=>"directory",
   :full_path=>"test/data/dir1"},
 "dir2"=>
  {:children=>
    {"dir3"=>
      {:children=>{}, :type=>"directory", :full_path=>"test/data/dir2/dir3"},
     "file3.js"=>
      {:children=>nil, :type=>"file", :full_path=>"test/data/dir2/file3.js"}},
   :type=>"directory",
   :full_path=>"test/data/dir2"},
 "file1.txt"=>
  {:children=>nil, :type=>"file", :full_path=>"test/data/file1.txt"},
 "file2.txt"=>
  {:children=>nil, :type=>"file", :full_path=>"test/data/file2.txt"}}
```

##.to_html
Makes ``<ul>`` and ``<li>`` elements out of the files.

```ruby
@t = FileTree.new('path/to/dir')
#=> "<ul><li>root</li><li><ul><li>dir1</li><li><ul><li>file3.txt</li></ul></li></ul></li><li><ul><li>dir2</li><li><ul><li>dir3</li></ul></li><li><ul><li>file3.js</li></ul></li></ul></li><li><ul><li>file1.txt</li></ul></li><li><ul><li>file2.txt</li></ul></li></ul>"
```

##.to_json
Makes JSON out of the aforementioned Hash.

```ruby
@t = FileTree.new('path/to/dir')
#=> { JSON }
```
###JSON example:
```javascript
{
  "dir1": {
    "children": {
      "file3.txt": {
        "children": null,
        "type": "file",
        "full_path": "test/data/dir1/file3.txt"
      }
    },
    "type": "directory",
    "full_path": "test/data/dir1"
  },
  "dir2": {
    "children": {
      "dir3": { "children": { }, "type": "directory", "full_path": "test/data/dir2/dir3" },
      "file3.js": {
        "children": null,
        "type": "file",
        "full_path": "test/data/dir2/file3.js"
      }
    },
    "type": "directory",
    "full_path": "test/data/dir2"
  },
  "file1.txt": { "children": null, "type": "file", "full_path": "test/data/file1.txt" },
  "file2.txt": { "children": null, "type": "file", "full_path": "test/data/file2.txt" }
}
```