desc "Open an irb session preloaded with the aus_post gem"
task :console do
  sh "irb -I lib -r aus_post.rb"
end

desc "Display all PAC endpoints with a list of required values"
task :pac_docs do
  require_relative 'lib/aus_post'

  AusPost::PAC.instance_methods.each do |method|
    klass = "AusPost::PAC::#{method[4..-1].split("_").map(&:capitalize).join}"
    required = Kernel.const_get(klass).required_attributes
    optional = Kernel.const_get(klass).optional_attributes

    docs = ""

    docs << method.to_s
    docs << "\n"

    if !required.empty?
      docs << "  Required Attributes:\n"
      required.each { |attr| docs << "    - #{attr}\n"}
    end
    if !optional.empty?
      docs << "  Optional Attributes:\n"
      optional.each { |attr| docs << "    - #{attr}\n"}
    end
    docs << "\n"

    puts docs
  end
end
