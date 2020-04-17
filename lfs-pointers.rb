class LfsPointers < Formula
	desc "A tool that allows you to convert a directory of large files to Git LFS pointers."
	homepage "https://github.com/LebJe/LFSPointers"
	url "https://github.com/LebJe/LFSPointers.git",
		:tag => "0.0.9"
	head "https://github.com/LebJe/LFSPointers.git"
  
	depends_on :xcode => ["11.4", :build]
  
	def install
		system "swift build --configuration release --disable-sandbox"
		system "mv", ".build/release/LFSPointers", "LFSPointers"
		bin.install "LFSPointers"
	end
  
	test do
	  system "LFSPointers --help"
	end
  end