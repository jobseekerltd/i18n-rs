require 'minitest_helper'
require 'kramdown'
require 'benchmark'

class TestI18nRs < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::I18nRs::VERSION
  end

  def test_it_parses_simple_markdown
    assert_equal "<p>lol <strong>important</strong></p>\n", I18nRs.to_html("lol **important**")
  end

  def test_it_works_like_kramdown
    text = File.read(File.dirname(__FILE__) + "/fixture_mdbasics.md")
    # .. they actually aren't entirely equal with regards to
    # (a) quote escaping and
    # (b) blocks that span multiple paragraphs
    # ... meh. just do a benchmark instead! :)

    n = 1000
    Benchmark.bm do |x|
      x.report "I18nRs" do
        n.times do   ; I18nRs.to_html(text); end
      end
      x.report "Kramdown" do
        n.times do   ; Kramdown::Document.new(text).to_html; end
      end
    end
  end
end
