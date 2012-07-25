guard :coffeescript, all_on_start: true, input: "lib/microbat"
guard :coffeescript, all_on_start: true, input: "spec"

jasmine_options = {
  server:      :jasmine_gem,
  spec_dir:    "spec",
  jasmine_url: "http://localhost:8888/"
}
guard :jasmine, jasmine_options do
  watch(%r{^lib/microbat/(.+?)\.coffee$}) {|m| "spec/#{m[1]}_spec.coffee" }
  watch(%r{^spec/.+_spec\.coffee$})
end
