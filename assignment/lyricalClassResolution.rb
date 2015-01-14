# lyrical.rb is your first assignment. It takes a song's input and lets you
# see how many times a word occurs in the song.
#
# Save this file as lyrical.rb. Edit it with your text editor and run the tests
# in Terminal.  The command to run the tests is:
#
#    ruby lyrical.rb
#
# Your assignment is to build out the Lyrical class to make all the tests pass.
# Since it's the first week your mark is just based on whether the code works.
# Later on we'll look at coding style and whether if "feels" like Ruby.  But
# for now just make the tests pass.
#
# You won't need to touch anything above the Lyrical class in this file, but
# you will definitely need to spend some time reading the tests to know what
# you're aiming for.
#
# Some docs that may come in handy (depending on your approach):
#
# - http://www.ruby-doc.org/core-2.1.4/String.html
# - http://www.ruby-doc.org/core-2.1.4/Hash.html
# - http://www.ruby-doc.org/core-2.1.4/Array.html
# - http://www.ruby-doc.org/core-2.1.4/Enumerable.html
#
# There is one bonus test (`test_finding_the_most_popular_word`) that you're 
# welcome to try. Just delete the `skip` line in it if you want to give it a go.
#

###
# This is where we load in the text of the song into a constant called LYRICS.
# You won't need to touch this at all.  Here's the video if you're into that
# sort of thing: https://www.youtube.com/watch?v=k4YRWT_Aldo
LYRICS = <<-TEXT
[Pre-Hook]
Shoulders sideways, smack it, smack it in the air
Legs movin' side to side, smack it in the air
Legs movin' side to side, smack you in the air
Shoulders sideways, smack it, smack it in the air
Smack it, smack it in the air
Legs movin' side to side, smack it, smack it in the air
Smack it, smack it in the air

[Hook]
Wave your hands side to side, put it in the air
Wave your hands side to side, put it in the air
Clap, clap, clap like you don't care
Smack that, clap, clap, clap, like you don't care
(I know you care)

[Verse 1]
Clap, clap, clap, clap, clap it
Foot up, my foot up
Hold up now my foot up
I'm spinnin' my foot up
Foot up yeah my foot up
I'm spinnin' my foot up
Put my foot down yeah my hands up
My hands up, my hands up
(Flexin')
Flexin' while my hands up
My hands up, my hands up
I stand up with my hands up
Then I put up, my hands up
I put up, my hands up
I put up, my hands up
Then I'm spinnin' all my hands up
(Spinnin')
Spinnin' while my hands up
(Spinnin')
Spinnin' while my hands up
(Spinnin')
Spinnin' while my hands up
Then I'm tippin' all my hands up
Spinnin', I'm spinnin', I'm spinnin' while my hands up
I'm Spinnin', I'm spinnin', I'm spinnin' while my hands up
(Drank)

[Bridge]
Hold that cup like alcohol, oh let go like alcohol
Hold that cup like alcohol
Don't you drop that alcohol
Never drop that alcohol, never drop that alcohol
I know you thinkin' about alcohol
I know I'm thinkin' bout that alcohol

[Verse 2]
Man this here like rollin' dice, man this here like rollin' dice
Seven eleven, seven eleven, seven twice, man seven twice
Man it feel like rollin' dice, man this feel like rollin' dice
Man it feel like rollin' dice
Seven twice, seven twice
Girl I'm tryna kick it with ya
Girl I'm tryna kick it with ya
Man I'm tryna kick it with ya
My feet up, I kick it with ya
Man I swear I kick it with ya
Girl I wanna kick it with ya
Man I know I kick it with ya
Yeah I spin around and I kick it with ya

[Pre-Hook] + [Hook]

[Outro]
Wave ya hands side to side
Wave ya hands side to side
Wave ya hands from side to side
Wave ya hands side to side
Ooh wee be-be freaky deaky
Think me see she pink bikini
Rock that groovy dye dashiki
Nefertiti, edges kinky
Sweatin' out my blow out
Sweatin' out my press
This trick about to go off
Mad cause I'm so fresh
Fresher than you
I'm fresher than you
Fresher than you, oh
TEXT

### This just makes the tests run.  Nothing for you to do here, either.
require 'minitest'
require 'minitest/reporters'
MiniTest.autorun
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

###
# Here is the test suite.  It shows you what result we expect from each method
# call.
class LyricalTest < MiniTest::Test
  def test_counting_words
    assert_equal 18, Lyrical.new(LYRICS).count('side')
  end

  def test_only_counting_words_with_more_than_one_letter
    assert_equal 0, Lyrical.new(LYRICS).count('I')
  end

  def test_searching_for_an_empty_string
    assert_equal 0, Lyrical.new(LYRICS).count('')
  end

  def test_searching_for_nil
    assert_equal 0, Lyrical.new(LYRICS).count(nil)
  end

  def test_searching_for_false
    assert_equal 0, Lyrical.new(LYRICS).count(false)
  end

  def test_alphabetizing_words
    assert_equal 'about', Lyrical.new(LYRICS).alphabetical.first
  end

  def test_counting_words_works_with_uppercase
    assert_equal 3, Lyrical.new(LYRICS).count('FRESHER')
  end

  def test_counting_words_works_with_lowercase
    assert_equal 3, Lyrical.new(LYRICS).count('fresher')
  end

  def test_searching_for_a_word
    assert_equal true, Lyrical.new(LYRICS).includes?('dice')
  end

  def test_searching_for_a_missing_word
    assert_equal false, Lyrical.new(LYRICS).includes?('cheeseburger')
  end

  def test_stripping_punctuation_when_parsing
    assert_equal true, Lyrical.new(LYRICS).includes?('drank')
  end

  def test_stripping_punctuation_when_searching
    assert_equal true, Lyrical.new(LYRICS).includes?('(drank)')
  end

  # bonus question
  def test_finding_the_most_popular_word
    #skip
    assert_equal 'up', Lyrical.new(LYRICS).most_popular
  end
end


### 
# Here's the Lyrical class that you will be editing.
#
# A few things to keep in mind:
#
# - keep your methods short
# - regular expressions are great for manipulating text
# - one approach is to to break the text into individual words with their counts 
#   when the class is created (a Hash would be perfect) - this is also a good time 
#   to process the text in any ways that you're going to need

class Lyrical
  def initialize(lyrics)
    #remove all especial and number characters
    @lyrics = lyrics;
  end

  # this should return a Boolean (true or false)
  def includes?(word)
  end

  # this should return a Numbers
  def count(word)
  end

  # this should return a String
  def most_popular
  end

  # this should return an Array
  def alphabetical
  end

  private

  # put any methods here that you might need internally but that won't be 
  # called by from outside the class
end
