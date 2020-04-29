class LfsPointers < Formula
	desc "A tool that allows you to convert a directory of large files to Git LFS pointers."
	homepage "https://lebje.github.io/LFSPointers"
	url "https://github.com/LebJe/LFSPointers.git",
		:tag => "0.11.3"
	head "https://github.com/LebJe/LFSPointers.git"
  
	depends_on :xcode => ["11.4", :build]
	depends_on "git"
	depends_on "git-lfs"
  
	def install
		system "swift build --configuration release --disable-sandbox"
		system "mv", ".build/release/LFSPointers", "LFSPointers"
		bin.install "LFSPointers"
	end
  
	test do
	  system "LFSPointers --help"
	end
  end
