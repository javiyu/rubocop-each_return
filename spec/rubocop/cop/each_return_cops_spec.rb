RSpec.describe(RuboCop::Cop::EachReturnValue, :config) do
  subject(:cop) { described_class.new(config) }

  it "adds an offense when using the return value of an each block" do
    expect_offense(<<~RUBY)
      value = a.each {|x| x}
      ^^^^^^^^^^^^^^^^^^^^^^ Do not use the return value of .each
    RUBY

    expect_correction(<<~RUBY)
      a.each {|x| x}
    RUBY
  end

  it "adds an offense and corrects node when using the return value of an each block when calling an array" do
    expect_offense(<<~RUBY)
      value = [1,2,3].each {|x| x}
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Do not use the return value of .each
    RUBY

    expect_correction(<<~RUBY)
      [1,2,3].each {|x| x}
    RUBY
  end
end

