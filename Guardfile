# Run JS and CoffeeScript files in a typical Rails 3.1 fashion, placing Underscore templates in app/views/*.jst
# Your spec files end with _spec.{js,coffee}.

spec_location = "spec/%s_spec.coffee"

# uncomment if you use NerdCapsSpec.js
# spec_location = "spec/javascripts/%sSpec"

guard "jasmine-headless-webkit" do
  watch %r{^lib/microbat/.*?\.coffee$}
  watch %r{^spec/.*?_spec\.coffee$}
end

