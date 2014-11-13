require './tree'
require 'json'

describe FileTree, 'FileTree' do

  before :all do 
    @t = FileTree.new('test/data')
  end

  describe '.to_h' do 

    it 'should have a valid "full_path" value for directories and files' do
      expect(@t.to_h["dir1"]["full_path"]).to eq('test/data/dir1')
      expect(@t.to_h["file1.txt"]["full_path"]).to eq('test/data/file1.txt')
    end

    it 'should have a "children" value for a "directory" type hashes' do
      expect(@t.to_h["dir1"]["children"]).not_to be(nil)
    end

    it 'should have a nil "children" value for all "file" type hashes' do
      expect(@t.to_h["file1.txt"]["children"]).to be(nil)
    end

  end

  describe '.to_html' do 

    it 'should return a string of html' do
      expect(@t.to_html.class).to eq(String)
      expect(@t.to_html).to eq("<ul><li>root</li><li><ul><li>dir1</li><li><ul><li>file3.txt</li></ul></li></ul></li><li><ul><li>dir2</li><li><ul><li>dir3</li></ul></li><li><ul><li>file3.js</li></ul></li></ul></li><li><ul><li>file1.txt</li></ul></li><li><ul><li>file2.txt</li></ul></li></ul>")
    end

    it 'should return some html tags' do
      # TODO: for more sophisticated html validation, try nokogiri
      re = /<("[^"]*"|'[^']*'|[^'">])*>/
      expect(@t.to_html).to match(re)
    end

  end

  describe '.to_json' do 

    it 'should return valid json' do 
      expect(JSON.parse(@t.to_json)).to eq(@t.to_h)
    end
  end

end